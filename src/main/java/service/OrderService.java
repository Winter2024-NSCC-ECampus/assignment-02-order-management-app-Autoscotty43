package service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.Order;
import model.Product;
import model.User;
import repository.OrderRepository;
import repository.ProductRepository;
import repository.UserRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    public OrderService(OrderRepository orderRepository, ProductRepository productRepository, UserRepository userRepository) {
        this.orderRepository = orderRepository;
        this.productRepository = productRepository;
        this.userRepository = userRepository;
    }

    // Get all orders
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    // Get order by ID
    public Optional<Order> getOrderById(Long id) {
        return orderRepository.findById(id);
    }

    // Place an order
    @Transactional
    public Order placeOrder(Long userId, Long productId, int quantity) {
        Optional<User> user = userRepository.findById(userId);
        Optional<Product> product = productRepository.findById(productId);

        if (user.isEmpty() || product.isEmpty()) {
            throw new RuntimeException("User or Product not found");
        }

        Product prod = product.get();
        if (prod.getStock() < quantity) {
            throw new RuntimeException("Insufficient stock");
        }

        // Reduce stock and save product
        prod.setStock(prod.getStock() - quantity);
        productRepository.save(prod);

        // Create and save order
        Order order = new Order();
        order.setUser(user.get());
        order.setProduct(prod);
        order.setQuantity(quantity);
        order.setTotalPrice(prod.getPrice() * quantity);
        order.setStatus("Pending");

        return orderRepository.save(order);
    }

    // Cancel order and refund stock
    @Transactional
    public void cancelOrder(Long id) {
        Optional<Order> order = orderRepository.findById(id);
        if (order.isPresent()) {
            // Refund stock
            Product product = order.get().getProduct();
            product.setStock(product.getStock() + order.get().getQuantity());
            productRepository.save(product);

            orderRepository.deleteById(id);
        } else {
            throw new RuntimeException("Order not found");
        }
    }

    // Update order status
    public Order updateOrderStatus(Long id, String status) {
        return orderRepository.findById(id).map(order -> {
            order.setStatus(status);
            return orderRepository.save(order);
        }).orElseThrow(() -> new RuntimeException("Order not found"));
    }

    // Additional method to get orders by user
    public List<Order> getOrdersByUser(Long userId) {
        return orderRepository.findByUserId(userId);
    }

    public void saveOrder(Order order) {
        orderRepository.save(order);
    }
}
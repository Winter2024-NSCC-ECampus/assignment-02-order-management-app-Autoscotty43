package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.Order;
import model.Product;
import service.OrderService;
import service.ProductService;
import service.UserService;

@Controller
@RequestMapping("/orders")
public class OrderController {
    private final OrderService orderService;
    private final ProductService productService;
    private final UserService userService;

    public OrderController(OrderService orderService, ProductService productService, UserService userService) {
        this.orderService = orderService;
        this.productService = productService;
        this.userService = userService;
    }

    // Show all orders
    @GetMapping
    public String getAllOrders(Model model) {
        List<Order> orders = orderService.getAllOrders();
        model.addAttribute("orders", orders);
        return "order/list";
    }

    // Show a form to create a new order
    @GetMapping("/create")
    public String showCreateOrderForm(Model model) {
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "order/create";
    }

    // Handle form submission to create a new order
    @PostMapping("/create")
    public String createOrder(@RequestParam("userId") Long userId, @RequestParam("productId") Long productId, @RequestParam("quantity") int quantity) {
        orderService.placeOrder(userId, productId, quantity);
        return "redirect:/orders";
    }

    // Show a form to update the status of an order
    @GetMapping("/edit/{id}")
    public String showEditOrderStatusForm(@PathVariable("id") Long id, Model model) {
        Order order = orderService.getOrderById(id).orElseThrow(() -> new RuntimeException("Order not found"));
        model.addAttribute("order", order);
        return "order/edit";
    }

    // Handle form submission to update the order status
    @PostMapping("/edit/{id}")
    public String updateOrderStatus(@PathVariable("id") Long id, @RequestParam("status") String status) {
        orderService.updateOrderStatus(id, status);
        return "redirect:/orders";
    }

    // Cancel an order
    @GetMapping("/cancel/{id}")
    public String cancelOrder(@PathVariable("id") Long id) {
        orderService.cancelOrder(id);
        return "redirect:/orders";
    }

    // Show orders by user
    @GetMapping("/user/{userId}")
    public String getOrdersByUser(@PathVariable("userId") Long userId, Model model) {
        List<Order> orders = orderService.getOrdersByUser(userId);
        model.addAttribute("orders", orders);
        return "order/userOrders";
    }
}
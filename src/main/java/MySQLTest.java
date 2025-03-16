import java.sql.Connection;
import java.sql.DriverManager;

public class MySQLTest {
    public static void main(String[] args) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/order_management";
        String username = "root";
        String password = "Jelloverse1419";

        try {
            System.out.println("Connecting to database...");
            Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
            System.out.println("Database connected successfully!");
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Database connection failed!");
        }
    }
}
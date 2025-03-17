# Order Management Application

This is a simple web application for managing orders and products. It is built using Spring Boot, Spring MVC, Spring Data JPA, Spring Security, and JSPs for the front-end. MySQL is used as the database.

## Technologies Used

* **Java:** 22 (as indicated in the logs)
* **Spring Boot:** 3.2.4
* **Spring MVC**
* **Spring Data JPA:** For database interaction
* **Spring Security:** For authentication and authorization
* **JSP (Jakarta Server Pages):** For the user interface
* **MySQL:** As the relational database
* **Maven:** For build management
* **Tomcat Embedded:** Servlet container (configured via Spring Boot Starter Tomcat)

## Project Structure

![image](https://github.com/user-attachments/assets/1cef6497-acf7-47ad-b253-0fe15f70d255)

## Screenshots 

![image](https://github.com/user-attachments/assets/f51faf4b-57cd-4fb2-95e9-5576d86ceff5)


## Setup and Running the Application

1.  **Prerequisites:**
    * Java Development Kit (JDK) - Version 22 or a compatible version.
    * Maven - Installation instructions can be found at [https://maven.apache.org/install.html](https://maven.apache.org/install.html).
    * MySQL Server - Running and accessible.

2.  **Clone the Repository:**
    ```bash
    git clone <repository_url>
    cd OrderManagement
    ```

3.  **Configure Database Connection:**
    * Open the `src/main/resources/application.properties` file.
    * Update the following properties to match your MySQL database configuration:
        ```properties
        spring.datasource.url=jdbc:mysql://localhost:3306/your_database_name?serverTimezone=UTC
        spring.datasource.username=your_mysql_username
        spring.datasource.password=your_mysql_password
        spring.jpa.hibernate.ddl-auto=update
        spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect
        ```
        *(Replace `your_database_name`, `your_mysql_username`, and `your_mysql_password` with your actual database details.)*
    * The `spring.jpa.hibernate.ddl-auto=update` property will automatically update your database schema based on your JPA entities on application startup. For production environments, consider using a database migration tool like Flyway or Liquibase.

4.  **Build the Application:**
    ```bash
    mvn clean install
    ```
    This command will download all necessary dependencies, compile the code, and package the application as a WAR file in the `target` directory.

5.  **Run the Application:**
    You can run the application using the Spring Boot Maven plugin:
    ```bash
    mvn spring-boot:run
    ```
    Alternatively, you can deploy the generated `OrderManagement.war` file to a standalone Tomcat 10.1.x or later server.

6.  **Access the Application:**
    Once the application is running, you can access it in your web browser at:
    ```
    http://localhost:8080/OrderManagement/
    ```
    *(Assuming Tomcat is running on the default port 8080 and the application context path is `/OrderManagement`, which is inferred from the project name.)*

## Troubleshooting - Impact of an Infected Environment

During the development of this application, significant challenges were encountered due to a potentially infected development environment. This resulted in:

* **Unexpected dependency issues:** Even after carefully managing the project's `pom.xml` file and removing specific dependencies (such as those related to `r2dbc` and `h2`), the application continued to exhibit errors related to those non-existent dependencies. This suggested that the build process or the development environment itself was being influenced by external, unwanted factors.
* **Persistent `NoClassDefFoundError`:** The application repeatedly failed to start with `NoClassDefFoundError` exceptions for classes that were confirmed to be absent from the project's dependencies and the local Maven repository. This indicated a deeper problem than just misconfigured project files.
* **Difficulty in achieving a clean build:** Standard Maven commands like `clean install` and Eclipse project cleaning operations did not consistently resolve the dependency errors, suggesting that the environment was interfering with the intended build process.

These issues highlight the critical importance of a clean and trustworthy development environment. An infected or misconfigured environment can lead to significant time spent debugging phantom errors that are not directly related to the project's codebase or intended dependencies. In this case, the persistent errors despite correct project configuration strongly implied external interference.

If you encounter similar issues, consider the following:

* **Scanning your development environment for malware.**
* **Creating a new, clean development environment (e.g., a new virtual machine or a fresh installation of your operating system and development tools).**
* **Verifying the integrity of your build tools (Maven, JDK, Eclipse).**

By ensuring a clean environment, you can have greater confidence that build and runtime errors are directly related to your project's configuration and code, rather than external factors.

## Further Development

This is a basic structure. Further development could include:

* Implementing full CRUD (Create, Read, Update, Delete) operations for orders and products.
* Adding user authentication and authorization using Spring Security.
* Improving the user interface with more advanced UI frameworks.
* Implementing proper error handling and validation.
* Adding unit and integration tests.

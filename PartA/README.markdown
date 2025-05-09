# Shopping Cart System

## Overview
This is a PHP-based shopping cart system that allows users to browse products, add them to a cart, manage cart items, place orders, and view order details. The system includes features for adding products, checking out, and tracking order status. It uses a MySQL database to store product, cart, and order information, and incorporates a simple user identification system via cookies.

## Features
- **Product Management**: Add products with names, prices, and images.
- **Shopping Cart**: Add products to the cart, update quantities, delete items, or empty the cart.
- **Checkout**: Place orders with billing and address details, supporting multiple payment methods.
- **Order Management**: View order history and details, with the ability to cancel orders.
- **User Identification**: Generates a unique user ID stored in a cookie for tracking cart and orders.
- **Responsive Design**: Uses CSS and Font Awesome for a user-friendly interface.
- **Alerts**: SweetAlert for user feedback on actions like adding to cart or placing orders.

## Prerequisites
To run this project, you need the following:
- **Web Server**: Apache or Nginx
- **PHP**: Version 7.4 or higher
- **MySQL**: Version 5.7 or higher
- **Composer**: Optional, for dependency management (not strictly required for this project)
- **Browser**: Modern browser (Chrome, Firefox, etc.)
- **Dependencies**:
  - Font Awesome (loaded via CDN)
  - SweetAlert (loaded via CDN)

## Installation Instructions

### Step 1: Download the Project

- Place the project folder in your web server's root directory (e.g., `htdocs` for XAMPP, `www` for WAMP, or `/var/www/html` for Linux).

### Step 2: Set Up the Database
1. **Create a MySQL Database**:
   - Access your MySQL server (via phpMyAdmin, MySQL Workbench, or command line).
   - Create a new database, e.g., `shop_db`.
     ```sql
     CREATE DATABASE shop_db;
     ```

2. **Import the Database Schema**:
   - The project requires three tables: `products`, `cart`, and `orders`. 
   - Import the `shop_db.sql` file using phpMyAdmin:
     - Go to the `Import` tab, choose the `database.sql` file, and click `Go`.
     

### Step 3: Configure Database Connection
1. Open the `components/connect.php` file.
2. Update the database credentials to match your MySQL setup:
   ```php
   <?php
   $db_host = 'localhost';
   $db_user = 'your_username';
   $db_pass = 'your_password';
   $db_name = 'shop_db';

   try {
       $conn = new PDO("mysql:host=$db_host;dbname=$db_name", $db_user, $db_pass);
       $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
   } catch(PDOException $e) {
       echo "Connection failed: " . $e->getMessage();
   }
   ?>
   ```
3. Save the file.

### Step 4: Set Up the File Structure
1. Ensure the `uploaded_files` directory exists in the project root to store product images.
   
2. Verify that the following files are in place:
   - `add_product.php`
   - `checkout.php`
   - `orders.php`
   - `shopping_cart.php`
   - `view_order.php`
   - `view_products.php`
   - `components/connect.php`
   - `components/header.php`
   - `components/alert.php`
   - `css/style.css`
   - `js/script.js`

### Step 5: Run the Project
1. Start your web server (e.g., Apache) and MySQL server (e.g., via XAMPP, WAMP, or manually).
2. Access the project in your browser:
   - If using localhost: `http://localhost/your_project_folder/view_products.php`
3. The `view_products.php` page is the main entry point to browse products.

### Step 6: Test the Application
1. **Add a Product**:
   - Navigate to `add_product.php`, fill in the product details (name, price, image), and submit.
   - Ensure the image is less than 2MB.
2. **Browse and Add to Cart**:
   - Go to `view_products.php`, select a product, set a quantity, and click "Add to Cart."
3. **Manage Cart**:
   - Visit `shopping_cart.php` to update quantities, delete items, or empty the cart.
4. **Checkout**:
   - Proceed to `checkout.php` from the cart or use the "Buy Now" option on a product.
   - Fill in billing and address details and place the order.
5. **View Orders**:
   - Go to `orders.php` to see your order history.
   - Click an order to view details in `view_order.php` and cancel if not yet delivered.

## File Descriptions
- **add_product.php**: Form to add new products with name, price, and image.
- **checkout.php**: Handles order placement with billing and address details.
- **orders.php**: Displays a user's order history.
- **shopping_cart.php**: Manages cart items (update, delete, empty).
- **view_order.php**: Shows detailed information about a specific order.
- **view_products.php**: Lists all products with options to add to cart or buy now.
- **components/connect.php**: Database connection configuration.
- **components/header.php**: Common header for navigation.
- **components/alert.php**: Handles success and warning messages using SweetAlert.
- **css/style.css**: Styles for the application.
- **js/script.js**: Client-side JavaScript for interactivity.
- **uploaded_files/**: Directory for storing product images.

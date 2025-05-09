# Part B: Login System - Practice004

## Overview
This sub-project is a PHP-based login and signup system using PDO for secure database interactions. It allows users to register with a username, password, and email, log in, and log out, with robust session management and error handling displayed on the page. The system uses a modular structure with separate files for views, models, and controllers.

## Features
- **Signup**: Register with username, password, and email, with validation for empty inputs, invalid email, and duplicate username/email.
- **Login**: Authenticate using username and password, with error messages for incorrect credentials.
- **Logout**: Terminate user session and redirect to homepage.
- **Session Security**: Uses custom session IDs, regeneration every 30 minutes, and secure cookie settings.
- **Error Handling**: Displays signup/login errors on the page and retains valid form inputs.

## Prerequisites
- **Web Server**: Apache
- **PHP**: Version 7.4+
- **MySQL**: Version 5.7+
- **Browser**: Modern browser (Chrome, Firefox, etc.)

## Installation

### Step 1: Set Up Project Files
1. Place the project files in your web server’s root directory (e.g., `htdocs` for XAMPP).
2. Ensure the following structure:
   ```
   Practice004/
   ├── includes/
   │   ├── config_session.inc.php
   │   ├── dbh.inc.php
   │   ├── login.inc.php
   │   ├── login_contr.inc.php
   │   ├── login_model.inc.php
   │   ├── login_view.inc.php
   │   ├── logout.inc.php
   │   ├── signup.inc.php
   │   ├── signup_contr.inc.php
   │   ├── signup_model.inc.php
   │   ├── signup_view.inc.php
   ├── css/
   │   ├── reset.css
   │   ├── main.css
   ├── index.php
   ├── db.sql
   ```

### Step 2: Configure Database
1. Create a MySQL database named `myfirstdatabase`:
   ```sql
   CREATE DATABASE myfirstdatabase;
   ```
2. Import the `db.sql` file to create the `users` table:
   ```sql
   USE myfirstdatabase;
   CREATE TABLE users (
       id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
       username VARCHAR(30) NOT NULL,
       pwd VARCHAR(255) NOT NULL,
       email VARCHAR(100) NOT NULL,
       created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
   );
   ```
   - Use phpMyAdmin: Import `db.sql` via the `Import` tab.

3. Update database credentials in `includes/dbh.inc.php`:
   ```php
   $host = 'localhost';
   $dbname = 'myfirstdatabase';
   $dbusername = 'root';
   $dbpassword = 'your_password';
   $pdo = new PDO("mysql:host=$host;port=3307;dbname=$dbname", $dbusername, $dbpassword);
   ```
   - Adjust `port` (default: 3306) and credentials as needed.

### Step 3: Run the Project
1. Start Apache and MySQL (e.g., via XAMPP).
2. Access `http://localhost/your_project_folder/index.php` in a browser.

## Usage
- **Signup**: Fill in username, password, and email in the signup form on `index.php`. Submit to register.
- **Login**: Enter username and password in the login form (visible when not logged in). Submit to authenticate.
- **Logout**: Click the logout button to end the session.
- **Homepage**: Displays username if logged in, or login/signup forms if not.

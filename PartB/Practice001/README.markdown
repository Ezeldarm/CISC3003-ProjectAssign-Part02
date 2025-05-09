# Part B: Login System - Practice001

## Overview
This sub-project is a PHP-based login and signup system using object-oriented programming. It allows users to register with a username, password, and email, and log in to access a personalized homepage. The system uses MySQL for data storage, password hashing for security, and session management for user authentication.

## Features
- **Signup**: Register with a username, email, and password (with validation for empty inputs, username format, email format, and password matching).
- **Login**: Authenticate using username or email and password.
- **Logout**: End user session and redirect to the homepage.
- **Dynamic Navigation**: Displays username and logout option for logged-in users, or signup/login links for guests.
- **Error Handling**: Redirects with error messages for invalid inputs, duplicate users, or failed queries.

## Prerequisites
- **Web Server**: Apache
- **PHP**: Version 7.4+
- **MySQL**: Version 5.7+
- **Browser**: Modern browser (Chrome, Firefox, etc.)
- **Dependencies**: Google Fonts (Roboto, loaded via CDN)

## Installation

### Step 1: Set Up Project Files
1. Place the project files in your web server’s root directory (e.g., `htdocs` for XAMPP).
2. Ensure the following structure:
   ```
   Practice001/
   ├── classes/
   │   ├── dbh.classes.php
   │   ├── login.classes.php
   │   ├── login-contr.classes.php
   │   ├── signup.classes.php
   │   ├── signup-contr.classes.php
   ├── includes/
   │   ├── login.inc.php
   │   ├── logout.inc.php
   │   ├── signup.inc.php
   ├── index.php
   ├── style.css
   ├── db.sql
   ```

### Step 2: Configure Database
1. Create a MySQL database named `ooplogin`:
   ```sql
   CREATE DATABASE ooplogin;
   ```
2. Import the `db.sql` file to create the `users` table:
   ```sql
   USE ooplogin;
   CREATE TABLE users (
       users_id int(11) AUTO_INCREMENT PRIMARY KEY not null,
       users_uid TINYTEXT not null,
       users_pwd LONGTEXT not null,
       users_email TINYTEXT not null
   );
   ```
   - Use phpMyAdmin: Import `db.sql` via the `Import` tab.

3. Update database credentials in `classes/dbh.classes.php`:
   ```php
   $username = "root";
   $password = "your_password";
   $dbh = new PDO('mysql:host=localhost;port=3307;dbname=ooplogin', $username, $password);
   ```
   - Adjust `port` (default: 3306) and credentials as needed.

### Step 3: Run the Project
1. Start Apache and MySQL (e.g., via XAMPP).
2. Access `http://localhost/your_project_folder/index.php` in a browser.

## Usage
- **Signup**: Enter a username, password, repeat password, and email in the signup form. Submit to register.
- **Login**: Enter username or email and password in the login form. Submit to authenticate.
- **Logout**: Click "LOGOUT" in the navigation bar when logged in.
- **Homepage**: View dynamic navigation based on login status and a promotional section.

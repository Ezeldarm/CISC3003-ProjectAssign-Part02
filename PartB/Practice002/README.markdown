# Part B: Login System - Practice002

## Overview
This sub-project is a procedural PHP-based login and signup system using MySQLi. Users can register with a full name, email, username, and password, log in using their username or email, and log out. The system uses session management for authentication and displays error messages on the signup/login pages for user feedback.

## Features
- **Signup**: Register with full name, email, username, and password, with validation for empty inputs, username format, email format, password matching, and duplicate usernames/emails.
- **Login**: Authenticate using username or email and password.
- **Logout**: Terminate user session and redirect to homepage.
- **Error Handling**: Displays error messages for invalid inputs, wrong login credentials, or database errors.
- **Dynamic Content**: Shows a personalized greeting for logged-in users on the homepage.

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
   Practice002/
   ├── includes/
   │   ├── dbh.inc.php
   │   ├── functions.inc.php
   │   ├── login.inc.php
   │   ├── signup.inc.php
   ├── index.php
   ├── login.php
   ├── signup.php
   ├── logout.php
   ├── header.php
   ├── footer.php
   ├── database.sql
   ```

### Step 2: Configure Database
1. Create a MySQL database named `phpproject01`:
   ```sql
   CREATE DATABASE phpproject01;
   ```
2. Import the `database.sql` file to create the `users` table:
   ```sql
   USE phpproject01;
   CREATE TABLE users (
       usersId int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
       usersName varchar(128) NOT NULL,
       usersEmail varchar(128) NOT NULL,
       usersUid varchar(128) NOT NULL,
       usersPwd varchar(128) NOT NULL
   );
   ```
   - Use phpMyAdmin: Import `database.sql` via the `Import` tab.

3. Update database credentials in `includes/dbh.inc.php`:
   ```php
   $servername = "localhost:3307";
   $dBUsername = "root";
   $dBPassword = "your_password";
   $dBName = "phpproject01";
   ```
   - Adjust `servername` (default: `localhost:3306`) and credentials as needed.

### Step 3: Run the Project
1. Start Apache and MySQL (e.g., via XAMPP).
2. Access `http://localhost/your_project_folder/index.php` in a browser.

## Usage
- **Signup**: Go to `signup.php`, enter full name, email, username, password, and repeat password. Submit to register.
- **Login**: Go to `login.php`, enter username or email and password. Submit to authenticate.
- **Logout**: Access `logout.php` to end the session.
- **Homepage**: View `index.php` for a greeting (if logged in) and category placeholders.

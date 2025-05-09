# Part B: - Practice005

## Overview
This sub-project is a PHP-based login and signup system using MySQLi, featuring a secure password reset mechanism. Users can register, log in, log out, and request a password reset via email with a tokenized link. The system uses prepared statements, password hashing, and session management for security.

## Features
- **Signup**: Register with username, email, and password, with validation for empty inputs, invalid username/email, and duplicate usernames.
- **Login**: Authenticate using username or email and password.
- **Logout**: Terminate user session.
- **Password Reset**: Request a reset link via email, using a selector and token for security, and update password via a form.
- **Error Handling**: Displays error/success messages for signup, login, and password reset.

## Prerequisites
- **Web Server**: Apache
- **PHP**: Version 7.4+
- **MySQL**: Version 5.7+
- **Mail Server**: Configured SMTP server for `mail()` function (e.g., Gmail, Mailtrap)
- **Browser**: Modern browser (Chrome, Firefox, etc.)

## Installation

### Step 1: Set Up Project Files
1. Place the project files in your web server’s root directory (e.g., `htdocs` for XAMPP).
2. Ensure the following structure:
   ```
   Practice005/
   ├── includes/
   │   ├── dbh.inc.php
   │   ├── login.inc.php
   │   ├── logout.inc.php
   │   ├── signup.inc.php
   │   ├── reset-request.inc.php
   │   ├── reset-password.inc.php
   ├── css/
   │   ├── style.css
   ├── index.php
   ├── signup.php
   ├── reset-password.php
   ├── create-new-password.php
   ├── header.php
   ├── footer.php
   ├── pwdreset-table-database.sql
   ```

### Step 2: Configure Database
1. Create a MySQL database (e.g., `login_system`):
   ```sql
   CREATE DATABASE login_system;
   ```
2. Import the `pwdreset-table-database.sql` file and create the `users` table:
   ```sql
   USE login_system;
   CREATE TABLE users (
       idUsers INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
       uidUsers VARCHAR(30) NOT NULL,
       emailUsers VARCHAR(100) NOT NULL,
       pwdUsers VARCHAR(255) NOT NULL
   );
   CREATE TABLE pwdReset (
       pwdResetId INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
       pwdResetEmail TEXT NOT NULL,
       pwdResetSelector TEXT NOT NULL,
       pwdResetToken LONGTEXT NOT NULL,
       pwdResetExpires TEXT NOT NULL
   );
   ```
   - Use phpMyAdmin: Import `pwdreset-table-database.sql` and run the `users` table query.

3. Update database credentials in `includes/dbh.inc.php` (assumed structure):
   ```php
   $conn = mysqli_connect('localhost:3307', 'root', 'your_password', 'login_system');
   if (!$conn) {
       die("Connection failed: " . mysqli_connect_error());
   }
   ```
   - Adjust `port` (default: 3306) and credentials as needed.

### Step 3: Configure XAMPP for PHP Mail
1. Open the XAMPP `php.ini` file (e.g., `C:\xampp\php\php.ini`).
2. Locate the `[mail function]` section and configure SMTP settings (e.g., for Gmail):
   ```ini
   SMTP = smtp.gmail.com
   smtp_port = 587
   sendmail_from = your_email@gmail.com
   sendmail_path = "\"C:\xampp\sendmail\sendmail.exe\" -t"
   ```
3. Open the XAMPP `sendmail.ini` file (e.g., `C:\xampp\sendmail\sendmail.ini`).
4. Configure the SMTP settings:
   ```ini
   smtp_server=smtp.gmail.com
   smtp_port=587
   smtp_ssl=tls
   auth_username=your whitlock=1
   auth_password=your_email@gmail.com
   auth_password=your_password
   force_smtp=0
   ```
   - For Gmail, generate an App Password from your Google Account settings (under Security > 2-Step Verification) and use it as `auth_password`.
   - Alternatively, in my project, I use my 163 mail to implement it.

5. Save both files and restart Apache via the XAMPP Control Panel.
6. Test email sending by requesting a password reset in `reset-password.php`.

### Step 4: Run the Project
1. Start Apache and MySQL (e.g., via XAMPP).
2. Access `http://localhost/your_project_folder/index.php` in a browser.

## Usage
- **Signup**: Go to `signup.php`, enter username, email, password, and repeat password. Submit to register.
- **Login**: On `index.php`, enter username/email and password (assumed form in `header.php`). Submit to authenticate.
- **Logout**: Click logout link (assumed in `header.php`) to end session.
- **Password Reset**: Go to `reset-password.php`, enter email to receive a reset link. Click the link to access `create-new-password.php` and set a new password.

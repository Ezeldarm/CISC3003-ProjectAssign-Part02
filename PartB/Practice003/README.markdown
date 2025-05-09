# Part B: - Practice003

## Overview
This sub-project extends Practice001’s PHP-based login/signup system by adding user profile management. It allows logged-in users to view and update their profile information, including an about section, intro title, and intro text, stored in a MySQL database. The system uses object-oriented PHP, session management, and HTML sanitization for security.

## Features
- **Login/Signup**: Inherits Practice001’s functionality for user registration and login.
- **Profile Page**: Displays user’s username, about section, intro title, intro text, and static posts.
- **Profile Settings**: Update about section, intro title, and intro text via a form.
- **Security**: Sanitizes form inputs using `htmlspecialchars()` and hashes passwords (from Practice001).
- **Dynamic Navigation**: Shows username and logout option for logged-in users (Practice001).

## Prerequisites
- **Web Server**: Apache
- **PHP**: Version 7.4+
- **MySQL**: Version 5.7+
- **Browser**: Modern browser (Chrome, Firefox, etc.)
- **Dependencies**: Google Fonts (Roboto, assumed from Practice001)

## Installation

### Step 1: Set Up Project Files
1. Place the project files in your web server’s root directory (e.g., `htdocs` for XAMPP).
2. Ensure the following structure, including files from Practice001:
   ```
   Practice003/
   ├── classes/
   │   ├── dbh.classes.php
   │   ├── login.classes.php
   │   ├── login-contr.classes.php
   │   ├── signup.classes.php
   │   ├── signup-contr.classes.php
   │   ├── profileinfo.classes.php
   │   ├── profileinfo-contr.classes.php
   │   ├── profileinfo-view.classes.php
   ├── includes/
   │   ├── login.inc.php
   │   ├── logout.inc.php
   │   ├── signup.inc.php
   │   ├── profileinfo.inc.php
   ├── index.php
   ├── profile.php
   ├── profilesettings.php
   ├── header.php
   ├── style.css
   ├── db.sql
   ```

### Step 2: Configure Database
1. Create a MySQL database named `ooplogin` (as in Practice001):
   ```sql
   CREATE DATABASE ooplogin;
   ```
2. Import the `db.sql` files from Practice001 and this project:
   - From Practice001 (users table):
     ```sql
     USE ooplogin;
     CREATE TABLE users (
         users_id int(11) AUTO_INCREMENT PRIMARY KEY not null,
         users_uid TINYTEXT not null,
         users_pwd LONGTEXT not null,
         users_email TINYTEXT not null
     );
     ```
   - From this project (profiles table):
     ```sql
     USE ooplogin;
     CREATE TABLE profiles (
         profiles_id int NOT NULL AUTO_INCREMENT,
         profiles_about TEXT NOT NULL,
         profiles_introtitle TEXT NOT NULL,
         profiles_introtext TEXT NOT NULL,
         users_id int,
         PRIMARY KEY (profiles_id),
         FOREIGN KEY (users_id) REFERENCES users(users_id)
     );
     ```
   - Use phpMyAdmin: Import both `db.sql` files via the `Import` tab.

3. Update database credentials in `classes/dbh.classes.php` (from Practice001):
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
- **Signup/Login**: Use `index.php` to register or log in (as in Practice001).
- **View Profile**: After logging in, go to `profile.php` to see your username, about section, intro title, intro text, and static posts.
- **Update Profile**: Navigate to `profilesettings.php` to edit your about section, intro title, and intro text. Submit to save changes.
- **Logout**: Click "LOGOUT" in the navigation (assumed in `header.php`).
# ShoeShow - E-Commerce Web Application 👟✨

## 📋 Project Overview
ShoeShow is a dynamic e-commerce platform crafted for selling stylish shoes. Whether you're shopping for classic, casual, or trendy sneakers, ShoeShow is designed to provide a seamless and enjoyable shopping experience. The platform includes robust functionalities for both administrators and users.

---

## 📜 Table of Contents
1. [Main Features](#-main-features)  
   - [General Features](#-general-features)  
   - [Administrator Functions](#-administrator-functions)  
   - [User Functions](#-user-functions)  
2. [Tools & Frameworks](#-tools--frameworks)  
   - [Frontend](#-frontend)  
   - [Backend](#-backend)  
   - [Database](#-database)  
   - [Dynamic Interactions](#-dynamic-interactions)  
3. [Setup Guide](#-setup-guide)  
   - [Prerequisites](#-prerequisites)  
   - [Steps](#-steps)  
4. [Contributors](#-contributors)  
5. [Contact](#-contact)  

---

## 🎯 Main Features

### 🌟 General Features
- **Home Page:** A welcoming and user-friendly home page accessible to all.
- **Login system:** Secure login functionality based on role. 
- **User Roles:** Distinct functionalities for administrators and general users.

---

### 🔧 Administrator Functions
- **Manage Products:** Add, edit, delete, and view products like shoes (CRUD operations).  
- **Review User Profiles:** Access all user profiles in the database.  
- **Order Management:** Oversee customer orders with detailed status updates.

---

### 👤 User Functions
- **User Registration:** Sign up with profile details, including name, email, password, interests, and cridit limit.  
- **Edit Profile:** Update personal data anytime.  
- **Browse Products:** Explore shoe categories like classic, casual, and sneakers.
- **Filter Products:** Provide filters on product based on gender, brand, color, and size.
- **Shopping Cart:** Add, update, remove items, and checkout seamlessly based on cridit limit.  
- **Wishlist:** Save favorite products to revisit later.

---

## 💻 Tools & Frameworks

### 🎨 Frontend
- **HTML5:** Semantic page structuring.  
- **BootStrap4:** Responsive design, optimized for all devices (Mobile - First approach).  
- **JavaScript:** Dynamic content rendering.  
- **AJAX & JQuery:** Asynchronous interactions for smooth user experience.

---

### ☕ Backend
- **Java Servlets & JSP:** Server-side logic and dynamic content management.  
- **ORM (JPA/Hibernate):** Efficient database operations with connection pooling.

---

### 🗄 Database
- **MySQL:** Stores user data, product details, and transactions.

---

### 🔄 Dynamic Interactions
- **AJAX:** Real-time updates for products filtering, shopping cart and wishlist.  
- **Email Availability Check:** Quick validation during registration.

---

## 🛠 Setup Guide

### 🔧 Prerequisites
- Java JDK: Version 8 or higher  
- Apache Tomcat  
- MySQL Database server  
- Maven for dependency management  

---

### 📝 Steps
1. **Clone the Repository**  
   ```bash
   git clone https://github.com/Hashim-Sobhi/E-Commerce-WebApp-ITI.git.
   cd E-Commerce-WebApp-ITI.
   
2. **Cofigure Database**
   - Create a database in MySQL
   - run `db_script.sql` for tables then `script_data.sql` for data.
   - Update credentials in `persistence.xml` if needed.
  
3. **Deploy the Project**
   ```bash
   mvn clean install compile tomcat7:deploy.
  
4. **Access Application**
   - Navigate to `http://localhost:8080/shoeshow` in your browser. (User Home Page)
   - Navigate to `http://localhost:8080/shoeshow/admindashboard` in your browser. (Admin Home Page)
---

## 👥 Contributors
- Hashim Sobhi
- Yusuf Salah Eldin
- Nada Mohammed

## 📞 Contact
- hashimsobhi97@gmail.com
- yusuf_mustafa1553@outlook.com
- nadamohammed01123@gmail.com

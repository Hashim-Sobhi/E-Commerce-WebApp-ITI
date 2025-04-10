DROP DATABASE IF EXISTS jets_projects_ecommerce_db;

CREATE DATABASE jets_projects_ecommerce_db
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

USE jets_projects_ecommerce_db;

CREATE TABLE State (
    state VARCHAR(50) PRIMARY KEY
)ENGINE = InnoDB;

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    birthdate DATE NULL DEFAULT NULL,
    job VARCHAR(50) NULL,
    credit_limit DECIMAL(10, 2) NOT NULL,
    interests TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)ENGINE = InnoDB;
CREATE INDEX user_idx_email ON User(email);

CREATE TABLE UserAddress (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    state VARCHAR(50) NOT NULL,
    street TEXT NOT NULL,
    department_number INT NOT NULL,
    is_default BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_user
        FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_state
        FOREIGN KEY (state) REFERENCES State(state)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NULL,
    category ENUM('SNEAKERS', 'CLASSIC', 'CASUAL') NOT NULL,
    gender ENUM('MALE', 'FEMALE') NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    brand VARCHAR(25) NOT NULL,
    added_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    sold INT NOT NULL DEFAULT 0,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE = InnoDB;

CREATE TABLE ProductInfo (
    product_info_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    size INT NOT NULL,
    color VARCHAR(20) NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT fk_product
        FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT uq_product_variant UNIQUE (product_id, size, color)
)ENGINE = InnoDB;

CREATE TABLE ProductImg (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    img VARCHAR(100) NOT NULL,
    is_default BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_product_img
        FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE ShoppingCart (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_info_id INT NOT NULL,
    quantity INT NOT NULL,
    added_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_product_info
        FOREIGN KEY (product_info_id) REFERENCES ProductInfo(product_info_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_user_cart
        FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT uq_cart_item_variant UNIQUE (product_info_id, user_id)
)ENGINE = InnoDB;

CREATE TABLE `Order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    address_id INT NOT NULL,
    order_status ENUM('PENDING', 'CONFIRMED', 'SHIPPED', 'DELIVERED', 'CANCELLED', 'RETURNED')
        NOT NULL DEFAULT 'PENDING',
    CONSTRAINT fk_order_user
        FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_order_address
        FOREIGN KEY (address_id) REFERENCES UserAddress(address_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE OrderItem (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_info_id INT NOT NULL,
    quantity INT NOT NULL,
    price_at_purchase DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_order
        FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_product_info_order_item
        FOREIGN KEY (product_info_id) REFERENCES ProductInfo(product_info_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT uq_order_item_variant UNIQUE (product_info_id, order_id)
)ENGINE = InnoDB;

CREATE TABLE Wishlist (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    CONSTRAINT fk_user_wishlist
        FOREIGN KEY (user_id) REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_product_wishlist
        FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT uq_wishlist_item UNIQUE (user_id, product_id)
)ENGINE = InnoDB;



INSERT INTO State (state) VALUES 
('Cairo'),
('Giza'),
('Alexandria'),
('Dakahlia'),
('Red Sea'),
('Beheira'),
('Fayoum'),
('Gharbia'),
('Ismailia'),
('Menofia'),
('Minya'),
('Qaliubiya'),
('New Valley'),
('Suez'),
('Aswan'),
('Assiut'),
('Beni Suef'),
('Port Said'),
('Damietta'),
('Sharkia'),
('South Sinai'),
('Kafr El Sheikh'),
('Matrouh'),
('Luxor'),
('Qena'),
('North Sinai'),
('Sohag');










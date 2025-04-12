INSERT INTO User (name, phone_number, email, password, birthdate, job, credit_limit, interests)
VALUES
    ('Hashim Sobhi', '01011112222', 'hashim@example.com', 'pass123', '1999-03-14', 'Engineer', 10000.00, 'SNEAKERS,CASUAL'),
    ('Aya Mostafa', '01033334444', 'aya@example.com', 'pass456', '1998-08-21', 'Designer', 8000.00, 'CLASSIC,SNEAKERS'),
    ('Youssef Kamal', '01055556666', 'youssef@example.com', 'pass789', '1997-12-01', 'Developer', 12000.00, 'SNEAKERS,CLASSIC');

INSERT INTO UserAddress (user_id, state, street, building_number, is_default)
VALUES
    (1, 'Cairo', 'Tahrir St.', 5, true),
    (2, 'Giza', 'Mohandessin Ave.', 3, true),
    (3, 'Alexandria', 'Stanley Beach Rd.', 10, true);

INSERT INTO Product (name, description, category, gender, price, brand)
VALUES
    ('Nike Air Max', 'Daily sneakers.', 'SNEAKERS', 'MALE', 2200.00, 'Nike'),
    ('Adidas Ultraboost', 'Running shoes.', 'SNEAKERS', 'FEMALE', 2500.00, 'Adidas'),
    ('Converse Chuck Taylor', 'Classic casual shoes.', 'CASUAL', 'MALE', 1800.00, 'Converse'),
    ('Puma Suede', 'Soft casual style.', 'CASUAL', 'FEMALE', 1600.00, 'Puma'),
    ('Clarks Oxford', 'Formal classic shoes.', 'CLASSIC', 'MALE', 2800.00, 'Clarks'),
    ('Timberland Boots', 'Tough casual boots.', 'CASUAL', 'MALE', 3000.00, 'Timberland'),
    ('Reebok Nano', 'Training sneakers.', 'SNEAKERS', 'FEMALE', 2100.00, 'Reebok'),
    ('Fila Disruptor', 'Chunky sneaker design.', 'SNEAKERS', 'FEMALE', 1900.00, 'Fila'),
    ('Sketchers GoWalk', 'Comfortable casual wear.', 'CASUAL', 'MALE', 1700.00, 'Sketchers'),
    ('Bata Derby', 'Affordable classic formal.', 'CLASSIC', 'MALE', 1500.00, 'Bata');

-- Product 1 (Nike Air Max)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (1, 42, 'Black', 10),
    (1, 43, 'White', 12);

-- Product 2 (Adidas Ultraboost)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (2, 38, 'Pink', 7),
    (2, 39, 'Black', 5);

-- Product 3 (Converse)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (3, 42, 'Red', 6),
    (3, 43, 'White', 10);

-- Product 4 (Puma)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (4, 37, 'Blue', 4),
    (4, 38, 'Black', 6);

-- Product 5 (Clarks)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (5, 42, 'Brown', 8),
    (5, 43, 'Black', 3);

-- Product 6 (Timberland)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (6, 42, 'Yellow', 5),
    (6, 43, 'Beige', 4);

-- Product 7 (Reebok)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (7, 38, 'Grey', 9),
    (7, 39, 'White', 6);

-- Product 8 (Fila)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (8, 39, 'White', 7),
    (8, 40, 'Black', 5);

-- Product 9 (Sketchers)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (9, 41, 'Grey', 10),
    (9, 42, 'Blue', 8);

-- Product 10 (Bata Derby)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (10, 41, 'Black', 5),
    (10, 42, 'Brown', 7);

-- Product 1
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (1, 'images/item-1.jpg', TRUE),
     (1, 'images/item-2.jpg', FALSE),
     (1, 'images/item-3.jpg', FALSE),
     (1, 'images/item-4.jpg', FALSE);

-- Product 2
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (2, 'images/item-5.jpg', TRUE),
     (2, 'images/item-6.jpg', FALSE),
     (2, 'images/item-7.jpg', FALSE),
     (2, 'images/item-8.jpg', FALSE);

-- Product 3
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (3, 'images/item-9.jpg', TRUE),
     (3, 'images/item-10.jpg', FALSE),
     (3, 'images/item-11.jpg', FALSE),
     (3, 'images/item-12.jpg', FALSE);

-- Product 4
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (4, 'images/item-13.jpg', TRUE),
     (4, 'images/item-14.jpg', FALSE),
     (4, 'images/item-15.jpg', FALSE),
     (4, 'images/item-16.jpg', FALSE);

-- Product 5 (repeat from item-1.jpg)
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (5, 'images/item-1.jpg', TRUE),
     (5, 'images/item-2.jpg', FALSE),
     (5, 'images/item-3.jpg', FALSE),
     (5, 'images/item-4.jpg', FALSE);

-- Product 6
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (6, 'images/item-5.jpg', TRUE),
     (6, 'images/item-6.jpg', FALSE),
     (6, 'images/item-7.jpg', FALSE),
     (6, 'images/item-8.jpg', FALSE);

-- Product 7
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (7, 'images/item-9.jpg', TRUE),
     (7, 'images/item-10.jpg', FALSE),
     (7, 'images/item-11.jpg', FALSE),
     (7, 'images/item-12.jpg', FALSE);

-- Product 8
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (8, 'images/item-13.jpg', TRUE),
     (8, 'images/item-14.jpg', FALSE),
     (8, 'images/item-15.jpg', FALSE),
     (8, 'images/item-16.jpg', FALSE);

-- Product 9
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (9, 'images/item-1.jpg', TRUE),
     (9, 'images/item-2.jpg', FALSE),
     (9, 'images/item-3.jpg', FALSE),
     (9, 'images/item-4.jpg', FALSE);

-- Product 10
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (10, 'images/item-5.jpg', TRUE),
     (10, 'images/item-6.jpg', FALSE),
     (10, 'images/item-7.jpg', FALSE),
     (10, 'images/item-8.jpg', FALSE);


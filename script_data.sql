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
	('Nike Daily Dash (Male)', 'Daily sneakers.', 'SNEAKERS', 'MALE', 2200.00, 'Nike'),
    ('Adidas Sprint She (Female)', 'Running shoes.', 'SNEAKERS', 'FEMALE', 2500.00, 'Adidas'),
    ('Merrel Swift She (Female)', 'Running shoes.', 'SNEAKERS', 'FEMALE', 1800.00, 'Merrel'),
    ('Gucci Glide Femme (Female)', 'Daily sneakers.', 'SNEAKERS', 'FEMALE', 1600.00, 'Gucci'),
    ('Sketchers Power Trainer (Male)', 'Training sneakers.', 'SNEAKERS', 'MALE', 2800.00, 'Sketchers'),

    ('Merrel Precision Trainer (Male)', 'Training sneakers.', 'SNEAKERS', 'Male', 2100.00, 'Merrel'),    
    ('Adidas Casual Champion (Male)', 'Comfortable casual wear.', 'CASUAL', 'MALE', 3000.00, 'Adidas'),
    ('Gucci Relax Max (Male)', 'Comfortable casual wear.', 'CASUAL', 'MALE', 1900.00, 'Gucci'),
    ('Sketchers Sprint She II (Female)', 'Running shoes.', 'SNEAKERS', 'FEMALE', 1700.00, 'Sketchers'),
    ('Nike Timeless Chic (Female)', 'Affordable classic formal.', 'CLASSIC', 'FEMALE', 1500.00, 'Nike'),
    
	('Merrel Classic Prime (Male)', 'Affordable classic formal.', 'CLASSIC', 'MALE', 2400.00, 'Merrel'),
    ('Gucci Elite Classic (Male)', 'Formal classic shoes.', 'CLASSIC', 'MALE', 3000.00, 'Gucci'),
    ('Nike Casual Ace (Male)', 'Soft casual style.', 'CASUAL', 'MALE', 3200.00, 'Nike'),
    ('Nike Formal Essential (Male)', 'Affordable classic formal.', 'CLASSIC', 'MALE', 1200.00, 'Nike'),
    ('Sketchers Pro Cleats (Male)', 'High-performance cleats.', 'CASUAL', 'MALE', 2700.00, 'Sketchers'),
    
    ('Sketchers Style Glide (Male)', 'Soft casual style.', 'CASUAL', 'MALE', 2000.00, 'Sketchers'),
    ('Nike Classic Elegance (Female)', 'Formal classic shoes.', 'CLASSIC', 'FEMALE', 2500.00, 'Nike'),
    ('Merrel Chic Classic (Female)', 'Affordable classic formal.', 'CLASSIC', 'FEMALE', 1500.00, 'Merrel'),
    ('Gucci Formal Luxe (Female)', 'Formal classic shoes.', 'CLASSIC', 'FEMALE', 2800.00, 'Gucci'),
    ('Merrel Timeless Class (Female)', 'Classic Formal shoes.', 'CLASSIC', 'FEMALE', 1800.00, 'Merrel');

-- Product 1 (CU-1)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (1, 42, 'White', 10),
    (1, 43, 'Cream', 12);

-- Product 2 (CU-2)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (2, 38, 'Black', 7),
    (2, 39, 'Cream', 5);

-- Product 3 (CU-3)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (3, 42, 'Red', 6),
    (3, 43, 'White', 10);

-- Product 4 (CU-4)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (4, 37, 'Blue', 4),
    (4, 38, 'Black', 6);

-- Product 5 (CU-5)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (5, 42, 'Grey', 8),
    (5, 43, 'Black', 3);

-- Product 6 (LX-6)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (6, 42, 'Brown', 5),
    (6, 43, 'Cream', 4);

-- Product 7 (LX-7)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (7, 38, 'Grey', 9),
    (7, 39, 'White', 6),
    (7, 39, 'Green', 10);

-- Product 8 (LX-8)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (8, 39, 'White', 7),
    (8, 40, 'Black', 5),
    (8, 40, 'Brown', 10);

-- Product 9 (LX-9)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (9, 41, 'White', 5),
    (9, 41, 'Grey', 10),
    (9, 42, 'Blue', 8);

-- Product 10 (LX-10)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (10, 41, 'Black', 5),
    (10, 42, 'Brown', 7);

-- Product 11 (UI-11)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (11, 42, 'White', 10),
    (11, 43, 'Cream', 12),
    (11, 43, 'Brown', 12);

-- Product 12 (UI-12)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (12, 38, 'Black', 7),
    (12, 39, 'Cream', 5);

-- Product 13 (UI-3)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (13, 43, 'Black', 10),
    (13, 42, 'Red', 6),
    (13, 43, 'White', 10);

-- Product 14 (UI-14)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (14, 37, 'Blue', 4),
    (14, 38, 'Black', 6);

-- Product 15 (CU-15)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (15, 42, 'Grey', 8),
    (15, 42, 'Brown', 8),
    (15, 43, 'Black', 3);

-- Product 16 (RT-16)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (16, 42, 'Blue', 5),
    (16, 43, 'Grey', 4);

-- Product 17 (RT-17)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (17, 38, 'Black', 9),
    (17, 39, 'White', 6),
    (17, 39, 'Green', 10);

-- Product 18 (RT-18)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (18, 39, 'White', 7),
    (18, 40, 'Cream', 5),
    (18, 40, 'Brown', 10);

-- Product 19 (RT-19)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (19, 41, 'White', 5),
    (19, 41, 'Grey', 10),
    (19, 42, 'Blue', 8);

-- Product 20 (LX-10)
INSERT INTO ProductInfo (product_id, size, color, quantity) VALUES
    (20, 41, 'Black', 5),
    (20, 42, 'Brown', 7);


-- Product 1
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (1, 'images/product-1/item1-1.jpg', TRUE),
     (1, 'images/product-1/item1-2.jpg', FALSE),
     (1, 'images/product-1/item1-3.jpg', FALSE),
     (1, 'images/product-1/item1-4.jpg', FALSE);

-- Product 2
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (2, 'images/product-2/item2-1.jpg', TRUE),
     (2, 'images/product-2/item2-2.jpg', FALSE),
     (2, 'images/product-2/item2-3.jpg', FALSE),
     (2, 'images/product-2/item2-4.jpg', FALSE);

-- Product 3
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (3, 'images/product-3/item3-1.jpg', TRUE),
     (3, 'images/product-3/item3-2.jpg', FALSE),
     (3, 'images/product-3/item3-3.jpg', FALSE),
     (3, 'images/product-3/item3-4.jpg', FALSE);

-- Product 4
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (4, 'images/product-4/item4-1.jpg', TRUE),
     (4, 'images/product-4/item4-2.jpg', FALSE),
     (4, 'images/product-4/item4-3.jpg', FALSE),
     (4, 'images/product-4/item4-4.jpg', FALSE);

-- Product 5 (repeat from item-1.jpg)
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (5, 'images/product-5/item5-1.jpg', FALSE),
     (5, 'images/product-5/item5-2.jpg', TRUE),
     (5, 'images/product-5/item5-3.jpg', FALSE),
     (5, 'images/product-5/item5-4.jpg', FALSE);

-- Product 6
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (6, 'images/product-6/item6-1.jpg', TRUE),
     (6, 'images/product-6/item6-2.jpg', FALSE),
     (6, 'images/product-6/item6-3.jpg', FALSE),
     (6, 'images/product-6/item6-4.jpg', FALSE);

-- Product 7
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (7, 'images/product-7/item7-1.jpg', TRUE),
     (7, 'images/product-7/item7-2.jpg', FALSE),
     (7, 'images/product-7/item7-3.jpg', FALSE),
     (7, 'images/product-7/item7-4.jpg', FALSE);

-- Product 8
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (8, 'images/product-8/item8-1.jpg', TRUE),
     (8, 'images/product-8/item8-2.jpg', FALSE),
     (8, 'images/product-8/item8-3.jpg', FALSE),
     (8, 'images/product-8/item8-4.jpg', FALSE);

-- Product 9
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (9, 'images/product-9/item9-1.jpg', TRUE),
     (9, 'images/product-9/item9-2.jpg', FALSE),
     (9, 'images/product-9/item9-3.jpg', FALSE),
     (9, 'images/product-9/item9-4.jpg', FALSE);

-- Product 10
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (10, 'images/product-10/item10-1.jpg', TRUE),
     (10, 'images/product-10/item10-2.jpg', FALSE),
     (10, 'images/product-10/item10-3.jpg', FALSE),
     (10, 'images/product-10/item10-4.jpg', FALSE);

-- Product 11
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (11, 'images/product-11/item11-1.jpg', FALSE),
     (11, 'images/product-11/item11-2.jpg', FALSE),
     (11, 'images/product-11/item11-3.jpg', TRUE),
     (11, 'images/product-11/item11-4.jpg', FALSE);

-- Product 12
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (12, 'images/product-12/item12-1.jpg', FALSE),
     (12, 'images/product-12/item12-2.jpg', TRUE),
     (12, 'images/product-12/item12-3.jpg', FALSE),
     (12, 'images/product-12/item12-4.jpg', FALSE);

-- Product 13
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (13, 'images/product-13/item13-1.jpg', FALSE),
     (13, 'images/product-13/item13-2.jpg', TRUE),
     (13, 'images/product-13/item13-3.jpg', FALSE),
     (13, 'images/product-13/item13-4.jpg', FALSE);

-- Product 14
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (14, 'images/product-14/item14-1.jpg', FALSE),
     (14, 'images/product-14/item14-2.jpg', FALSE),
     (14, 'images/product-14/item14-3.jpg', TRUE),
     (14, 'images/product-14/item14-4.jpg', FALSE);

-- Product 15 
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (15, 'images/product-15/item15-1.jpg', FALSE),
     (15, 'images/product-15/item15-2.jpg', TRUE),
     (15, 'images/product-15/item15-3.jpg', FALSE),
     (15, 'images/product-15/item15-4.jpg', FALSE);

-- Product 16
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (16, 'images/product-16/item16-1.jpg', FALSE),
     (16, 'images/product-16/item16-2.jpg', TRUE),
     (16, 'images/product-16/item16-3.jpg', FALSE),
     (16, 'images/product-16/item16-4.jpg', FALSE);

-- Product 17
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (17, 'images/product-17/item17-1.jpg', TRUE),
     (17, 'images/product-17/item17-2.jpg', FALSE),
     (17, 'images/product-17/item17-3.jpg', FALSE),
     (17, 'images/product-17/item17-4.jpg', FALSE);

-- Product 18
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (18, 'images/product-18/item18-1.jpg', TRUE),
     (18, 'images/product-18/item18-2.jpg', FALSE),
     (18, 'images/product-18/item18-3.jpg', FALSE),
     (18, 'images/product-18/item18-4.jpg', FALSE);

-- Product 19
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (19, 'images/product-19/item19-1.jpg', TRUE),
     (19, 'images/product-19/item19-2.jpg', FALSE),
     (19, 'images/product-19/item19-3.jpg', FALSE),
     (19, 'images/product-19/item19-4.jpg', FALSE);

-- Product 20
INSERT INTO ProductImg (product_id, img, is_default) VALUES
     (20, 'images/product-20/item20-1.jpg', TRUE),
     (20, 'images/product-20/item20-2.jpg', FALSE),
     (20, 'images/product-20/item20-3.jpg', FALSE),
     (20, 'images/product-20/item20-4.jpg', FALSE);

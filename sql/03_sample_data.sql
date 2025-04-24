-- Insert sample data for brand table
INSERT INTO brand (brand_name, brand_description) VALUES
('Nike', 'Just Do It. Athletic apparel and footwear'),
('Apple', 'Think different. Technology and electronics'),
('Levi''s', 'Quality denim and casual wear'),
('Samsung', 'Innovative electronics and appliances'),
('Adidas', 'Sportswear and athletic shoes');

-- Insert sample data for product_category table
INSERT INTO product_category (category_name, parent_category_id) VALUES
('Clothing', NULL),
('Electronics', NULL),
('Shoes', NULL),
('Men''s Clothing', 1),
('Women''s Clothing', 1),
('Smartphones', 2),
('Laptops', 2),
('Running Shoes', 3),
('Casual Shoes', 3);

-- Insert sample data for size_category table
INSERT INTO size_category (category_name, description) VALUES
('Clothing', 'Standard clothing sizes'),
('Shoes', 'Footwear sizes'),
('Underwear', 'Underwear sizes'),
('Accessories', 'One size fits all');

-- Insert sample data for size_option table
INSERT INTO size_option (size_category_id, size_value, size_description) VALUES
(1, 'S', 'Small'),
(1, 'M', 'Medium'),
(1, 'L', 'Large'),
(1, 'XL', 'Extra Large'),
(2, '7', 'US Size 7'),
(2, '8', 'US Size 8'),
(2, '9', 'US Size 9'),
(2, '10', 'US Size 10'),
(2, '11', 'US Size 11'),
(3, 'S', 'Small Underwear'),
(3, 'M', 'Medium Underwear'),
(3, 'L', 'Large Underwear');

-- Insert sample data for color table
INSERT INTO color (color_name, color_code) VALUES
('Red', '#FF0000'),
('Blue', '#0000FF'),
('Black', '#000000'),
('White', '#FFFFFF'),
('Green', '#00FF00'),
('Gray', '#808080'),
('Navy', '#000080'),
('Yellow', '#FFFF00'),
('Pink', '#FFC0CB');

-- Insert sample data for attribute_type table
INSERT INTO attribute_type (type_name, data_type) VALUES
('Text', 'text'),
('Number', 'number'),
('Boolean', 'boolean'),
('Weight', 'number'),
('Dimensions', 'text');

-- Insert sample data for attribute_category table
INSERT INTO attribute_category (category_name, description) VALUES
('Physical', 'Physical characteristics'),
('Technical', 'Technical specifications'),
('Material', 'Material composition'),
('Care', 'Care instructions');

-- Insert sample data for product table
INSERT INTO product (brand_id, category_id, product_name, product_description, base_price) VALUES
(1, 8, 'Air Max 90', 'Classic running shoes with visible air cushioning', 120.00),
(5, 8, 'Ultraboost 21', 'Responsive running shoes with energy return', 180.00),
(3, 4, '501 Original Fit Jeans', 'Classic straight leg jeans', 59.50),
(2, 6, 'iPhone 13', 'Latest smartphone with A15 Bionic chip', 799.00),
(4, 6, 'Galaxy S21', 'Android smartphone with 5G capability', 699.99),
(1, 5, 'Sportswear T-Shirt', 'Comfortable cotton t-shirt for women', 29.99),
(5, 9, 'Stan Smith', 'Iconic leather sneakers', 85.00),
(2, 7, 'MacBook Pro 14"', 'Powerful laptop with M1 Pro chip', 1999.00);

-- Insert sample data for product_variation table
INSERT INTO product_variation (product_id, variation_type) VALUES
(1, 'color'), -- Air Max 90 colors
(1, 'size'),  -- Air Max 90 sizes
(2, 'color'), -- Ultraboost colors
(2, 'size'),  -- Ultraboost sizes
(3, 'size'),  -- Jeans sizes
(4, 'color'), -- iPhone colors
(5, 'color'), -- Galaxy colors
(6, 'color'), -- T-Shirt colors
(6, 'size'),  -- T-Shirt sizes
(7, 'size'),  -- Stan Smith sizes
(8, 'color'); -- MacBook colors

-- Insert sample data for product_attribute table
INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, attribute_name, attribute_value) VALUES
(1, 3, 1, 'Upper Material', 'Leather and synthetic'),
(1, 1, 4, 'Weight', '0.8'),
(1, 4, 1, 'Care Instructions', 'Wipe clean with damp cloth'),
(2, 3, 1, 'Upper Material', 'Primeknit+'),
(2, 1, 4, 'Weight', '0.7'),
(3, 3, 1, 'Material', '100% Cotton denim'),
(3, 4, 1, 'Care Instructions', 'Machine wash cold'),
(4, 2, 1, 'Processor', 'A15 Bionic'),
(4, 2, 1, 'Storage', '128GB'),
(5, 2, 1, 'Processor', 'Exynos 2100'),
(5, 2, 1, 'Storage', '128GB'),
(6, 3, 1, 'Material', '100% Cotton'),
(7, 3, 1, 'Upper Material', 'Leather'),
(8, 2, 1, 'Processor', 'M1 Pro'),
(8, 2, 1, 'Storage', '512GB SSD');

-- Insert sample data for product_item table
INSERT INTO product_item (product_id, sku, quantity_in_stock, price) VALUES
(1, 'NIKE-AM90-BK-8', 25, 120.00), -- Black Air Max 90 size 8
(1, 'NIKE-AM90-BK-9', 30, 120.00), -- Black Air Max 90 size 9
(1, 'NIKE-AM90-WH-8', 15, 120.00), -- White Air Max 90 size 8
(2, 'ADID-UB21-BL-9', 20, 180.00),  -- Blue Ultraboost size 9
(2, 'ADID-UB21-BL-10', 18, 180.00), -- Blue Ultraboost size 10
(3, 'LEVI-501-BL-32', 40, 59.50),   -- Blue Jeans size 32
(3, 'LEVI-501-BL-34', 35, 59.50),   -- Blue Jeans size 34
(4, 'APPL-IP13-BL-128', 50, 799.00), -- Blue iPhone
(4, 'APPL-IP13-PK-128', 45, 799.00), -- Pink iPhone
(5, 'SAMS-GS21-GR-128', 30, 699.99), -- Gray Galaxy
(6, 'NIKE-SWT-RD-S', 60, 29.99),    -- Red T-Shirt Small
(6, 'NIKE-SWT-RD-M', 55, 29.99),    -- Red T-Shirt Medium
(7, 'ADID-STAN-WH-9', 25, 85.00),   -- White Stan Smith size 9
(8, 'APPL-MBP14-SG-512', 15, 1999.00); -- Space Gray MacBook

-- Insert sample data for product_image table
INSERT INTO product_image (product_id, item_id, image_url, is_primary, alt_text) VALUES
(1, NULL, 'https://example.com/nike_am90_1.jpg', TRUE, 'Nike Air Max 90 front view'),
(1, NULL, 'https://example.com/nike_am90_2.jpg', FALSE, 'Nike Air Max 90 side view'),
(1, 1, 'https://example.com/nike_am90_black.jpg', TRUE, 'Black color variant'),
(2, NULL, 'https://example.com/adidas_ub21_1.jpg', TRUE, 'Adidas Ultraboost 21'),
(3, NULL, 'https://example.com/levis_501_1.jpg', TRUE, 'Levi''s 501 Jeans'),
(4, NULL, 'https://example.com/iphone13_1.jpg', TRUE, 'iPhone 13'),
(4, 8, 'https://example.com/iphone13_blue.jpg', TRUE, 'Blue iPhone 13'),
(5, NULL, 'https://example.com/galaxy_s21_1.jpg', TRUE, 'Galaxy S21'),
(6, NULL, 'https://example.com/nike_tshirt_1.jpg', TRUE, 'Nike Sportswear T-Shirt'),
(7, NULL, 'https://example.com/adidas_stan_1.jpg', TRUE, 'Adidas Stan Smith'),
(8, NULL, 'https://example.com/macbook_pro_1.jpg', TRUE, 'MacBook Pro 14"');

-- Insert sample data for item_color junction table
INSERT INTO item_color (item_id, color_id) VALUES
(1, 3), -- Black Air Max 90
(2, 3), -- Black Air Max 90
(3, 4), -- White Air Max 90
(4, 2), -- Blue Ultraboost
(5, 2), -- Blue Ultraboost
(8, 2), -- Blue iPhone
(9, 8), -- Pink iPhone
(10, 6), -- Gray Galaxy
(11, 1), -- Red T-Shirt
(12, 1), -- Red T-Shirt
(13, 4); -- White Stan Smith

-- Insert sample data for item_size junction table
INSERT INTO item_size (item_id, size_id) VALUES
(1, 6),  -- Air Max 90 size 8
(2, 7),  -- Air Max 90 size 9
(3, 6),  -- Air Max 90 size 8
(4, 7),  -- Ultraboost size 9
(5, 8),  -- Ultraboost size 10
(6, 3),  -- Jeans size L (converted from waist size)
(7, 4),  -- Jeans size XL
(11, 1), -- T-Shirt Small
(12, 2), -- T-Shirt Medium
(13, 7); -- Stan Smith size 9
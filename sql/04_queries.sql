-- 1. BASIC PRODUCT INFORMATION QUERIES

-- Get all products with their brand and category names
SELECT 
    p.product_id,
    p.product_name,
    b.brand_name,
    pc.category_name,
    p.base_price
FROM 
    product p
JOIN 
    brand b ON p.brand_id = b.brand_id
JOIN 
    product_category pc ON p.category_id = pc.category_id
ORDER BY 
    p.product_name;

-- 2. INVENTORY MANAGEMENT QUERIES

-- Find products with low stock (less than 20 items)
SELECT 
    pi.item_id,
    p.product_name,
    pi.sku,
    pi.quantity_in_stock,
    pi.price
FROM 
    product_item pi
JOIN 
    product p ON pi.product_id = p.product_id
WHERE 
    pi.quantity_in_stock < 20
ORDER BY 
    pi.quantity_in_stock ASC;

-- 3. PRODUCT VARIATION QUERIES

-- Get all available color options for a specific product (iPhone 13)
SELECT 
    p.product_name,
    c.color_name,
    c.color_code
FROM 
    product p
JOIN 
    product_item pi ON p.product_id = pi.product_id
JOIN 
    item_color ic ON pi.item_id = ic.item_id
JOIN 
    color c ON ic.color_id = c.color_id
WHERE 
    p.product_name = 'iPhone 13'
GROUP BY 
    p.product_name, c.color_name, c.color_code;

-- 4. PRODUCT ATTRIBUTE QUERIES

-- Get all technical specifications for electronics products
SELECT 
    p.product_name,
    ac.category_name AS attribute_category,
    at.type_name AS attribute_type,
    pa.attribute_name,
    pa.attribute_value
FROM 
    product p
JOIN 
    product_attribute pa ON p.product_id = pa.product_id
JOIN 
    attribute_category ac ON pa.attribute_category_id = ac.attribute_category_id
JOIN 
    attribute_type at ON pa.attribute_type_id = at.attribute_type_id
WHERE 
    ac.category_name = 'Technical'
ORDER BY 
    p.product_name, pa.attribute_name;

-- 5. PRODUCT SEARCH QUERIES

-- Search for products by name (case-insensitive partial match)
SELECT 
    p.product_id,
    p.product_name,
    b.brand_name,
    p.base_price
FROM 
    product p
JOIN 
    brand b ON p.brand_id = b.brand_id
WHERE 
    LOWER(p.product_name) LIKE LOWER('%shoe%')
ORDER BY 
    p.product_name;

-- 6. PRODUCT FILTERING QUERIES

-- Find all running shoes between $100 and $150
SELECT 
    p.product_id,
    p.product_name,
    b.brand_name,
    p.base_price,
    pc.category_name
FROM 
    product p
JOIN 
    brand b ON p.brand_id = b.brand_id
JOIN 
    product_category pc ON p.category_id = pc.category_id
WHERE 
    pc.category_name = 'Running Shoes'
    AND p.base_price BETWEEN 100 AND 150
ORDER BY 
    p.base_price;

-- 7. SIZE AVAILABILITY QUERIES

-- Check available sizes for a specific product (Levi's 501 Jeans)
SELECT 
    p.product_name,
    so.size_value,
    so.size_description
FROM 
    product p
JOIN 
    product_item pi ON p.product_id = pi.product_id
JOIN 
    item_size isz ON pi.item_id = isz.item_id
JOIN 
    size_option so ON isz.size_id = so.size_id
WHERE 
    p.product_name = '501 Original Fit Jeans'
GROUP BY 
    p.product_name, so.size_value, so.size_description
ORDER BY 
    so.size_value;

-- 8. PRODUCT IMAGE QUERIES

-- Get all primary product images
SELECT 
    p.product_id,
    p.product_name,
    pi.image_url,
    pi.alt_text
FROM 
    product p
JOIN 
    product_image pi ON p.product_id = pi.product_id
WHERE 
    pi.is_primary = TRUE
ORDER BY 
    p.product_name;

-- 9. COMPLEX BUSINESS INTELLIGENCE QUERIES

-- Calculate total inventory value by brand
SELECT 
    b.brand_name,
    COUNT(DISTINCT p.product_id) AS product_count,
    SUM(pi.quantity_in_stock) AS total_units,
    SUM(pi.quantity_in_stock * pi.price) AS total_inventory_value
FROM 
    brand b
JOIN 
    product p ON b.brand_id = p.brand_id
JOIN 
    product_item pi ON p.product_id = pi.product_id
GROUP BY 
    b.brand_name
ORDER BY 
    total_inventory_value DESC;

-- 10. PRODUCT RELATIONSHIP QUERIES

-- Find all products that come in multiple colors
SELECT 
    p.product_id,
    p.product_name,
    COUNT(DISTINCT c.color_id) AS color_variants,
    GROUP_CONCAT(DISTINCT c.color_name ORDER BY c.color_name SEPARATOR ', ') AS available_colors
FROM 
    product p
JOIN 
    product_item pi ON p.product_id = pi.product_id
JOIN 
    item_color ic ON pi.item_id = ic.item_id
JOIN 
    color c ON ic.color_id = c.color_id
GROUP BY 
    p.product_id, p.product_name
HAVING 
    COUNT(DISTINCT c.color_id) > 1
ORDER BY 
    color_variants DESC;
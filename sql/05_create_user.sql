-- Create a new read-only user for the e-commerce database
CREATE USER 'ecom_viewer'@'%' IDENTIFIED BY 'secure_password_123';

-- Grant read-only privileges on the entire database
GRANT SELECT ON ecommerce.* TO 'ecom_viewer'@'%';

-- Grant additional privileges to view table structures 
GRANT SHOW VIEW ON ecommerce.* TO 'ecom_viewer'@'%';

-- Flush privileges to apply changes
FLUSH PRIVILEGES;
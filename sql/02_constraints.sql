-- Add foreign key constraints that couldn't be defined during table creation

-- Product table constraints
ALTER TABLE product
ADD CONSTRAINT fk_product_brand
FOREIGN KEY (brand_id) REFERENCES brand(brand_id) ON DELETE RESTRICT;

ALTER TABLE product
ADD CONSTRAINT fk_product_category
FOREIGN KEY (category_id) REFERENCES product_category(category_id) ON DELETE RESTRICT;

-- Product Variation constraints
ALTER TABLE product_variation
ADD CONSTRAINT fk_variation_product
FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE;

-- Product Attribute constraints
ALTER TABLE product_attribute
ADD CONSTRAINT fk_attribute_product
FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE;

ALTER TABLE product_attribute
ADD CONSTRAINT fk_attribute_category
FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id) ON DELETE RESTRICT;

ALTER TABLE product_attribute
ADD CONSTRAINT fk_attribute_type
FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id) ON DELETE RESTRICT;

-- Product Item constraints
ALTER TABLE product_item
ADD CONSTRAINT fk_item_product
FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE;

-- Product Image constraints
ALTER TABLE product_image
ADD CONSTRAINT fk_image_product
FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE;

ALTER TABLE product_image
ADD CONSTRAINT fk_image_item
FOREIGN KEY (item_id) REFERENCES product_item(item_id) ON DELETE CASCADE;

-- Size Option constraints
ALTER TABLE size_option
ADD CONSTRAINT fk_size_category
FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id) ON DELETE CASCADE;

-- Junction tables constraints
ALTER TABLE item_color
ADD CONSTRAINT fk_itemcolor_item
FOREIGN KEY (item_id) REFERENCES product_item(item_id) ON DELETE CASCADE;

ALTER TABLE item_color
ADD CONSTRAINT fk_itemcolor_color
FOREIGN KEY (color_id) REFERENCES color(color_id) ON DELETE CASCADE;

ALTER TABLE item_size
ADD CONSTRAINT fk_itemsize_item
FOREIGN KEY (item_id) REFERENCES product_item(item_id) ON DELETE CASCADE;

ALTER TABLE item_size
ADD CONSTRAINT fk_itemsize_size
FOREIGN KEY (size_id) REFERENCES size_option(size_id) ON DELETE CASCADE;

-- Additional constraints for data integrity

-- Ensure base price is positive
ALTER TABLE product
ADD CONSTRAINT chk_product_price_positive
CHECK (base_price > 0);

-- Ensure product item price is positive
ALTER TABLE product_item
ADD CONSTRAINT chk_item_price_positive
CHECK (price > 0);

-- Ensure stock quantity is not negative
ALTER TABLE product_item
ADD CONSTRAINT chk_item_quantity_non_negative
CHECK (quantity_in_stock >= 0);

-- Ensure SKU is unique across all product items
ALTER TABLE product_item
ADD CONSTRAINT unq_item_sku UNIQUE (sku);

-- Ensure only one primary image per product/item
CREATE UNIQUE INDEX idx_one_primary_image_per_product ON product_image (product_id, COALESCE(item_id, 0))
WHERE is_primary = TRUE;

-- Ensure valid color codes are hexadecimal
ALTER TABLE color
ADD CONSTRAINT chk_color_code_format
CHECK (color_code REGEXP '^#[0-9A-Fa-f]{6}$' OR color_code REGEXP '^#[0-9A-Fa-f]{3}$');

-- Ensure product names are not empty
ALTER TABLE product
ADD CONSTRAINT chk_product_name_not_empty
CHECK (LENGTH(TRIM(product_name)) > 0);

-- Ensure brand names are not empty
ALTER TABLE brand
ADD CONSTRAINT chk_brand_name_not_empty
CHECK (LENGTH(TRIM(brand_name)) > 0);

-- Ensure category names are not empty
ALTER TABLE product_category
ADD CONSTRAINT chk_category_name_not_empty
CHECK (LENGTH(TRIM(category_name)) > 0);

-- Prevent circular references in category hierarchy
-- (This would need to be enforced via application logic or triggers)
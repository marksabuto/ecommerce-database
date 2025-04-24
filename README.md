# E-commerce Database Project

![Database Schema Preview](docs/ERD_Diagram.PDF)

A comprehensive database design for an e-commerce platform with product management, inventory tracking, and variation systems.

## Features

- Complete product catalog management
- Support for product variations (size, color)
- Inventory tracking with SKU management
- Product attributes and specifications
- Brand and category organization
- Sample data for demonstration

## Database Schema

The database includes the following tables:

- `brand` - Product manufacturers
- `product_category` - Product classification
- `product` - Base product information
- `product_item` - Specific product variants
- `product_variation` - Variation types
- `size_option`, `color` - Variation options
- `product_attribute` - Product specifications
- `product_image` - Product media

## Setup Instructions

### Prerequisites

- MySQL or MariaDB server
- Command line tools (bash, mysql client)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/marksabuto/ecommerce-database.git
   cd ecommerce-database
Set up the database:

bash
./scripts/db_setup.sh
(Default credentials: root/password - change in script if needed)

To reset the database:

bash
./scripts/db_reset.sh
File Structure
ecommerce-database/
├── docs/                   # Documentation
│   ├── ERD.png             # Entity Relationship Diagram
│   ├── data_flow.md        # Data flow documentation
│   └── design_choices.md   # Design decisions
├── sql/                    # SQL scripts
│   ├── 01_schema.sql       # Database schema
│   ├── 02_constraints.sql  # Constraints
│   ├── 03_sample_data.sql  # Sample data
│   └── 04_queries.sql      # Example queries
├── scripts/                # Utility scripts
│   ├── db_setup.sh         # Setup database
│   └── db_reset.sh         # Reset database
├── README.md               # This file
└── .gitignore             # Git ignore rules
Usage Examples
Find products with low stock:

sql
SELECT p.product_name, pi.sku, pi.quantity_in_stock
FROM product p
JOIN product_item pi ON p.product_id = pi.product_id
WHERE pi.quantity_in_stock < 20;
Get all available colors for a product:

sql
SELECT DISTINCT c.color_name
FROM product p
JOIN product_item pi ON p.product_id = pi.product_id
JOIN item_color ic ON pi.item_id = ic.item_id
JOIN color c ON ic.color_id = c.color_id
WHERE p.product_name = 'iPhone 13';
Team Members
Marks Abuto - Schema design

Nols - Sample data

Marks Abuto - Queries

License
This project is licensed under the MIT License.
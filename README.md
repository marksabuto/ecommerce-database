# E-commerce Database System

A robust and scalable database solution for modern e-commerce platforms, featuring comprehensive product management, inventory tracking, and variation handling capabilities.

## 📋 Table of Contents
- [Features](#-features)
- [Database Architecture](#-database-architecture)
- [Getting Started](#-getting-started)
- [Project Structure](#-project-structure)
- [Usage Examples](#-usage-examples)
- [Documentation](#-documentation)
- [Contributors](#-contributors)
- [License](#-license)

## ✨ Features

- **Product Management**
  - Complete product catalog system
  - Hierarchical category organization
  - Brand management
  - Product variations (size, color)
  - Dynamic product attributes
  - Multi-image support

- **Inventory System**
  - SKU-based inventory tracking
  - Stock level monitoring
  - Price management
  - Product variation tracking

- **Data Integrity**
  - Cascading deletes
  - Automatic timestamps
  - Data validation
  - Referential integrity

## 🏗️ Database Architecture

The database is designed with scalability and flexibility in mind, featuring the following core components:

### Core Tables
- `brand` - Product manufacturers and brands
- `product_category` - Hierarchical product classification
- `product` - Base product information
- `product_item` - Specific product variants and SKUs
- `product_variation` - Variation type definitions

### Variation System
- `size_category` - Size classification
- `size_option` - Available size options
- `color` - Color definitions
- `item_color` - Product color associations
- `item_size` - Product size associations

### Attribute System
- `attribute_type` - Attribute data types
- `attribute_category` - Attribute classification
- `product_attribute` - Product specifications

### Media Management
- `product_image` - Product images and media

## 🚀 Getting Started

### Prerequisites
- MySQL 8.0+ or MariaDB 10.5+
- Command line tools (bash, mysql client)
- Git

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/marksabuto/ecommerce-database.git
   cd ecommerce-database
   ```

2. Set up the database:
   ```bash
   ./scripts/db_setup.sh
   ```
   > Note: Default credentials are root/password. Modify the script for production use.

3. To reset the database:
   ```bash
   ./scripts/db_reset.sh
   ```

## 📁 Project Structure

```
ecommerce-database/
├── docs/                   # Documentation
│   ├── ERD_Diagram.PDF    # Entity Relationship Diagram
│   ├── data_flow.md       # Data flow documentation
│   └── design_decisions.md # Design decisions
├── sql/                    # SQL scripts
│   ├── 01_schema.sql      # Database schema
│   ├── 02_constraints.sql # Constraints
│   ├── 03_sample_data.sql # Sample data
│   └── 04_queries.sql     # Example queries
├── scripts/               # Utility scripts
│   ├── db_setup.sh       # Setup database
│   └── db_reset.sh       # Reset database
├── README.md             # Project documentation
└── .gitignore           # Git ignore rules
```

## 💡 Usage Examples

### Inventory Management
```sql
-- Find products with low stock
SELECT p.product_name, pi.sku, pi.quantity_in_stock
FROM product p
JOIN product_item pi ON p.product_id = pi.product_id
WHERE pi.quantity_in_stock < 20;
```

### Product Variations
```sql
-- Get all available colors for a product
SELECT DISTINCT c.color_name
FROM product p
JOIN product_item pi ON p.product_id = pi.product_id
JOIN item_color ic ON pi.item_id = ic.item_id
JOIN color c ON ic.color_id = c.color_id
WHERE p.product_name = 'iPhone 13';
```

## 📚 Documentation

- [Entity Relationship Diagram](docs/ERD_Diagram.PDF) - Visual representation of database schema
- [Data Flow Documentation](docs/data_flow.md) - System data flow and relationships
- [Design Decisions](docs/design_decisions.md) - Architectural choices and rationale

## 👥 Contributors

- **Marks Abuto** - Schema design and queries
- **Nols** - Sample data implementation

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
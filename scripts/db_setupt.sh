#!/bin/bash

# Database setup script for e-commerce project
# Usage: ./scripts/db_setup.sh [database_name] [username] [password]

DB_NAME=${1:-ecommerce}
DB_USER=${2:-root}
DB_PASS=${3:-password}  # In production, use environment variables or a config file

# Check if MySQL is running
if ! systemctl is-active --quiet mysql; then
    echo "MySQL is not running. Starting MySQL service..."
    sudo systemctl start mysql
fi

echo "Setting up $DB_NAME database..."

# Create database
mysql -u $DB_USER -p$DB_PASS -e "DROP DATABASE IF EXISTS $DB_NAME; CREATE DATABASE $DB_NAME;"

# Run schema scripts
echo "Creating schema..."
mysql -u $DB_USER -p$DB_PASS $DB_NAME < sql/01_schema.sql

echo "Adding constraints..."
mysql -u $DB_USER -p$DB_PASS $DB_NAME < sql/02_constraints.sql

echo "Loading sample data..."
mysql -u $DB_USER -p$DB_PASS $DB_NAME < sql/03_sample_data.sql

echo "Database setup complete for $DB_NAME"
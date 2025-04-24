#!/bin/bash

# Database reset script for e-commerce project
# Usage: ./scripts/db_reset.sh [database_name] [username] [password]

DB_NAME=${1:-ecommerce}
DB_USER=${2:-root}
DB_PASS=${3:-password}  # In production, use environment variables or a config file

echo "Resetting $DB_NAME database..."

# Drop and recreate database
mysql -u $DB_USER -p$DB_PASS -e "DROP DATABASE IF EXISTS $DB_NAME; CREATE DATABASE $DB_NAME;"

# Rerun all setup scripts
echo "Recreating schema..."
mysql -u $DB_USER -p$DB_PASS $DB_NAME < sql/01_schema.sql

echo "Reapplying constraints..."
mysql -u $DB_USER -p$DB_PASS $DB_NAME < sql/02_constraints.sql

echo "Reloading sample data..."
mysql -u $DB_USER -p$DB_PASS $DB_NAME < sql/03_sample_data.sql

echo "Database reset complete for $DB_NAME"
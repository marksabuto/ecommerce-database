# E-commerce Data Flow Diagram

## System Overview
The e-commerce system follows a structured data flow pattern with the following main components:
1. Product Management
2. Inventory Management
3. Category Management
4. Attribute Management
5. Image Management

## Data Flow Description

### 1. Product Management Flow
```
[Product Creation] → [Brand Assignment] → [Category Assignment] → [Product Base Info]
        ↓
[Variation Creation] → [Color/Size Assignment] → [SKU Generation] → [Inventory Setup]
```

### 2. Category Management Flow
```
[Category Creation] → [Hierarchy Setup] → [Product Assignment] → [Category Tree]
```

### 3. Attribute Management Flow
```
[Attribute Type Definition] → [Attribute Category Creation] → [Product Attribute Assignment]
```

### 4. Inventory Management Flow
```
[Product Item Creation] → [Stock Level Update] → [Price Setting] → [Inventory Tracking]
```

### 5. Image Management Flow
```
[Image Upload] → [Product Association] → [Primary Image Setting] → [Image Storage]
```

## Key Data Relationships

### Product to Variations
- One product can have multiple variations
- Variations can be of different types (color, size, other)
- Each variation results in a unique SKU

### Product to Categories
- Products belong to one primary category
- Categories can have parent-child relationships
- Products can be searched/filtered by category hierarchy

### Product to Attributes
- Products can have multiple attributes
- Attributes are organized by categories
- Attributes can be of different data types

### Product to Images
- Products can have multiple images
- One image is marked as primary
- Images can be associated with specific product items

## Data Validation Points
1. **Product Creation**
   - Brand must exist
   - Category must exist
   - Required fields must be populated

2. **Variation Creation**
   - Parent product must exist
   - Color/size combinations must be valid
   - SKU must be unique

3. **Inventory Updates**
   - Stock levels cannot be negative
   - Price must be positive
   - Updates must maintain data consistency

4. **Category Management**
   - No circular references in hierarchy
   - Category names must be unique within parent
   - Deleting categories must handle product reassignment

5. **Attribute Management**
   - Attribute types must be valid
   - Values must match data type
   - Required attributes must be present 
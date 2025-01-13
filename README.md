# logistics_and_inventory_management_system

# Introduction:
Efficient logistics and inventory management are critical for businesses to streamline supply chain operations, reduce costs, and ensure timely delivery of goods. A well-designed Database Management System (DBMS) can play a pivotal role in managing inventory, tracking shipments, and analyzing data.

# Objective:
To streamline logistics and inventory management for a company like FedEx or Amazon using a DBMS that tracks real-time inventory, orders, and shipments while ensuring data integrity with foreign keys, cascading constraints, and generating insightful reports.

# System Overview:
# Inventory Management:

Tracks product stock levels and triggers reorders when stock falls below a threshold.

# Order Tracking:

Records customer orders and their associated products and quantities.
Ensures orders can be easily linked to shipment records for real-time tracking.

# Shipment Tracking:

Monitors the delivery status and estimated arrival time of shipments.
Database Design Features:

# Foreign Keys:

Ensures data consistency by linking OrderDetails to Orders and Products, and Shipments to Orders.

# Cascading Constraints:

ON DELETE CASCADE: Automatically removes dependent records (e.g., deleting an order will remove its order details and associated shipments).
Normalization:

Reduces data redundancy by separating Products, Orders, OrderDetails, and Shipments into related tables.
Key Functionalities:

# Real-Time Inventory Updates:

Stock levels are updated dynamically based on order and shipment data.

# Order and Shipment Integration:

Orders are linked with shipment details, enabling real-time tracking for customers and internal teams.

# Advanced Reporting:

Low stock alerts.
Shipment status reports.
Customer-specific order summaries.
Daily sales performance insights.

# Tables and Relationships:
Products
Stores product details.
Primary Key: ProductID

# Suppliers
Stores supplier details.
Primary Key: SupplierID

# Orders
Tracks customer orders.
Primary Key: OrderID

# OrderDetails
Links orders to the products they contain.
Primary Key: OrderDetailID
Foreign Keys: OrderID → Orders(OrderID), ProductID → Products(ProductID)

# Shipments
Tracks shipment details for each order.
Primary Key: ShipmentID
Foreign Key: OrderID → Orders(OrderID)

# Relationships:
Products → OrderDetails: One product can appear in multiple orders.
Orders → OrderDetails: One order can have multiple products.
Orders → Shipments: Each order can have one or more shipments.

# ER Diagram Representation
# Entities and Relationships:

Products → OrderDetails (One-to-Many)
Orders → OrderDetails (One-to-Many)
Orders → Shipments (One-to-Many)


# Benefits:
Operational Efficiency: Automates tracking, reduces manual errors, and speeds up order processing.
Improved Decision-Making: Real-time data and advanced reports help optimize stock levels and improve delivery times.
Enhanced Customer Satisfaction: Provides accurate shipment tracking and timely order fulfillment.

# Conclusion:
This Logistics and Inventory Management System DBMS effectively supports a logistics company’s operations by integrating inventory, orders, and shipments, backed by robust data integrity and real-time insights.

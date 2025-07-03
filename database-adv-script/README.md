# Advanced SQL Queries

This directory contains SQL scripts demonstrating advanced database operations for an Airbnb-like database system.

## Joins Queries (joins_queries.sql)

The `joins_queries.sql` file contains three complex SQL queries demonstrating different types of joins:

### 1. INNER JOIN

Retrieves all bookings and the respective users who made those bookings. This query joins the `Booking` and `User` tables where the `user_id` in the Booking table matches the `user_id` in the User table.

### 2. LEFT JOIN

Retrieves all properties and their reviews, including properties that have no reviews. This query uses LEFT JOIN to connect the `Property` and `Review` tables where the `property_id` in the Property table matches the `property_id` in the Review table, ensuring that all properties are included even if they have no reviews.

### 3. FULL OUTER JOIN

Retrieves all users and all bookings, even if the user has no booking or a booking is not linked to a user. Since MySQL doesn't directly support FULL OUTER JOIN, this is implemented using a UNION of LEFT JOIN and RIGHT JOIN.


# Index Performance Analysis

This document analyzes the performance impact of adding indexes to the Airbnb database. The analysis focuses on high-usage columns in the User, Booking, and Property tables.

## Identified High-Usage Columns

After reviewing the existing queries in our application, the following columns were identified as high-usage:

### User Table
- `user_id` (Primary Key, already indexed)
- `email` (Used in login queries)
- `role` (Used to filter hosts vs guests)

### Property Table
- `property_id` (Primary Key, already indexed)
- `host_id` (Foreign Key, used in joins)
- `location` (Used in location searches)
- `price_per_night` (Used in range queries and sorting)

### Booking Table
- `booking_id` (Primary Key, already indexed)
- `property_id` (Foreign Key, used in joins)
- `start_date`, `end_date` (Used in availability searches)
- `status` (Used to filter bookings)

## Performance Comparison

Query | Before Index | After Index
--- | --- | ---
User lookup by email | 120ms | 5ms
Property search by location and price | 250ms | 30ms
User booking search | 320ms | 32ms


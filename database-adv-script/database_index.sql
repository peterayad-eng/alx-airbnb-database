-- Performance Measurement Section
-- =================================================================
-- First, let's measure the performance of some common queries BEFORE adding indexes

-- Measure performance of user lookup by email
EXPLAIN ANALYZE 
SELECT * FROM 'User' 
WHERE Email = 'example@email.com';

-- Measure performance of property search by location and price
EXPLAIN ANALYZE 
SELECT * FROM Property 
WHERE location LIKE 'New York%' AND price_per_night BETWEEN 100 AND 200;

-- Measure performance of user booking search
EXPLAIN ANALYZE
SELECT b.*, p.name
FROM Booking b
JOIN Property p ON b.property_id = p.property_id
WHERE b.user_id = 'a1b2c3d4-e5f6-7890-g1h2-i3j4k5l6m7n8'
AND b.status = 'confirmed'
ORDER BY b.start_date DESC;

-- Create Indexes for Performance
-- =================================================================
-- Indexes are crucial for speeding up query performance, especially
-- on columns that are frequently used in WHERE clauses or JOINs.

-- Index on User table
CREATE INDEX idx_user_email ON 'User'(email);
CREATE INDEX idx_user_role ON 'User'(role);

-- Indexes on Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_dates ON Booking(start_date, end_date);
CREATE INDEX idx_booking_status ON Booking(status);

-- Index on Property table
CREATE INDEX idx_property_host ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);


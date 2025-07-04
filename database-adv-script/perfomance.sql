-- =======================================================================================================
-- 1- query that retrieves all bookings along with the user details, property details, and payment details
-- =======================================================================================================

SELECT b.*, u.*, p.*, pay.*, r.*
FROM Booking b
JOIN 'User' u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON pay.booking_id = pay.booking_id;

-- ================================================================================
-- 2- Analyze the query’s performance using EXPLAIN and identify any inefficiencies
-- ================================================================================

EXPLAIN ANALYZE
SELECT b.*, u.*, p.*, pay.*, r.*
FROM Booking b
JOIN 'User' u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON pay.booking_id = pay.booking_id
WHERE b.start_date >= '2025-01-01' AND b.end_date <= '2025-06-01'
ORDER BY b.start_date DESC
LIMIT 100;

-- ==============================================
-- 3- Refactor the query to reduce execution time
-- ==============================================

SELECT b.booking_id, b.user_id, u.first_name, u.last_name, u.email, u.phone_number,
       b.property_id, p.name, p.description, p.location, p.price_per_night,
       b.start_date, b.end_date, b.total_price, b.status,
       pay.payment_id, pay.amount, pay.payment_date, pay.payment_method
FROM Booking b
JOIN 'User' u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON pay.booking_id = pay.booking_id;

-- ======================================================
-- 4- Analyze the query’s performance after modifications
-- ======================================================

EXPLAIN ANALYZE
SELECT b.booking_id, b.user_id, u.first_name, u.last_name, u.email, u.phone_number,
       b.property_id, p.name, p.description, p.location, p.price_per_night,
       b.start_date, b.end_date, b.total_price, b.status,
       pay.payment_id, pay.amount, pay.payment_date, pay.payment_method
FROM Booking b
JOIN 'User' u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON pay.booking_id = pay.booking_id
WHERE b.start_date >= '2025-01-01' AND b.end_date <= '2025-06-01'
ORDER BY b.start_date DESC
LIMIT 100;


-- ===============================================================
-- 1- query to find the total number of bookings made by each user
-- ===============================================================

SELECT u.user_id, u.first_name, u.last_name, u.email, COUNT(b.booking_id) AS booking_count
FROM 'User' u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name, u.email;

-- ===========================================================================
-- 2- rank properties based on the total number of bookings they have received
-- ===========================================================================

SELECT p.property_id, p.name, p.description, p.location, p.price_per_night,
       COUNT(b.booking_id) AS booking_count,
       RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
       ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_row_num
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name, p.description, p.location, p.price_per_night
ORDER BY booking_count DESC;


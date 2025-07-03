-- ==================================================================================
-- 1- INNER JOIN to get all bookings and the respective users who made those bookings
-- ==================================================================================

SELECT b.booking_id, u.first_name, u.last_name, u.email, b.start_date, b.end_date, b.total_price 
FROM Booking b
INNER JOIN 'User' u ON b.user_id = u.user_id
ORDER BY b.start_date DESC;

-- ====================================================================================================
-- 2- LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
-- ====================================================================================================

SELECT p.property_id, p.name, p.description, p.location, p.price_per_night, r.rating, r.comment
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id
ORDER BY p.name ASC;

-- ===============================================================================================================================
-- 3- FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
-- ===============================================================================================================================

SELECT u.user_id, u.first_name, u.last_name, u.email, u.phone_number, u.role,
       b.booking_id, b.property_id, b.start_date, b.end_date, b.total_price, b.status
FROM 'User' u
LEFT JOIN Booking b ON u.user_id = b.user_id
UNION
SELECT u.user_id, u.first_name, u.last_name, u.email, u.phone_number, u.role,
       b.booking_id, b.property_id, b.start_date, b.end_date, b.total_price, b.status
FROM 'User' u
RIGHT JOIN Booking b ON u.user_id = b.user_id;
WHERE u.user_id = NULL
ORDER BY u.first_name, b.booking_id;


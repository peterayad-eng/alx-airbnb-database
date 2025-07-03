-- ============================================================================
-- 1- query to find all properties where the average rating is greater than 4.0
-- ============================================================================

SELECT * FROM (
	SELECT p.propeity_id, p.name, p.description,p.location,p.price_per_night, (
		SELECT AVG(r.rating)
        	FROM Review r
        	WHERE r.property_id = p.property_id) AS avg_rating
	FROM Property p) AS sub_query
WHERE sub_query.avg_rating > 4.0;

-- =======================================================================
-- 2- correlated subquery to find users who have made more than 3 bookings
-- =======================================================================

SELECT u.first_name, u.last_name, u.email, (
	SELECT COUNT(*) FROM Booking b
	WHERE b.user_id = u.user_id) AS booking_count
FROM 'User' u
WHERE (
	SELECT COUNT(*) FROM Booking b
	WHERE b.user_id = u.user_id) > 3
ORDER BY booking_count DESC;


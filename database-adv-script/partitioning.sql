-- ===============================
-- 1- Create new partitioned table
-- ===============================

CREATE TABLE Booking_Partitioned (
    booking_id SERIAL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

-- ====================
-- 2- Create partitions
-- ====================

CREATE TABLE Booking_2023 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- ===============================
-- 3- Create indexes on partitions
-- ===============================

CREATE INDEX idx_booking2023_user_id ON Booking_2023(user_id);
CREATE INDEX idx_booking2023_property_id ON Booking_2023(property_id);

CREATE INDEX idx_booking2024_user_id ON Booking_2024(user_id);
CREATE INDEX idx_booking2024_property_id ON Booking_2024(property_id);

-- ===========================================================
-- 4- Test the performance of queries on the partitioned table
-- ===========================================================

-- Query on non-partitioned table (for comparison)
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2023-01-15' AND '2023-01-20';

-- Query on partitioned table
EXPLAIN ANALYZE
SELECT * FROM Booking_Partitioned
WHERE start_date BETWEEN '2023-01-15' AND '2023-01-20';


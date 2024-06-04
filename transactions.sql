START TRANSACTION;

INSERT INTO trips (user_id, trip_name, start_date, end_date) VALUES (1, 'Есенно приключение', '2024-09-10', '2024-09-20');
SET @new_trip_id = LAST_INSERT_ID();

INSERT INTO bookings (trip_id, destination_id, booking_date) VALUES (@new_trip_id, 1, '2024-09-11');
INSERT INTO bookings (trip_id, destination_id, booking_date) VALUES (@new_trip_id, 3, '2024-09-15');

COMMIT;

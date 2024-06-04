CREATE VIEW user_trips AS
SELECT u.username, t.trip_name, t.start_date, t.end_date
FROM users u
JOIN trips t ON u.user_id = t.user_id;

CREATE VIEW trip_destinations AS
SELECT t.trip_name, d.destination_name, d.city, d.country
FROM trips t
JOIN bookings b ON t.trip_id = b.trip_id
JOIN destinations d ON b.destination_id = d.destination_id;

CREATE VIEW destination_reviews AS
SELECT d.destination_name, r.review_text, r.rating
FROM destinations d
JOIN reviews r ON d.destination_id = r.destination_id;

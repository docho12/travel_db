CREATE INDEX idx_username ON users(username);

CREATE INDEX idx_trip_dates ON trips(start_date, end_date);

CREATE INDEX idx_email_prefix ON users(email(10));

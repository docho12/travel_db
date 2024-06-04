-- Прост индекс
CREATE INDEX idx_username ON users(username);

-- Съставен индекс
CREATE INDEX idx_trip_dates ON trips(start_date, end_date);

-- Префиксен индекс (примерен за CHAR или VARCHAR колони)
CREATE INDEX idx_email_prefix ON users(email(10));

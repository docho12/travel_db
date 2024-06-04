CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE trips (
    trip_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    trip_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE destinations (
    destination_id INT AUTO_INCREMENT PRIMARY KEY,
    destination_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    trip_id INT NOT NULL,
    destination_id INT NOT NULL,
    booking_date DATE,
    FOREIGN KEY (trip_id) REFERENCES trips(trip_id),
    FOREIGN KEY (destination_id) REFERENCES destinations(destination_id)
);

CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    destination_id INT NOT NULL,
    review_text TEXT,
    rating INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (destination_id) REFERENCES destinations(destination_id)
);

INSERT INTO users (username, email) VALUES 
('ivan_todorow', 'ivan12@abv.bg'), 
('ivaila.dimitrova', 'ivi1412@gmail.com'), 
('krisi_.bonev', 'docho12@mail.bg');

INSERT INTO trips (user_id, trip_name, start_date, end_date) VALUES 
(1, 'Лятна почивка', '2024-06-15', '2024-06-30'), 
(2, 'Зимна приказка', '2024-12-20', '2025-01-05'), 
(3, 'Пролетен отдих', '2024-03-10', '2024-03-20');

INSERT INTO destinations (destination_name, country, city) VALUES 
('Белоградчишките скали’, ‘България’, 'Белоградчик'), 
(‘Чудните мостове’ , ‘България’, 'Родопите'), 
('Седемте рилски езера', ‘България’, 'Рила');

INSERT INTO bookings (trip_id, destination_id, booking_date) VALUES 
(1, 1, '2024-07-16'), 
(2, 2, '2024-12-21'), 
(3, 3, '2024-03-11');

INSERT INTO reviews (user_id, destination_id, review_text, rating) VALUES 
(1, 1, 'Китно място за отдих!', 5), 
(2, 2, 'Богата история, събрана в малко селце в Родопите!', 4), 
(3, 3, 'Гледка, която те оставя без дъх’ , 5);


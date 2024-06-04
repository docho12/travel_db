CREATE TRIGGER before_insert_user
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END;

CREATE TRIGGER after_insert_user
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO profiles (user_id, profile_created_at) VALUES (NEW.user_id, NOW());
END;

CREATE TRIGGER before_update_review
BEFORE UPDATE ON reviews
FOR EACH ROW
BEGIN
    IF NEW.rating < 1 THEN
        SET NEW.rating = 1;
    END IF;
    IF NEW.rating > 5 THEN
        SET NEW.rating = 5;
    END IF;
END;

CREATE TRIGGER after_update_review
AFTER UPDATE ON reviews
FOR EACH ROW
BEGIN
    UPDATE destinations SET avg_rating = (SELECT AVG(rating) FROM reviews WHERE destination_id = NEW.destination_id) WHERE destination_id = NEW.destination_id;
END;

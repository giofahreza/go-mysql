CREATE TABLE users (
	id int(11) PRIMARY KEY auto_increment,
	name varchar(200),
	age int(3),
	CONSTRAINT chk_age CHECK (age >= 21 AND age <=50)
);

ALTER TABLE users 
ADD CONSTRAINT chk_name CHECK (CHAR_LENGTH(name) >= 4);

ALTER TABLE users
DROP CONSTRAINT chk_age;

ALTER TABLE users
ADD CONSTRAINT chk_age CHECK (age >= 20 AND age <= 50);

UPDATE users SET age = 20 WHERE age<=20;

INSERT INTO users (name, age)
VALUES ('Cahyo', 10);

SELECT *, LENGTH(name) FROM users;

SELECT * FROM users WHERE name like '%B%';

-- -------------------------------------------------------------------- Indexing

INSERT INTO users (name, age) VALUES
    ('Alice Johnson', 25), ('Bob Smith', 30), ('Charlie Brown', 45), ('David White', 28),
    ('Emma Roberts', 33), ('Frank Harris', 40), ('Grace Lee', 22), ('Henry Adams', 27),
    ('Isabella Lewis', 36), ('Jack Martinez', 42), ('Karen Turner', 29), ('Liam Scott', 31),
    ('Mia Walker', 38), ('Nathan Hall', 24), ('Olivia Allen', 50), ('Paul Young', 26),
    ('Quinn King', 44), ('Rachel Wright', 35), ('Samuel Green', 37), ('Taylor Baker', 32),
    ('Ursula Carter', 39), ('Victor Nelson', 23), ('Wendy Parker', 41), ('Xavier Moore', 34),
    ('Yasmine Brooks', 46), ('Zachary Reed', 21), ('Andrea Jenkins', 48), ('Brian Murphy', 47),
    ('Catherine Sanders', 49), ('Derek Foster', 43), ('Elaine Price', 22), ('Felix Hughes', 25),
    ('Gina Rogers', 30), ('Howard Ward', 45), ('Irene Simmons', 28), ('James Bennett', 33),
    ('Kelly Coleman', 40), ('Leo Alexander', 22), ('Molly Patterson', 27), ('Nick Bryant', 36),
    ('Olga Russell', 42), ('Patrick Griffin', 29), ('Quincy Diaz', 31), ('Rebecca Hayes', 38),
    ('Steve Ross', 24), ('Tina Edwards', 50), ('Ulysses Watson', 26), ('Vera Powell', 44),
    ('Walter Hughes', 35), ('Xander Torres', 37), ('Yvette Jenkins', 32), ('Zane Stevens', 39),
    ('Abigail Cooper', 23), ('Brandon Fisher', 41), ('Cindy Butler', 34), ('Dominic Howard', 46),
    ('Eleanor Foster', 21), ('Freddie Barnes', 48), ('Gloria Morris', 47), ('Harvey Graham', 49),
    ('Isabel Richardson', 43), ('Jackson Powell', 22), ('Kimberly West', 25), ('Lorenzo Simmons', 30),
    ('Michelle Perry', 45), ('Noah James', 28), ('Ophelia Evans', 33), ('Peter Martinez', 40),
    ('Quincy Miller', 22), ('Rita Carter', 27), ('Stephen Brooks', 36), ('Tiffany Bailey', 42),
    ('Umar Bryant', 29), ('Vanessa Cooper', 31), ('Willie Hayes', 38), ('Xenia Parker', 24),
    ('Yusuf Morris', 50), ('Zelda Rogers', 26), ('Adrian Murphy', 44), ('Bethany Ward', 35),
    ('Caleb Simmons', 37), ('Diana Torres', 32), ('Ethan Stevens', 39), ('Fiona Diaz', 23),
    ('George Jenkins', 41), ('Hannah Edwards', 34), ('Isaac Watson', 46), ('Jasmine Hughes', 21),
    ('Kevin Barnes', 48), ('Laura Foster', 47), ('Mason Morris', 49), ('Nina Graham', 43),
    ('Oscar Richardson', 22), ('Pamela Powell', 25), ('Quentin West', 30), ('Ronald Perry', 45),
    ('Sophie James', 28), ('Travis Evans', 33), ('Ulyana Martinez', 40), ('Vince Miller', 22),
    ('Wendy Carter', 27), ('Xander Brooks', 36), ('Yvonne Bailey', 42), ('Zeke Bryant', 29);

CREATE INDEX idx_name ON users (name);

-- -------------------------------------------------------------------- Views

CREATE VIEW young_users AS
SELECT * FROM users WHERE age >= 20 and age <= 25;

SELECT * FROM young_users WHERE name like '%b%';

CREATE OR REPLACE VIEW young_users AS
SELECT * FROM users WHERE age >= 20 and age <= 30;

-- -------------------------------------------------------------------- Triggers

CREATE TABLE user_delete_log (
	id int(11) PRIMARY KEY auto_increment,
	user_id int(11),
	name varchar(200),
	age int(3)
)

CREATE TRIGGER user_on_delete AFTER DELETE ON users
FOR EACH ROW
BEGIN
	INSERT INTO user_delete_log (user_id, name, age)
	VALUES (OLD.id, OLD.name, OLD.age);
END;

SELECT * FROM user_delete_log;

DELETE FROM users WHERE id = 1;




CREATE TABLE user_update_log (
	id int(11) PRIMARY KEY auto_increment,
	user_id int(11),
	name varchar(200),
	age int(3)
)

DROP TRIGGER IF EXISTS user_on_update;
CREATE TRIGGER user_on_update BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
	INSERT INTO user_update_log (user_id, name, age)
	VALUES (OLD.id, OLD.name, OLD.age);
END;

UPDATE users SET name = 'Ryan' WHERE id = 2;

SELECT * FROM user_update_log;

SELECT * FROM users;
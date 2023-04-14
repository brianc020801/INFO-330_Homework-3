CREATE TABLE IF NOT EXISTS buildings(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(80) NOT NULL,
	shortname VARCHAR(10) UNIQUE
);

CREATE TABLE IF NOT EXISTS rooms(
	number INTEGER,
	buildingid REFERENCES buildings,
	seating INTEGER,
	id INTEGER PRIMARY KEY AUTOINCREMENT
);

INSERT INTO buildings (name, shortname) VALUES 
	('Mary Gates Hall', 'MGH'),
	('Kane Hall', 'KNE');

INSERT INTO rooms (number, buildingid, seating) VALUES (400, (SELECT id FROM buildings WHERE name="Mary Gates Hall"), 40);
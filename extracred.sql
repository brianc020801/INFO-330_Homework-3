CREATE TABLE IF NOT EXISTS timeslots(
	start datetime,
	end datetime,
	id INTEGER PRIMARY KEY AUTOINCREMENT	
);

CREATE TABLE IF NOT EXISTS schedule(
	coursecode REFERENCES courses,
	roomid REFERENCES rooms,
	timeslotid REFERENCES timeslots,
	UNIQUE(roomid, timeslotid)
);

INSERT INTO timeslots (start, end) VALUES 
	('2023-04-02 08:00:00', '2023-04-02 09:00:00'),
	('2023-04-02 09:00:00', '2023-04-02 10:00:00'),
	('2023-04-02 10:00:00', '2023-04-02 11:00:00');	

INSERT INTO schedule VALUES ((SELECT code FROM courses WHERE code = "INFO330A"), (SELECT id FROM rooms WHERE number = 400 AND buildingid = 1), (SELECT id FROM timeslots WHERE id = 1));

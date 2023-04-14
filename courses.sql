CREATE TABLE IF NOT EXISTS courses(
	code VARCHAR(40) PRIMARY KEY NOT NULL CHECK(length(code) >= 7),
	description VARCHAR(400),
	start DATE NOT NULL,
	end DATE NOT NULL CHECK(end > start)
);


INSERT INTO courses VALUES 
	('INFO330A', 'Data and databases', '2023-04-01', '2023-06-01'),
	('INFO314', 'Networking and distributed Systems', '2023-04-01', '2023-06-01'),
	('INFO448A', 'Introduction to iOS', '2023-09-25', '2023-12-19'),
	('INFO449A', 'Introduction to Android', '2023-09-25', '2023-12-19'),
	('BAW0100', 'Introduction to Basket-Weaving', '2023-04-01', '2023-06-01'),
	('BAW100A', 'Underwater Basket-Weaving', '2023-04-01', '2023-06-01');
	



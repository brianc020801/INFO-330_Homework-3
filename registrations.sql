CREATE TABLE IF NOT EXISTS student_courses(
	studentid REFERENCES students,
	course REFERENCES courses,
	grade DOUBLE DEFAULT NULL
);

INSERT INTO student_courses (studentid, course )VALUES 
	((SELECT id FROM students WHERE firstname = 'Fred' AND lastname = 'Flintstone'), 'INFO330A'),
	((SELECT id FROM students WHERE firstname = 'Fred' AND lastname = 'Flintstone'), 'INFO448A'),
	((SELECT id FROM students WHERE firstname = 'Fred' AND lastname = 'Flintstone'), 'INFO314'),
	((SELECT id FROM students WHERE firstname = 'Barney' AND lastname = 'Rubble'), 'INFO330A'),
	((SELECT id FROM students WHERE firstname = 'Barney' AND lastname = 'Rubble'), 'INFO449A'),
	((SELECT id FROM students WHERE firstname = 'Wilma' AND lastname = 'Flintstone'), 'BAW0100'),
	((SELECT id FROM students WHERE firstname = 'Wilma' AND lastname = 'Flintstone'), 'BAW100A'),
	((SELECT id FROM students WHERE firstname = 'Betty' AND lastname = 'Rubble'), 'BAW0100');

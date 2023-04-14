CREATE TABLE IF NOT EXISTS student_courses(
	studentid FOREIGN KEY REFERENCES students,
	course FOREIGN KEY REFERENCES courses,
	grade DOUBLE DEFAULT NULL
);

INSERT INTO student_courses VALUES 

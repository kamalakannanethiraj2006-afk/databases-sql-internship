
-- DATABASE: Student Management System

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- INSERT SAMPLE DATA

INSERT INTO Students VALUES
(1, 'Arun', 'Chennai'),
(2, 'Bala', 'Madurai'),
(3, 'Kumar', 'Coimbatore');

INSERT INTO Courses VALUES
(101, 'Java'),
(102, 'Python'),
(103, 'SQL');

INSERT INTO Enrollments VALUES
(1, 1, 101),
(2, 2, 102),
(3, 3, 103),
(4, 1, 103);

INSERT INTO Payments VALUES
(1, 1, 5000.00),
(2, 2, 4000.00),
(3, 3, 6000.00);
-- QUESTION 1:
-- Display student names and course names.

SELECT
    Students.student_name,
    Courses.course_name
FROM Students
INNER JOIN Enrollments
    ON Students.student_id = Enrollments.student_id
INNER JOIN Courses
    ON Enrollments.course_id = Courses.course_id;
-- QUESTION 2:
-- Display student names and their payment amounts.

SELECT
    Students.student_name,
    Payments.amount
FROM Students
INNER JOIN Payments
    ON Students.student_id = Payments.student_id;
-- QUESTION 3:
-- Display each student's total payment amount.

SELECT
    Students.student_name,
    SUM(Payments.amount) AS total_payment
FROM Students
INNER JOIN Payments
    ON Students.student_id = Payments.student_id
GROUP BY
    Students.student_id,
    Students.student_name;




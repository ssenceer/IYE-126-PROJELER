-- Veritabanı oluşturma
CREATE DATABASE student_management_system;

-- Veritabanına bağlanma
\c student_management_system;

-- Students tablosu
CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);

-- Courses tablosu
CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100)
);

-- Enrollments tablosu
CREATE TABLE Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES Students(student_id),
    course_id INT REFERENCES Courses(course_id),
    grade VARCHAR(2)
);

-- Öğrenci verisi ekleme
INSERT INTO Students (first_name, last_name, department) VALUES 
('Ali', 'Yılmaz', 'Bilgisayar Mühendisliği'),
('Ayşe', 'Demir', 'Makine Mühendisliği'),
('Mehmet', 'Kaya', 'Elektrik-Elektronik Mühendisliği');

-- Ders verisi ekleme
INSERT INTO Courses (course_name) VALUES 
('Veri Tabanı Yönetim Sistemleri'),
('Algoritmalar'),
('Mikroişlemciler');

-- Kayıt verisi ekleme
INSERT INTO Enrollments (student_id, course_id, grade) VALUES 
(1, 1, 'A'),
(1, 2, 'B+'),
(2, 1, 'B'),
(3, 3, 'A-');

--Tüm öğrencileri listeleme
SELECT * FROM Students;

--Belirli bir öğrencinin aldığı dersleri ve notlarını listeleme
SELECT 
    s.first_name, s.last_name, c.course_name, e.grade
FROM 
    Enrollments e
JOIN 
    Students s ON e.student_id = s.student_id
JOIN 
    Courses c ON e.course_id = c.course_id
WHERE 
    s.student_id = 1;


--Bir öğrenciye yeni ders ekleme
INSERT INTO Enrollments (student_id, course_id, grade) VALUES 
(1, 3, 'A');

--Öğrencinin notunu güncelleme
UPDATE Enrollments
SET grade = 'A+'
WHERE student_id = 1 AND course_id = 2;

-- Öğrenci silme
DELETE FROM Enrollments WHERE student_id = 1;
DELETE FROM Students WHERE student_id = 1;


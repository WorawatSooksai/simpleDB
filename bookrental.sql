CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT
);

-- ตารางหนังสือ
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    language ENUM('Thai', 'English') NOT NULL,
    rental_price DECIMAL(5,2) NOT NULL -- ค่าเช่าเป็นรายสัปดาห์
);

-- ตารางการเช่า
CREATE TABLE rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    rental_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE
);

-- เพิ่มข้อมูลตัวอย่างในตาราง books
INSERT INTO books (title, author, language, rental_price) VALUES
('คุณชายปวรรุจ', 'รอมแพง', 'Thai', 50.00),
('นิทานพื้นบ้านไทย', 'กรมศิลปากร', 'Thai', 40.00),
('เศรษฐศาสตร์เบื้องต้น', 'สมชาย นิ่มสุวรรณ', 'Thai', 55.00),
('Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 'English', 60.00),
('Lord of the Rings', 'J.R.R. Tolkien', 'English', 70.00),
('คิดแบบยิว ทำแบบญี่ปุ่น', 'ทาคาฟูมิ ฮาเซกาวา', 'Thai', 45.00),
('The Great Gatsby', 'F. Scott Fitzgerald', 'English', 50.00),
('Atomic Habits', 'James Clear', 'English', 65.00),
('1984', 'George Orwell', 'English', 55.00),
('To Kill a Mockingbird', 'Harper Lee', 'English', 50.00),
('การตลาด 4.0', 'Philip Kotler', 'Thai', 60.00),
('Data Science for Business', 'Foster Provost', 'English', 75.00),
('The Power of Habit', 'Charles Duhigg', 'English', 65.00),
('One Up on Wall Street', 'Peter Lynch', 'English', 70.00),
('จิตวิทยาการลงทุน', 'ดร.นิเวศน์ เหมวชิรวรากร', 'Thai', 55.00),
('Rich Dad Poor Dad', 'Robert Kiyosaki', 'English', 60.00),
('AI Superpowers', 'Kai-Fu Lee', 'English', 65.00),
('พฤติกรรมผู้บริโภค', 'สมคิด ลวางกูร', 'Thai', 50.00),
('สังคมไทยยุคดิจิทัล', 'สมศักดิ์ ศรีสมบูรณ์', 'Thai', 45.00),
('The Lean Startup', 'Eric Ries', 'English', 70.00);

-- เพิ่มข้อมูลตัวอย่างในตาราง members
INSERT INTO members (name, email, phone, address) VALUES
('สมชาย ใจดี', 'somchai@example.com', '0812345678', '123 หมู่ 4 กรุงเทพฯ'),
('John Doe', 'john.doe@example.com', '0911122334', '456 Main St, NY, USA');

-- เพิ่มข้อมูลตัวอย่างในตาราง rentals
INSERT INTO rentals (member_id, book_id, rental_date, return_date) VALUES
(1, 3, '2025-01-15', '2025-01-22'),
(2, 10, '2025-01-10', '2025-01-17');

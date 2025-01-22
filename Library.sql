Create Database Library;

USE Library;

Create Table Author(
Author_ID VarChar(50) Primary key not null,
Author_Name Varchar(60) Not null,
Author_Nationality Varchar(20)
);

Create Table Book(
Book_ID VarChar(50) Primary key not null,
Book_Title VarChar(50) not null,
);

Alter Table Book
ADD Author_ID VarChar(50) references Author(Author_ID);

Create Table Members(
Member_ID VarChar(50) Primary key not null,
Member_Name VarChar(50) not null,
Member_Phone VarChar(50)
);

Create Table Borrow(
Borrow_ID VarChar(50) Primary key not null,
Borrow_Date Date not null
);

Alter Table Borrow
ADD Member_ID VarChar(50) references Members(Member_ID);

Alter Table Borrow
ADD Book_ID VarChar(50) references Book(Book_ID);

Create Table Returns(
Retrun_Date Date,
Fine_Amount Dec
);

Alter Table Returns
ADD Borrow_ID VarChar(50) references Borrow(Borrow_ID);

Insert Into Author (Author_ID, Author_Name,Author_Nationality)
Values 
('1','Ramez Elmasri','USA'),
('2', 'Joel Grus', 'USA'),
('3','Mark Lutz','UK');

Insert Into Members (Member_ID, Member_Name, Member_Phone)
Values 
('1','Ali Hassan','9876543210'),
('2', 'Fatima Noor', '9871234560');

Insert Into Book (Book_ID, Book_Title, Author_ID )
Values 
('B101','Database Systems', '1'),
('B205','Data Science','2'),
('B305','Python Basics','3');


Insert Into Borrow ( Borrow_ID, Member_ID, Book_ID, Borrow_Date)
Values
('201','1','B101','2025-01-10'),
('202','2','B205','2025-01-12'),
('203','1','B305','2025-01-10');

Insert Into Returns (Borrow_ID,Retrun_Date,Fine_Amount)
Values
('201','2025-01-20','0'),
('202','2025-01-25','5'),
('203','2025-01-22','2');

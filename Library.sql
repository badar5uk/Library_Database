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


# Step by step to creating Database

The current table Contains an unsorted and big table with several entities that have relations, the first step would be to try and divide the table into several tables with appropriate primary keys.
![First step](https://github.com/badar5uk/Library_Database/blob/main/Diagrams/unsorted%20table.jpg)

The three main entities would be Members, Books and Borrow transactions those can be separated further, the tables would look like this:

![Step 2](https://github.com/badar5uk/Library_Database/blob/main/Diagrams/step%202.jpg)

As can be seen, we now a clearer table relation but there are missing elements as appropriate primary keys and foreign keys, we can easily fix this by adding a Member_ID column as a primary key to the members column and separating the book table into two tables, Book and Author:

![Step 3](https://github.com/badar5uk/Library_Database/blob/main/Diagrams/step%203.jpg)

With adding the foreign keys and appropriate primary keys we got the above tables which can be further divided into smaller tables, we can divide the Borrows/Returns table further; this would result into Borrow and Return tables which the tables would also need the member ID to associate the borrowing with a member:
![Step 4](https://github.com/badar5uk/Library_Database/blob/main/Diagrams/step%204.jpg)

The final step would be to map the tables with appropriate relations and this would look as follows:
![Step 5](https://github.com/badar5uk/Library_Database/blob/main/Diagrams/step%205.jpg)

These steps would ensure that the Table has undergone Normalization and that the rules of 1NF, 2NF and 3NF have been applied to the original unsorted table, we can now easily create an Entity Relation Digram (ERD) from the current mapping, which is illustrated as:


![ERD](https://github.com/badar5uk/Library_Database/blob/main/ERD.jpg)


Having all the above we can move towards creating the database in MSSQL:

```
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

```

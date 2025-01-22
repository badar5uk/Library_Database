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


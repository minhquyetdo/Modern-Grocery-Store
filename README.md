# Modern Grocery Store Database Management System

A comprehensive **database management system** designed specifically for modern grocery stores like 7-Eleven and GS25. \
This database serves as a centralized repository for managing various aspects of the store's operations, including **item inventory**, **sales transactions**, **employee information**, **supplier details**, and **purchase records**.
## Overview

[grocery-store.drawio.pdf](https://github.com/minhquyetdo/Modern-Grocery-Store/files/11712672/grocery-store.drawio.pdf)

**Technical features** in this database:
|Features| Description |
|:------|-----------:|
|RDBMS|MySQL|
|Relational Database Concepts|Primary Key: A unique identifier for each record in a table.|
||Foreign Key: A column that references the primary key of another table, establishing a relationship between the two tables.|
||Relationships: Connections between tables, such as one-to-one, one-to-many, or many-to-many relationships.|
|Database Architecture| Normalization (3NF): Organizing data in a database to eliminate redundancy and dependency issues. |
|| Indexing: The technique of creating indexes on specific columns to optimize search performance. |


#### What is inside the repository 
|Files| Description |
|:------|-----------:|
|what-how-why.txt|Database explain|
|create-tables.sql|Source code for creating tables in the "grocery_store" database.|
|entity-relationship-diagram.mwb|Relationship between tables (entities) in database.|
|entity-relationship-model.png|Entities and actions, events in application.|
|functional-dependency.pdf|Functional dependency in tables.|


## Clone the database

#### Requirements and Setting for MySQL
To create and run the database, you need to have MySQL installed on your system. Follow these steps:

1. Install MySQL: Download and install the latest version of [MySQL](https://www.mysql.com/downloads/) from the official website.

2. Start MySQL Server: Once installed, start the MySQL server.

3. Connect to MySQL: Open a terminal or command prompt and connect to MySQL using the following command:
```cli
mysql -u [username] -p
```
4. Create Database: Create a new database by executing the following command:
```cli
CREATE DATABASE grocery_store;
```
5. Use the Database: Switch to the newly created database:
```cli
USE grocery_store;
```
6. Run SQL Scripts: Execute the SQL scripts provided in the repository to create the necessary tables and relationships. You can use a tool like MySQL Workbench or execute the scripts via the command line.

7. Start Using the Database: Once the tables are created, you can start using the grocery store database for your application.

## License

Feel free to contribute, make improvements, or use the code as a reference for your own grocery store database management system.





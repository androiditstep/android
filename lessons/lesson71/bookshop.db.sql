BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `publishers` (
	`id`	integer PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 100 ) NOT NULL,
	`internet_adress`	varchar ( 250 ) NOT NULL
);
INSERT INTO `publishers` (id,name,internet_adress) VALUES (1,'Publisher1','https://www.google.com/'),
 (2,'Publisher2','https://www.publisher.com/');
CREATE TABLE IF NOT EXISTS `books` (
	`id`	integer PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 100 ) NOT NULL,
	`year`	varchar ( 50 ) NOT NULL,
	`list_number`	int NOT NULL,
	`publisher_id`	int,
	`price`	real DEFAULT 10.0,
	FOREIGN KEY(`publisher_id`) REFERENCES `publishers`(`id`)
);
INSERT INTO `books` (id,name,year,list_number,publisher_id,price) VALUES (1,'1984','1895',96,1,10.0),
 (2,'Lord of the Rings','1895',200,2,25.0),
 (3,'Swift-5','2020',55,1,500.0);
CREATE TABLE IF NOT EXISTS `book_author` (
	`id`	integer PRIMARY KEY AUTOINCREMENT,
	`book_id`	integer NOT NULL,
	`author_id`	integer NOT NULL,
	FOREIGN KEY(`book_id`) REFERENCES `books`(`id`),
	FOREIGN KEY(`author_id`) REFERENCES `authors`(`id`)
);
INSERT INTO `book_author` (id,book_id,author_id) VALUES (1,1,1),
 (2,1,2),
 (3,1,3),
 (4,2,1),
 (5,2,1),
 (6,2,1),
 (7,2,2);
CREATE TABLE IF NOT EXISTS `authors` (
	`id`	integer PRIMARY KEY AUTOINCREMENT,
	`name`	varchar ( 50 ) NOT NULL,
	`surname`	varchar ( 50 ) NOT NULL
);
INSERT INTO `authors` (id,name,surname) VALUES (1,'Vasya','Pupkin'),
 (2,'Vasya1','Pupkin1'),
 (3,'Sergey','Petrov'),
 (4,'Vasya','Vasyliev');
CREATE VIEW author_count_book_view
as
select author_id, count(book_id) count_book from book_author
group by author_id;
COMMIT;

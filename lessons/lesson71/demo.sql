select b.id as _id, b.name as title, p.name as publisher 
from books as b
join publishers as p
on publisher_id = p.id;

select * from books;

alter table books
add column price real default 10.0;

update books set price = 25 where id = 2;

update books set price = 500 where id = 3;

select id, name, year, list_number, publisher_id, price from books

select max(price), min(price), sum(price), avg(price), count(*) from books

select * from books where price = (select max(price) from books);

select * from books where price < (select avg(price) from books);

select * 
from authors
join book_author
on authors.id = book_author.author_id;

drop view author_count_book_view;

create view author_count_book_view
as
select author_id, count(book_id) count_book from book_author
group by author_id

select * from author_count_book_view;

select name, surname, count_book from authors
join author_count_book_view
on authors.id = author_id

select author_id, count(book_id) count_book from book_author
group by author_id
having count(book_id) > 1

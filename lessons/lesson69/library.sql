-- Создание таблицы книги

create table categories
(
	id integer primary key autoincrement,
	name text not null unique
);

create table if not exists books
(
	id integer primary key autoincrement,
	title varchar(255) not null unique,
	pubYear int default(2018),
	pages int,
	price real not null,
	count int check(count>0),
	status text check(status = 'not exists' OR status = 'exists')
	-- category_id integer references categories(id)
);

alter table books
	add column category_id integer references categories(id);

drop table if exists books;

insert into categories(name) values('Programming');

insert into books(title, pages, price, count, status, category_id)
       values('PHP Head First', 560, 25, 10, 'exists', 1);
	   
update books set category_id=1 where id=1;
	  
	  
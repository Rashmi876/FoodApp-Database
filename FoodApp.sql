create database FoodApp;
use FoodApp;

drop table IF EXISTS Rest_Managed;
drop table IF EXISTS Restaurant;
drop table IF EXISTS Menu;
drop table IF EXISTS Categories;
drop table IF EXISTS Dishes;
drop table IF EXISTS Users;
drop table IF EXISTS Restaurant_Owners;




create table Users
   (user_id 	    varchar(50)	not null unique,
    first_name 		varchar(15)	not null,
    last_name 		varchar(15)	not null,
    email         varchar(40) not null,
    phone_number  varchar(13) not null,
    primary key(user_id));

create table Restaurant_Owners
  (owner_id       varchar(50) not null unique,
   f_name         varchar(15) not null,
   last_name      varchar(15) not null,
   contact_numb   varchar(13) not null,
   primary key(owner_id));

create table Restaurant
  (rest_id        varchar(50) not null unique,
   location       varchar(50) not null,
   name           varchar(30) not null,
   contacts       varchar(30) not null,
   menu_id        varchar(50) not null,
   primary key(rest_id),
   foreign key(menu_id) references Menu(menu_id) on update cascade on delete cascade);

create table Rest_Managed
  (unique_id      varchar(50) not null unique,
   owner_id       varchar(50) not null,
   rest_id        varchar(50) not null,
   primary key(unique_id),
   foreign key(owner_id) references Restaurant_Owners(owner_id) on update cascade on delete cascade,
   foreign key(rest_id) references Restaurant(rest_id) on update cascade on delete cascade);

create table Categories
  (categories_id  varchar(50) not null unique,
  name           varchar(50) not null,
  primary key(categories_id));

create table Menu
  (menu_id        varchar(50) not null unique,
   m_name         varchar(50) not null,
   categories_id  varchar(50) not null,
   primary key(menu_id),
   foreign key(categories_id) references Categories(categories_id) on update cascade on delete cascade);

create table Dishes
  (D_id           varchar(30) not null unique,
   title          varchar(50) not null,
   price          varchar(10) not null,
   ingredients    varchar(100) not null,
   primary key(D_id));


INSERT INTO Users VALUES ('111111','Rashmi', 'Doe', 'werhjwkh@gmail.com', '876-123-4567');
INSERT INTO Users VALUES ('111112','Abigail', 'Doehh', 'werhjkh@gmail.com', '86-123-4567');


INSERT INTO Restaurant_Owners VALUES ('1243456', 'John', 'Doe', '876-244-3233');
INSERT INTO Restaurant_Owners VALUES ('3533535', 'David', 'Brown', '654-983-2920');

INSERT INTO Restaurant VALUES ('BK2445', '10 Kd street', 'Burger King', '734-324-4311', 'menu83');

INSERT INTO Rest_Managed VALUES ('JDd2374', '1243456', 'BK2445');

INSERT INTO Categories VALUES ('BR23', 'Burgers');

INSERT INTO Menu VALUES ('1223456', 'Burger King''s Menu', 'BR23');

INSERT INTO Dishes VALUES ('854345', 'Cheese Whopper', '$700.00', 'Beef Patty, Lettuce, Cheese, Tomatoes, Pickles, Burger Buns');

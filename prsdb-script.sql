use sys;

create database prsdb;

use prsdb;
drop table users;
create table users (
id int not null primary key auto_increment,
username varchar(30) not null unique,
password varchar(30) not null,
firstname varchar(30) not null,
lastname varchar (30) not null,
phone varchar(12),
email varchar(255),
isReviewer tinyint not null default 0,
isAdmin tinyint not null default 0);

insert into users
(username, password, firstname, lastname, phone, email, isReviewer, isAdmin)
values
('tdhaus', '123abc', 'Tom', 'Dahlinghaus', '555-555-5555', 'twdahlinghaus@gmail.com', '0', '0'),
('sa', 'sa', 'System', 'Admin', '123-456-7890', 'email@gmail.com', '1', '1');

create table Vendors (
Id int not null primary key auto_increment,
Code varchar(30) not null unique,
Name varchar(30) not null,
Address varchar(30) not null,
City varchar (30) not null,
State varchar(2) not null,
Zip varchar(5) not null,
PhoneNumber varchar(12),
Email varchar(255));

insert into Vendors (Code, Name, Address, City, State, Zip)

Values
('AMAZ', 'Amazon', '1 Amazon Way', 'Seattle', 'WA', '84744'),
('CHEV', 'Chevrolet', '99 Vette Drive', 'Detroit', 'MI', '55555'),
('RAM', 'RAM Trucks', '19 RAM Way', 'Detroit', 'MI', '12345');

create table Requests (
Id int not null primary key auto_increment,
Description varchar(80) not null,
Justification varchar(80) not null,
RejectionReason varchar(80),
DeliveryMode varchar (20) not null default 'PickUp',
Status varchar(10) not null default 'NEW',
Total decimal(11,2) not null default 0,
DateNeeded date not null,
SubmittedDate datetime not null default current_timestamp,
UserId int not null, 
foreign key (userId) references users(id)
);

insert into requests (Description, Justification, DateNeeded, UserId)
Values
('1st request', 'Just because', '2021-03-01', (select id from users where username = 'sa'));

create table Products (
Id int not null primary key auto_increment,
PartNumber varchar(30) not null unique,
Name varchar(30) not null,
Price decimal(11,2) not null,
Unit varchar (30) not null,
PhotoPath varchar(255),
VendorId int not null, 
foreign key (VendorId) references Vendors(id)
);

insert into Products (PartNumber, Name, Price, Unit, VendorId)
Values
('900-1', 'Volatility Torque', '10000', '1', (select id from Vendors where code = 'AMAZ')),
('0001', 'Shifter Knob', '5500', '1', (select id from Vendors where code = 'CHEV'));

create table LineItems (
Id int not null primary key auto_increment,
RequestId int not null,
ProductId int not null,
Quantity int not null default 1,
foreign key (RequestId) references Requests(id),
foreign key (ProductId) references Products(id),
constraint requestId_productId unique (requestId, productId)
);

insert into LineItems (RequestId, ProductId, Quantity)
values ((select id from requests where id = 1), (select id from products where partnumber = '900-1'), 3),
((select id from requests where id = 1), (select id from products where partnumber = '0001'), 2);
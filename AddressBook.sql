#uc1 create Addesss_book_service Database

create database address_book_service;
show databases;
use address_book_service;

#uc2  create table for database

CREATE TABLE address_book(
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    phoneNo VARCHAR(15) NOT NULL,
    email VARCHAR(15) NOT NULL,
    PRIMARY KEY (firstName)
);

#uc3  Insert new Contacts to Address Book

insert  into address_book(firstName,lastname,address,city,state,zip,phoneNo,email) values
 ('Vaibhav','Patil','Malegaon Road','Pune','Maharastra','424101','959595','vai@gmail.com'),
 ('Sunny','Rajput','King Road','Chalisgaon','Maharastra','414565','956565','sun@gmail.com'),
 ('Sagar','Singh','sb road','Vimantal','Maharastra','411111','937313','sag@gmail.com'),
 ('Prajwal','Sheth','Laxmi road','mumbai','Maharastra','422233','995623','pra@gmail.com');
 
select * from address_book;

#uc4  Edit existing contact person using their name

UPDATE address_book 
SET 
    phoneNo = '955554'
WHERE
    firstName = 'Vaibhav';

UPDATE address_book 
SET 
    lastName = 'Abc'
WHERE
    firstName = 'Prajwal';
    
    
 #uc5  Delete person using FirstName

DELETE FROM `address_book` 
WHERE
    `firstName` = 'Sunny';
    
 #UC6  Retrieve Person belonging to a City or State from the Address Book

#1)Retrive contact using city 
SELECT 
    *
FROM
    address_book
WHERE
    city = 'pune';
    
#2)Retrive contact using city
SELECT 
    *
FROM
    address_book
WHERE
    city = 'Vimantal';
    
#3)Retrive contact using city
SELECT 
    *
FROM
    address_book
WHERE
    city = 'Mumbai';

#4)Retrive contact using state
SELECT 
    *
FROM
    address_book
WHERE
    state = 'maharastra';   
    
    
#uc7 Ability to understand the size of address book by City and State

#size of address book by city
SELECT 
    COUNT(city) AS NumberOfaddress_book
FROM
    address_book;

#size of address book by state
SELECT 
    COUNT(state) AS NumberOfaddress_book
FROM
    address_book;
    
 #uc8  Retrieve entries sorted alphabetically by Person’s name for a given city

SELECT 
    firstName,city
FROM
    address_book
ORDER BY firstName;

#uc9  identify each Address Book with name and type.

alter table address_book add type varchar(30) after lastName;
update  address_book set type='family' where firstName ='Vaibhav';
update  address_book set type='friend' where firstName ='Sagar';
update  address_book set type='profession' where firstName ='Prajwal';
select * from address_book;

#UC10  COUNT(city) AS NumberOfaddress_book FROM address_book;

select count(type) AS NumberOfaddress_book FROM address_book;    

#uc11
#Ability to add person to both Friend and Family
update  address_book set type='family' where firstName ='Vaibhav';
update  address_book set type='friend' where firstName ='Prajwal';   


CREATE TABLE addressbook_attributes(
    addressbook_id int auto_increment,
    addressbook_name varchar(40),
    type varchar(30),
    primary key( addressbook_id)
);

insert  into addressbook_attributes(Addressbook_name,type) values
 ('addressbook1','family'),
 ('addressbook2','profession'),
 ('addressbook3','friend');
 
 CREATE TABLE person(
contact_id int primary key auto_increment,
first_name varchar(30),
last_name varchar(30),
addressbook_id int,
email varchar(30),
phoneno long,
foreign key (addressbook_id)  references addressbook_attributes(addressbook_id)
);

insert  into person(first_name,last_name,email,phoneno,addressbook_id) values
 ('vaibhav','patil','vai@gmail.com',9559955955,1),
 ('abc','cba','bca@gmail.com',9655665566,2),
 ('xyz','zyx','yzx@gmail.com',9022332233,1);
 
 drop table person;
 
CREATE TABLE address(
aid int primary key ,
address varchar(60),
city varchar(30),
state varchar(30),
zip int
);

insert  into address(aid ,address,city,state,zip) values
 (31,'ss road','pune','mh',411030),
 ('32','sr road','chalisgaon','mh',424101),
 ('33','pqr road','thane','mh',443633);
 
 CREATE TABLE person_addressbook(
contact_id int ,
aid int,
foreign key (contact_id)  references person(contact_id),
foreign key (aid)  references address(aid)
);
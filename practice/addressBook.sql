CREATE DATABASE IF NOT EXISTS AddressBook;
USE AddressBook;

CREATE TABLE IF NOT EXISTS Owner (
	ownerID int not null auto_increment,
    ownerFirstName varchar(500) not null,
    ownerLastName varchar(500) not null,
    primary key (ownerID)
);

CREATE TABLE IF NOT EXISTS Contact (
	contactID int not null auto_increment,
    contactOwnerID int not null,
    firstName varchar(500) not null,
    middleName varchar(500),
    lastName varchar(500) not null,
    birthday varchar(500),
    primary key (contactID),
    foreign key (contactOwnerID) references Owner(ownerID)
);


CREATE TABLE IF NOT EXISTS PhoneNumber (
    contact int not null,
    phoneNumber varchar(100) not null,
    primary key (contact, phoneNumber),
    foreign key (contact) references Contact(contactID)
);

CREATE TABLE IF NOT EXISTS Address (
	contact int not null,
    addressLineOne varchar(500) not null, 
    addressLineTwo varchar(700),
    city varchar(500) not null,
    country varchar(500) not null,
    zipcode varchar(500) not null,
    primary key (contact, addressLineOne, zipcode), 
    foreign key (contact) references Contact(contactID)
);



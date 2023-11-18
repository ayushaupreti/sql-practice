CREATE DATABASE IF NOT EXISTS Library;
USE Library;

CREATE TABLE Customer (
	customerName varchar(100) NOT NULL,
    customerLibraryID int NOT NULL,
    PRIMARY KEY (customerLibraryID)
);

CREATE TABLE Publisher (
	publisherName varchar(200) NOT NULL,
    publisherSalesNumber varchar(100) NOT NULL,
    PRIMARY KEY (publisherName)
);

CREATE TABLE CatalogEntry (
	referenceNumber int NOT NULL,
    title varchar(500) NOT NULL,
    author varchar(500) NOT NULL,
    publisher varchar(200) NOT NULL,
    PRIMARY KEY (referenceNumber),
    FOREIGN KEY (publisher) REFERENCES Publisher(publisherName)
);

CREATE TABLE BookOnShelf (
	reference int NOT NULL,
    shelfSection varchar(100) NOT NULL,
    PRIMARY KEY (reference, shelfSection),
    FOREIGN KEY (reference) REFERENCES CatalogEntry(referenceNumber)
);

CREATE TABLE Checkout (
	customerID int NOT NULL,
    bookReferenceNumber int NOT NULL,
    PRIMARY KEY (customerID, bookReferenceNumber),
    FOREIGN KEY (customerID) REFERENCES Customer(customerLibraryID),
    FOREIGN KEY (bookReferenceNumber) REFERENCES CatalogEntry(referenceNumber)
);








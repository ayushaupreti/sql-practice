CREATE DATABASE IF NOT EXISTS AutoRepairShop;
USE AutoRepairShop;

CREATE TABLE IF NOT EXISTS EmployeeType (
	employeeTypeID int NOT NULL,
    type varchar(10) NOT NULL,
    PRIMARY KEY (employeeTypeID)
);


CREATE TABLE IF NOT EXISTS Customer (
	customerID int NOT NULL,
    customerName varchar(100) NOT NULL,
    PRIMARY KEY (customerID)
);

CREATE TABLE IF NOT EXISTS ServiceType (
	serviceTypeID int NOT NULL,
    serviceDescription varchar(500),
    serviceRate int,
    serviceHours int, 
    PRIMARY KEY (serviceTypeID)
);

ALTER TABLE ServiceType ADD INDEX searchByDescription (serviceDescription);


CREATE TABLE IF NOT EXISTS Employee (
	employeeID int NOT NULL,
    name varchar(100) NOT NULL,
    employeeTypeID int NOT NULL,
    PRIMARY KEY (employeeID),
    FOREIGN KEY (employeeTypeID) REFERENCES EmployeeType(employeeTypeID)
);


CREATE TABLE IF NOT EXISTS Vehicle (
	vinNum int NOT NULL,
    customerID int NOT NULL,
    PRIMARY KEY (vinNum),
    FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);


CREATE TABLE IF NOT EXISTS RepairOrder (
	repairOrderID int NOT NULL,
    customer int NOT NULL,
    vehicle int NOT NULL,
    serviceDate varchar(50), 
    advisorID int NOT NULL,
    PRIMARY KEY (repairOrderID),
    FOREIGN KEY (customer) REFERENCES Customer(customerID),
    FOREIGN KEY (vehicle) REFERENCES Vehicle(vinNum),
    FOREIGN KEY (advisorID) REFERENCES Employee(employeeID)
);

CREATE TABLE IF NOT EXISTS Service (
	serviceID int NOT NULL,
    technicianID int NOT NULL,
    serviceDate varchar(50),
    serviceType int NOT NULL,
    repairOrder int NOT NULL,
    PRIMARY KEY (serviceID),
    FOREIGN KEY (technicianID) REFERENCES Employee(employeeID),
    FOREIGN KEY (serviceType) REFERENCES ServiceType(serviceTypeID),
    FOREIGN KEY (repairOrder) REFERENCES RepairOrder(repairOrderID)
);






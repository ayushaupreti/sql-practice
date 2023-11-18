CREATE DATABASE IF NOT EXISTS CityState;
USE CityState;

CREATE TABLE State (
	state varchar(100) NOT NULL,
    capital varchar(100) NOT NULL,
    PRIMARY KEY (state)
);

CREATE TABLE City (
	cityName varchar(100) NOT NULL,
    stateName varchar(100) NOT NULL,
    PRIMARY KEY (cityName, stateName),
    FOREIGN KEY (stateName) REFERENCES State(state)
);
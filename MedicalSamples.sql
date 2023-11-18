CREATE DATABASE IF NOT EXISTS MedicalSamples;
USE MedicalSamples;

CREATE TABLE Patient (
	patientName varchar(500) NOT NULL,
    patientID int NOT NULL,
    patientDOB varchar(1000) NOT NULL,
    PRIMARY KEY (patientID)
);

CREATE TABLE Substance (
	substanceName varchar(500) NOT NULL,
    substanceID int NOT NULL,
    PRIMARY KEY (substanceID)
);

CREATE TABLE BloodSample (
	sampleID int NOT NULL,
    sampleDate varchar(1000) NOT NULL,
    substance int NOT NULL,
    substanceLevel int NOT NULL,
    patient int NOT NULL,
    PRIMARY KEY (sampleID),
    FOREIGN KEY (substance) REFERENCES Substance(substanceID),
    FOREIGN KEY (patient) REFERENCES Patient(patientID)
);
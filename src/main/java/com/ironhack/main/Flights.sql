CREATE SCHEMA Laboratorio302;
DROP SCHEMA Laboratorio302;
USE demo;

CREATE TABLE paints (
id VARCHAR(8) NOT NULL,
author VARCHAR(255),
title VARCHAR(255),
wordCount INT,
views INT,
PRIMARY KEY(id)
);

INSERT INTO paints VALUES 
('1', 'Maria Charlotte', 'Best Paint Colors', '814', '14'),
('2', 'Juan Perez', 'Small Space Decoranting Tips', '1146', '221'),
('1', 'Maria Charlotte','Hot accesories' , '986', '105'),
('1', 'Maria Charlotte', 'Mixing Textures', '765', '22'),
('2', 'Juan Perez', 'Kitchen Refresh', '1242', '307'),
('1', 'Maria Charlotte', 'Homemade Art Hacks', '1002', '193'),
('3', 'Gemma Alcocer', 'Refinishing Wood Floors', '1571', '7542')
;

CREATE TABLE costumersFlights (
id_User VARCHAR(8) NOT NULL,
costumerFirstName VARCHAR(255),
costumerLastName VARCHAR(255),
costumerStatus SET('null', 'Bronce', 'Silver', 'Gold'),
PRIMARY KEY(id_User)
);


INSERT INTO costumersFlights VALUES
('01', 'Agustine', 'Riviera', 'Silver'),
('02', 'Alaina','Sepulvida' , 'null'),
('03', 'Ana', 'janco', 'Silver'),
('04', 'Christian', 'Janco', 'Silver'),
('05', 'Jennifer', 'Cortez', 'Gold'),
('06', 'Jessica', 'James', 'Silver'),
('07', 'Sam', 'Rio', 'null'),
('08', 'Tom', 'Jones', 'Gold')
;

CREATE TABLE flights (
id_flight VARCHAR(8) NOT NULL,
flightNumber ENUM('DL122','DL143','DL222','DL37','DL53'),
aircraft ENUM('Boeing 747', 'Airbus A330', 'Boeing 777'),
flightMileage INT,
PRIMARY KEY(id_flight)
);

INSERT INTO flights VALUES(
('01', 'DL143', 'Boeing 747', '135'),
('02', 'DL122', 'Airbus A330', '4370'),
('03', 'DL222','Boeing 777' , '1765'),
('04', 'DL37', 'Boeing 747', '531'),
('05', 'DL53', 'Boeing 777', '2078')
);

CREATE TABLE aircraft (
id_aircraft VARCHAR(8) NOT NULL,
plane ENUM('Boeing 747', 'Airbus A330', 'Boeing 777'),
totalSeats INT,
PRIMARY KEY(id_aircraft)
);

INSERT INTO aircraft VALUES(
('01', 'Boeing 747', '135'),
('02', 'Airbus A330', '4370'),
('03', 'Boeing 777' , '1765'),
('04', 'Boeing 747', '531')
);

CREATE TABLE costumerMileage (
id_User VARCHAR(8) NOT NULL,
costumerStatus SET('null', 'Bronce', 'Silver', 'Gold'),
mileage INT,
FOREIGN KEY (costurmersFlights) REFERENCES costurmersFlights(id_User)
);

INSERT INTO costumerMileage VALUES(
('01', '115235'),
('02', '6008'),
('03', '136773'),
('04', '14642'),
('05', '300582'),
('06', '127656'),
('07', '2653'),
('08', '205767')
);

CREATE TABLE tripDL122 (
id_trip VARCHAR(8) NOT NULL,
id_User VARCHAR(8), 
id_flight VARCHAR(8),
PRIMARY KEY(id_trip),
FOREIGN KEY (costurmersFlights) REFERENCES costurmersFlights(id_User),
FOREIGN KEY (flights) REFERENCES flights(id_flight)
);

INSERT INTO tripDL122 VALUES(
('01', '0', '1'),
('02', '1', '1'),
('03', '5' , '1'),
('04', '7', '1')
);

CREATE TABLE tripDL222 (
id_trip VARCHAR(8) NOT NULL,
id_User VARCHAR(8), 
id_flight VARCHAR(8),
PRIMARY KEY(id_trip),
FOREIGN KEY (costurmersFlights) REFERENCES costurmersFlights(id_User),
FOREIGN KEY (flights) REFERENCES flights(id_flight)
);

INSERT INTO tripDL222 VALUES(
('01', '2', '2'),
('02', '3', '2'),
('03', '4' , '2'),
('04', '7', '2')
);

CREATE TABLE tripDL143 (
id_trip VARCHAR(8) NOT NULL,
id_User VARCHAR(8), 
id_flight VARCHAR(8),
PRIMARY KEY(id_trip),
FOREIGN KEY (costurmersFlights) REFERENCES costurmersFlights(id_User),
FOREIGN KEY (flights) REFERENCES flights(id_flight)
);

INSERT INTO tripDL143 VALUES(
('01', '0', '0'),
('02', '5', '0'),
('03', '6' , '0')
);

CREATE TABLE tripDL37 (
id_trip VARCHAR(8) NOT NULL,
id_User VARCHAR(8), 
id_flight VARCHAR(8),
PRIMARY KEY(id_trip),
FOREIGN KEY (costurmersFlights) REFERENCES costurmersFlights(id_User),
FOREIGN KEY (flights) REFERENCES flights(id_flight)
);

INSERT INTO tripDL122 VALUES(
('01', '0', '1')
);

CREATE TABLE tripDL53 (
id_trip VARCHAR(8) NOT NULL,
id_User VARCHAR(8), 
id_flight VARCHAR(8),
PRIMARY KEY(id_trip),
FOREIGN KEY (costurmersFlights) REFERENCES costurmersFlights(id_User),
FOREIGN KEY (flights) REFERENCES flights(id_flight)
);

INSERT INTO tripDL122 VALUES(
('01', '7', '4')
);


-- 4 --
SELECT flight_id, AVG(flightMileage) FROM flights;

-- 5 --
SELECT aircraft_id, AVG(totalSeats) FROM aircraft;

-- 6 --
SELECT id_User, AVG(mileage) FROM costumerMileage GROUP BY costumerStatus;

-- 7 --
SELECT id_User, MAX(mileage) FROM costumerMileage GROUP BY costumerStatus;

-- 8 --
SELECT id_aircraft, COUNT(*) FROM aircraft WHERE plane LIKE "Boeing%";

-- 9 --
SELECT id_flight FROM flights WHERE flightMileage BETWEEN 300 AND 2000;

-- 10 --
SELECT c.id, m.mileage
FROM costumersFlights c
RIGHT JOIN costumersMileage m
ON c.id = m.costumerMileage
GROUP BY m.costumerStatus;

-- 11 --
SELECT f.id_flights, f.aircraft, c.costumerStatus
FROM flights f
RIGHT JOIN costumerMileage c
ON f.id_flights, f.aircraft = c.costumerStatus
COUNT (*) FROM f.aircraft WHERE costumerStatus = gold GROUP BY c.costumerStatus;

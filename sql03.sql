
USE GreenTrack;

-----------------------------------------------
-- create tables
----------------------------------------------

CREATE TABLE USERS (
    user_id INT ,
    name VARCHAR(100),
    role VARCHAR(50),
    email VARCHAR(100),
    PRIMARY KEY (user_id)
);
GO

CREATE TABLE LOGIN (
    login_id INT  ,
    user_name VARCHAR(100),
    password VARCHAR(100),
    login_time DATETIME,
    user_id INT,
    PRIMARY KEY(login_id),
    FOREIGN KEY (user_id) REFERENCES USERS(user_id)
);
GO
CREATE TABLE REPORT (
    report_id INT  ,
    report_description VARCHAR(200),
    report_data VARCHAR(200),
    user_id INT,
    PRIMARY KEY(report_id),
    FOREIGN KEY (user_id) REFERENCES USERS(user_id)
);
 Go 
 CREATE TABLE LOCATION (
    location_id INT  ,
    location_name VARCHAR(100),
    address VARCHAR(200),
    coordinates VARCHAR(100),
    PRIMARY KEY(location_id)
);

Go
CREATE TABLE SENSOR (
    sensor_id INT ,
    sensor_type VARCHAR(100),
    installation_date DATE,
    status VARCHAR(50),
    location_id INT,
    PRIMARY KEY(sensor_id),
    FOREIGN KEY (location_id) REFERENCES LOCATION(location_id)
);

Go

CREATE TABLE ENVIRONMENTAL_EVENT (
    event_id INT ,
    event_type VARCHAR(100),
    severity VARCHAR(50),
    event_time_stamp DATETIME,
    location_id INT,
    PRIMARY KEY(event_id),
    FOREIGN KEY (location_id) REFERENCES LOCATION(location_id)
);

Go

CREATE TABLE ACTIONS (
    action_id INT  ,
    action_description VARCHAR(200),
    action_date DATE,
    user_id INT,
    event_id INT,
    PRIMARY KEY(action_id),
    FOREIGN KEY (user_id) REFERENCES USERS(user_id),
    FOREIGN KEY (event_id) REFERENCES ENVIRONMENTAL_EVENT(event_id)
);

Go

CREATE TABLE ENVIRONMENTAL_DATA (
    data_id INT  ,
    value FLOAT,
    unit VARCHAR(50),
    time_stamp DATETIME,
    sensor_id INT,
    PRIMARY KEY (data_id),
    FOREIGN KEY (sensor_id) REFERENCES SENSOR(sensor_id)
);

Go

-------------------------------------------------------
--Insert data (15 records per table)

-------------------------------------------------------

INSERT INTO USERS(user_id,name,role,email) VALUES
(001,'Kavindu', 'Admin', 'kavindu@mail.com'),
(002,'Nimali', 'Manager', 'nimali@mail.com'),
(003,'Sahan', 'Technician', 'sahan@mail.com'),
(004,'Rashmi', 'Analyst', 'rashmi@mail.com'),
(005,'Thilina', 'Supervisor', 'thilina@mail.com'),
(006,'Isuru', 'Engineer', 'isuru@mail.com'),
(007,'Chamari', 'Operator', 'chamari@mail.com'),
(008,'Ruwan', 'Technician', 'ruwan@mail.com'),
(009,'Kasun', 'Manager', 'kasun@mail.com'),
(010,'Harini', 'Analyst', 'harini@mail.com'),
(011,'Pasan', 'Engineer', 'pasan@mail.com'),
(012,'Ishara', 'Supervisor', 'ishara@mail.com'),
(013,'Dinuka', 'Admin', 'dinuka@mail.com'),
(014,'Lahiru', 'Technician', 'lahiru@mail.com'),
(015,'Maleesha', 'Operator', 'maleesha@mail.com');



Go
INSERT INTO LOCATION(location_id,location_name,address,coordinates) VALUES
(001,'Colombo', '123 Main St', '6.9271,79.8612'),
(002,'Kandy', '45 Temple Rd', '7.2906,80.6337'),
(003,'Galle', '10 Beach Ave', '6.0535,80.2210'),
(004,'Jaffna', '22 Market St', '9.6615,80.0255'),
(005,'Negombo', '77 Lagoon Rd', '7.2083,79.8358'),
(006,'Anuradhapura', '12 Sacred City', '8.3114,80.4037'),
(007,'Matara', '99 River Rd', '5.9549,80.5550'),
(008,'Kurunegala', '11 Town Center', '7.4863,80.3620'),
(009,'Ratnapura', '34 Gem Rd', '6.6828,80.3992'),
(010,'Batticaloa', '8 Lake View', '7.7102,81.6924'),
(011,'Trincomalee', '1 Harbor St', '8.5690,81.2332'),
(012,'Badulla', '5 Hill Rd', '6.9847,81.0560'),
(013,'Polonnaruwa', '9 Ancient Way', '7.9395,81.0000'),
(014,'Hambantota', '14 Port Rd', '6.1245,81.1185'),
(015,'Kalutara', '18 River Side', '6.5854,79.9607');

GO

INSERT INTO SENSOR (sensor_id,sensor_type, installation_date, status, location_id) VALUES
(1,'Temperature', '2022-01-10', 'Active', 001),
(2,'Air Quality', '2022-02-14', 'Active', 002),
(3,'Water Quality', '2022-03-01', 'Inactive', 003),
(4,'Waste', '2022-01-20', 'Active', 004),
(5,'Noise', '2022-05-01', 'Active', 005),
(6,'Temperature', '2022-06-01', 'Active', 006),
(7,'Air Quality', '2022-07-01', 'Active', 007),
(8,'Waste', '2022-08-01', 'Inactive', 008),
(9,'Water Quality', '2022-09-01', 'Active', 009),
(10,'Noise', '2022-10-01', 'Active', 010),
(11,'Air Quality', '2022-11-01', 'Active', 011),
(12,'Temperature', '2023-01-01', 'Inactive', 012),
(13,'Noise', '2023-02-01', 'Active', 013),
(14,'Water Quality', '2023-03-01', 'Active', 014),
(15,'Waste', '2023-04-01', 'Inactive', 015);

GO
INSERT INTO LOGIN (login_id, user_name, password, login_time, user_id) VALUES
(0001,'kavinduA', '12345', '2024-10-01T08:45:00', 001),
(0002,'nimaliM', 'abc123', '2024-10-02T09:00:00', 002),
(0003,'sahanT', 'pass001', '2024-10-03T09:30:00', 003),
(0004,'rashmiA', 'pw123', '2024-10-04T10:15:00', 004),
(0005,'thilinaS', 'admin', '2024-10-05T11:00:00', 005),
(0006,'isuruE', 'xyz789', '2024-10-06T08:55:00', 006),
(0007,'chamariO', 'login12', '2024-10-07T09:40:00', 007),
(0008,'ruwanT', 'secure01', '2024-10-08T10:05:00', 008),
(0009,'kasunM', 'pw@22', '2024-10-09T10:50:00', 009),
(0010,'hariniA', 'data55', '2024-10-10T11:25:00', 010),
(0011,'pasanE', 'engine1', '2024-10-11T08:30:00', 011),
(0012,'isharaS', 'superv', '2024-10-12T09:10:00', 012),
(0013,'dinukaA', 'root01', '2024-10-13T09:55:00', 013),
(0014,'lahiruT', 'tech01', '2024-10-14T10:20:00', 014),
(0015,'maleeshaO', 'oper12', '2024-10-15T10:45:00', 015);

GO

INSERT INTO ENVIRONMENTAL_EVENT (event_id, event_type, severity, event_time_stamp, location_id)
VALUES
(035, 'Air Pollution', 'High', GETDATE(), 001),
(036, 'Water Leak', 'Medium', GETDATE(), 002),
(037, 'Waste Overflow', 'High', GETDATE(), 003),
(038, 'Noise Spike', 'Low', GETDATE(), 004),
(039, 'Chemical Spill', 'Critical', GETDATE(), 005),
(040, 'Air Pollution', 'Medium', GETDATE(), 006),
(041, 'Fire Alert', 'High', GETDATE(), 007),
(042, 'Flood', 'Critical', GETDATE(), 008),
(043, 'Heat Wave', 'High', GETDATE(), 009),
(044, 'Toxic Gas', 'Medium', GETDATE(), 010),
(045, 'Dust Storm', 'Low', GETDATE(), 011),
(046, 'Water Leak', 'Medium', GETDATE(), 012),
(047, 'Waste Overflow', 'High', GETDATE(), 013),
(048, 'Chemical Spill', 'Critical', GETDATE(), 014),
(049, 'Air Pollution', 'High', GETDATE(), 015),
(050, 'Air Pollution', 'High', GETDATE(), 1),
(051, 'Air Pollution', 'Medium', GETDATE(), 1),
(052, 'Water Leak', 'Low', GETDATE(), 1),
(053, 'Noise Spike', 'High', GETDATE(), 1),
(054, 'Chemical Spill', 'Critical', GETDATE(), 1),
(055, 'Fire Alert', 'High', GETDATE(), 1),
(056, 'Dust Storm', 'Medium', GETDATE(), 1),
(057, 'Flood Alert', 'High', GETDATE(), 1),
(058, 'Waste Overflow', 'High', GETDATE(), 1),
(059, 'Toxic Gas', 'Critical', GETDATE(), 1),
(060, 'Air Pollution', 'Medium', GETDATE(), 2),
(061, 'Water Leak', 'High', GETDATE(), 2),
(062, 'Noise Spike', 'Medium', GETDATE(), 2),
(063, 'Waste Overflow', 'High', GETDATE(), 2),
(064, 'Toxic Gas', 'Medium', GETDATE(), 2),
(065, 'Fire Alert', 'High', GETDATE(), 2),
(066, 'Flood', 'Medium', GETDATE(), 2),
(067, 'Chemical Spill', 'Critical', GETDATE(), 2);

INSERT INTO ACTIONS (action_id,action_description, action_date, user_id, event_id) VALUES
(51,'Cleaned Waste', '2024-01-10', 1, 022),
(52,'Repaired Pipe', '2024-02-11', 2, 021),
(53,'Checked Sensors', '2024-03-12', 3, 020),
(54,'Reported Issue', '2024-04-13', 4, 023),
(55,'Emergency Response', '2024-05-14', 5, 024),
(56,'Calibrated Sensors', '2024-06-15', 6, 025),
(57,'Public Notice', '2024-07-16', 7, 026),
(58,'Data Analysis', '2024-08-17', 8, 027),
(59,'Clean Up', '2024-09-18', 9, 028),
(60,'Evacuation', '2024-10-19', 10, 029),
(61,'Repair Work', '2024-11-20', 11, 030),
(62,'System Update', '2024-12-21', 12, 031),
(63,'Maintenance', '2025-01-22', 13, 032),
(64,'Inspection', '2025-02-23', 14, 033),
(65,'Awareness Program', '2025-03-24', 15, 034);

Go

INSERT INTO ENVIRONMENTAL_DATA (data_id,value, unit, time_stamp, sensor_id) VALUES
(101,32.5, 'C', GETDATE(), 1),
(102,68.2, 'AQI', GETDATE(), 2),
(103,7.4, 'pH', GETDATE(), 3),
(104,12.5, 'kg', GETDATE(), 4),
(105,45.1, 'dB', GETDATE(), 5),
(106,29.8, 'C', GETDATE(), 6),
(107,60.4, 'AQI', GETDATE(), 7),
(108,8.0, 'pH', GETDATE(), 8),
(109,10.2, 'kg', GETDATE(), 9),
(110,38.5, 'C', GETDATE(), 10),
(111,55.2, 'AQI', GETDATE(), 11),
(112,30.1, 'C', GETDATE(), 12),
(113,6.9, 'pH', GETDATE(), 13),
(114,9.5, 'kg', GETDATE(), 14),
(115,50.3, 'dB', GETDATE(), 15);

GO

INSERT INTO REPORT (report_id,report_description,report_data,user_id) VALUES
(70,'Air quality report Jan','Data: AQ=45',001),
(71,'Temperature analysis','Temp Avg=31.5',002),
(72,'Water quality summary','NTU=67.4',003),
(73,'Waste management','Waste=120kg',004),
(74,'Monthly AQ report','AQ=52',005),
(75,'Temp log','Temp=30.8',006),
(76,'Water contamination','NTU=55',007),
(77,'Waste summary','Waste=98kg',008),
(78,'AQ improvement','AQ=48',009),
(79,'Heat log','Temp=29',010),
(80,'Flood alert summary','Flood risk=high',011),
(81,'Hazard report','Leak controlled',012),
(82,'Waste disposal','Toxic=Low',013),
(83,'Oil report','Spill contained',014),
(84,'Smog control','Smog reduced',015);

go
 
  Select *from SENSOR
go
 
 SELECT * FROM ENVIRONMENTAL_DATA
INNER JOIN SENSOR 
ON ENVIRONMENTAL_DATA.sensor_id = SENSOR.sensor_id
WHERE ENVIRONMENTAL_DATA.sensor_id = 4;

 SELECT * FROM ENVIRONMENTAL_EVENT
INNER JOIN LOCATION
ON ENVIRONMENTAL_EVENT.location_id = LOCATION.location_id
WHERE ENVIRONMENTAL_EVENT.location_id = 6;

SELECT 
    l.location_name,
    ROUND(AVG(value), 2) AS avg_pollution_level
FROM ENVIRONMENTAL_DATA ed
INNER JOIN Sensor s ON ed.sensor_id = s.sensor_id
INNER JOIN Location l ON s.location_id = l.location_id
GROUP BY l.location_name
ORDER BY avg_pollution_level DESC;



SELECT 
    l.location_name,
    COUNT(e.event_id) AS total_events
FROM ENVIRONMENTAL_EVENT e
INNER JOIN LOCATION l ON e.location_id = l.location_id
WHERE e.event_time_stamp >= DATEADD(DAY, -30, GETDATE())
GROUP BY l.location_name
HAVING COUNT(e.event_id) > 5
ORDER BY total_events DESC;


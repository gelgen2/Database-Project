
SET FOREIGN_KEY_CHECKS = 0;
/* 
Drop tables */
DROP TABLE IF EXISTS VEHICLE;
DROP TABLE IF EXISTS TAXI;
DROP TABLE IF EXISTS REQUEST;
DROP TABLE IF EXISTS PUBLIC_BUS;
DROP TABLE IF EXISTS PRIVATE_BUS;
DROP TABLE IF EXISTS RESERVATION;
DROP TABLE IF EXISTS ROUTE;
DROP TABLE IF EXISTS BUS_STOP;
DROP TABLE IF EXISTS FARE;
DROP TABLE IF EXISTS STATION;
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS DRIVER;
DROP TABLE IF EXISTS MECHANIC;
DROP TABLE IF EXISTS JANITOR;
DROP TABLE IF EXISTS CASHIER;
DROP TABLE IF EXISTS HR;
DROP TABLE IF EXISTS COMPLAINTS;
DROP TABLE IF EXISTS SUPERVISER;
DROP TABLE IF EXISTS REPAIR_LOG;
DROP TABLE IF EXISTS USERS;


CREATE TABLE IF NOT EXISTS VEHICLE
(Make varchar(15) NOT NULL,
Model varchar(15) NOT NULL,
vYear INT NOT NULL,
Vehicle_ID varchar(15) NOT NULL,
PRIMARY KEY (Vehicle_ID));


CREATE TABLE IF NOT EXISTS TAXI
(Taxi_ID VARCHAR(15),
numSeats INT NOT NULL,
PRIMARY KEY (Taxi_ID),
FOREIGN KEY(Taxi_ID) REFERENCES VEHICLE(Vehicle_ID) on delete cascade);

CREATE TABLE IF NOT EXISTS REQUEST
(transport_ID VARCHAR(15),
numPassengers INT,
Request_no varchar(15),
PRIMARY KEY (Request_no),
FOREIGN KEY(transport_ID) REFERENCES TAXI(Taxi_ID));

CREATE TABLE IF NOT EXISTS PUBLIC_BUS
(Station_Num varchar(15) NOT NULL,
Current_Stop varchar(15) NOT NULL,
Next_Stop varchar(15) NOT NULL,
Route_Num INT NOT NULL,
Bus_Num INT NOT NULL,
Driver_ID varchar(15) NOT NULL,
V_ID varchar(15) NOT NULL,
PRIMARY KEY (V_ID, Current_Stop),
FOREIGN KEY(V_ID) REFERENCES VEHICLE(Vehicle_ID) on delete cascade,
FOREIGN KEY(Station_Num) REFERENCES STATION(Station_no),
FOREIGN KEY(Route_Num) REFERENCES ROUTE(Route_no),
FOREIGN KEY(Driver_ID) REFERENCES DRIVER(emp_id));


CREATE TABLE IF NOT EXISTS PRIVATE_BUS
(Start_location varchar(15) NOT NULL,
End_location varchar(15) NOT NULL,
Fare DECIMAL(10,2) NOT NULL,
No_Seats INT NOT NULL,
Drive_ID varchar(15) NOT NULL,
Bus_ID varchar(15) NOT NULL,
PRIMARY KEY (Bus_ID),
FOREIGN KEY(Bus_ID) REFERENCES VEHICLE(Vehicle_ID) on delete cascade,
FOREIGN KEY(Fare) REFERENCES FARE(Amount),
FOREIGN KEY(Drive_ID) REFERENCES DRIVER(emp_id));


CREATE TABLE IF NOT EXISTS RESERVATION
(Res_num varchar(15),
Date_order DATE,
PRIMARY KEY (Res_num));

CREATE TABLE IF NOT EXISTS ROUTE
(Route_no INT NOT NULL,
Date_Route varchar(20) NOT NULL,
Distance varchar(15) NOT NULL,
Time_estimate varchar(20) NOT NULL,
No_Stops INT NOT NULL,
PRIMARY KEY (Route_no),
FOREIGN KEY(Route_no) REFERENCES PUBLIC_BUS(Route_num));

CREATE TABLE IF NOT EXISTS BUS_STOP
(Stop_no INT NOT NULL,
Location varchar(15) NOT NULL,
Departure_time varchar(20) NOT NULL,
Arrival_time varchar(20) NOT NULL,
PRIMARY KEY (Stop_no));



CREATE TABLE IF NOT EXISTS FARE
(Amount DECIMAL(10,2) NOT NULL,
Fare_no varchar(15) NOT NULL,
Date_trip DATE,
PRIMARY KEY (Fare_no),
FOREIGN KEY(Amount) REFERENCES PRIVATE_BUS(Fare));


CREATE TABLE IF NOT EXISTS STATION
(Station_no varchar(15) NOT NULL,
Station_Name varchar(15) NOT NULL,
Capacity INT NOT NULL,
No_employees INT NOT NULL,
Superviser_ID varchar(15) NOT NULL,
Street varchar(15) NOT NULL,
City varchar(15) NOT NULL,
PRIMARY KEY (Station_no),
FOREIGN KEY(Superviser_ID) REFERENCES SUPERVISER(super_num));


CREATE TABLE IF NOT EXISTS EMPLOYEE
(Years_worked INT NOT NULL,
Employee_ID varchar(15) NOT NULL,
Fname varchar(15) NOT NULL,
Lname varchar(15) NOT NULL,
Wage DECIMAL(10,2) NOT NULL,
Address varchar(30) NOT NULL,
Sup_ID varchar(15) NOT NULL,
Station_ID varchar(15) NOT NULL,
PRIMARY KEY (Employee_ID),
FOREIGN KEY (Station_ID) REFERENCES STATION(Station_no),
FOREIGN KEY (Employee_ID) REFERENCES MECHANIC(mech_num) on delete cascade,
FOREIGN KEY (Employee_ID) REFERENCES DRIVER(emp_id) on delete cascade,
FOREIGN KEY (Employee_ID) REFERENCES JANITOR(jan_id) on delete cascade,
FOREIGN KEY (Employee_ID) REFERENCES CASHIER(cash_id) on delete cascade,
FOREIGN KEY (Employee_ID) REFERENCES HR(hr_id) on delete cascade,
FOREIGN KEY(Sup_ID) REFERENCES EMPLOYEE(Employee_ID));

CREATE TABLE IF NOT EXISTS DRIVER
(Bus_License varchar(15) NOT NULL,
bus_num varchar(15) NOT NULL,
emp_id varchar(15) NOT NULL,
PRIMARY KEY (emp_id),
FOREIGN KEY(bus_num) REFERENCES PUBLIC_BUS(V_ID),
FOREIGN KEY(emp_id) REFERENCES EMPLOYEE(Employee_ID) on delete cascade);

CREATE TABLE IF NOT EXISTS MECHANIC
(Work_On varchar(15) NOT NULL,
mech_num varchar(15) NOT NULL,
PRIMARY KEY (mech_num),
FOREIGN KEY(mech_num) REFERENCES EMPLOYEE(Employee_ID) on delete cascade);

CREATE TABLE IF NOT EXISTS JANITOR
(Station_num varchar(15) NOT NULL,
jan_id varchar(15) NOT NULL,
PRIMARY KEY (jan_id),
FOREIGN KEY(jan_id) REFERENCES EMPLOYEE(Employee_ID) on delete cascade,
FOREIGN KEY(Station_num) REFERENCES STATION(Station_no));

CREATE TABLE IF NOT EXISTS CASHIER
(Register_pass INT(9) NOT NULL,
cash_id varchar(15) NOT NULL,
PRIMARY KEY (cash_id),
FOREIGN KEY(cash_id) REFERENCES EMPLOYEE(Employee_ID));

CREATE TABLE IF NOT EXISTS HR
(No_complaints INT NOT NULL,
hr_id varchar(15) NOT NULL,
PRIMARY KEY (hr_id),
FOREIGN KEY(hr_id) REFERENCES EMPLOYEE(Employee_ID) on delete cascade);


CREATE TABLE IF NOT EXISTS COMPLAINTS
(complaint varchar(50),
PRIMARY KEY (complaint));


CREATE TABLE IF NOT EXISTS SUPERVISER
(super_num varchar(15) NOT NULL,
station_id varchar(15) NOT NULL,
No_supervised INT NOT NULL,
PRIMARY KEY (super_num),
FOREIGN KEY(station_id) REFERENCES STATION(Station_no),
FOREIGN KEY(super_num) REFERENCES EMPLOYEE(Employee_ID) on delete cascade);


CREATE TABLE IF NOT EXISTS REPAIR_LOG
(Date_work DATE,
worker_id varchar(15) NOT NULL,
car_num varchar(15) NOT NULL,
type_issue varchar(30) NOT NULL,
PRIMARY KEY (car_num),
UNIQUE(type_issue),
FOREIGN KEY(worker_id) REFERENCES MECHANIC(mech_num),
FOREIGN KEY(car_num) REFERENCES VEHICLE(Vehicle_ID));



CREATE TABLE IF NOT EXISTS USERS(
user_id  varchar(15) NOT NULL,
username	varchar(20) NOT NULL,
password	varchar(20) NOT NULL,
unique(username),
primary key(user_id),
FOREIGN KEY (user_id) REFERENCES EMPLOYEE(Employee_id));


INSERT INTO VEHICLE(MAKE,MODEL,VYEAR,VEHICLE_ID)
VALUES('AVS','22E',2009, 234234234);
INSERT INTO VEHICLE(MAKE,MODEL,VYEAR,VEHICLE_ID)
VALUES('AVS','30',2012, 567567567);
INSERT INTO VEHICLE(MAKE,MODEL,VYEAR,VEHICLE_ID)
VALUES('Allen-Ashley','APOLLO',2007, 131131131);
INSERT INTO VEHICLE(MAKE,MODEL,VYEAR,VEHICLE_ID)
VALUES('Allen-Ashley','Columbia',2009, 890890890);
INSERT INTO VEHICLE(MAKE,MODEL,VYEAR,VEHICLE_ID)
VALUES('ATC','2409',201, 776776776);
INSERT INTO VEHICLE(MAKE,MODEL,VYEAR,VEHICLE_ID)
VALUES('BLUE BIRD','CSFE 2409',2012, 686686686);
INSERT INTO VEHICLE(MAKE,MODEL,VYEAR,VEHICLE_ID)
VALUES('HONDA','CIVIC',2016, 909909909);
INSERT INTO VEHICLE(MAKE,MODEL,VYEAR,VEHICLE_ID)
VALUES('TOYOTA','CAMRY',2015, 121121121);
INSERT INTO VEHICLE(MAKE,MODEL,VYEAR,VEHICLE_ID)
VALUES('FORD','FOCUS',2010, 222222222);


INSERT INTO TAXI(TAXI_ID,NUMSEATS)
VALUES(909909909, 4);
INSERT INTO TAXI(TAXI_ID,NUMSEATS)
VALUES(121121121, 4);
INSERT INTO TAXI(TAXI_ID,NUMSEATS)
VALUES(222222222, 4);

INSERT INTO PUBLIC_BUS(STATION_NUM,CURRENT_STOP,NEXT_STOP, ROUTE_NUM, BUS_NUM, DRIVER_ID,V_ID)
VALUES(1456, 'MLK Blvd', 'Boyce Avenue', 5, 1029, 189181891, 234234234);
INSERT INTO PUBLIC_BUS(STATION_NUM,CURRENT_STOP, NEXT_STOP,ROUTE_NUM, BUS_NUM, DRIVER_ID,V_ID)
VALUES(2134, 'Main Street', 'West Street', 2, 3489, 999887777, 567567567);
INSERT INTO PUBLIC_BUS(STATION_NUM,CURRENT_STOP,NEXT_STOP, ROUTE_NUM, BUS_NUM, DRIVER_ID,V_ID)
VALUES(5678, 'Blue Street', 'Bald Way', 1, 6213, 333223333, 131131131);


INSERT INTO PRIVATE_BUS(START_LOCATION,END_LOCATION,FARE,NO_SEATS,DRIVE_ID,BUS_ID)
VALUES('New York City', 'Boston', 12.50, 30, 444444444, 890890890);
INSERT INTO PRIVATE_BUS(START_LOCATION,END_LOCATION,FARE,NO_SEATS,DRIVE_ID,BUS_ID)
VALUES('Manhattan', 'Dover', 15.50, 30, 888888888, 776776776);
INSERT INTO PRIVATE_BUS(START_LOCATION,END_LOCATION,FARE,NO_SEATS,DRIVE_ID,BUS_ID)
VALUES('Main Street', 'Baltimore', 20.00, 35, 555555555, 686686686);

INSERT INTO ROUTE(ROUTE_NO,DATE_ROUTE,DISTANCE,TIME_ESTIMATE,NO_STOPS)
VALUES(5, '2017-10-27', '30 miles', '45 min', 7);
INSERT INTO ROUTE(ROUTE_NO,DATE_ROUTE,DISTANCE,TIME_ESTIMATE,NO_STOPS)
VALUES(4, '2017-10-27', '35 miles', '1 hour', 10);
INSERT INTO ROUTE(ROUTE_NO,DATE_ROUTE,DISTANCE,TIME_ESTIMATE,NO_STOPS)
VALUES(3, '2017-10-27', '15 miles', '20 min', 5);
INSERT INTO ROUTE(ROUTE_NO,DATE_ROUTE,DISTANCE,TIME_ESTIMATE,NO_STOPS)
VALUES(2, '2017-10-27', '12 miles', '17 min', 5);
INSERT INTO ROUTE(ROUTE_NO,DATE_ROUTE,DISTANCE,TIME_ESTIMATE,NO_STOPS)
VALUES(1, '2017-10-27', '10 miles', '15 min', 4);


INSERT INTO BUS_STOP(STOP_NO,LOCATION,DEPARTURE_TIME,ARRIVAL_TIME)
VALUES(22, 'MLK', '2:30, 4:20, 5:15', '2:15, 3:50, 5:00');
INSERT INTO BUS_STOP(STOP_NO,LOCATION,DEPARTURE_TIME,ARRIVAL_TIME)
VALUES(17, 'Main Street', '1:30, 3:20, 6:15', '1:15, 2:50, 6:00');
INSERT INTO BUS_STOP(STOP_NO,LOCATION,DEPARTURE_TIME,ARRIVAL_TIME)
VALUES(12, 'Blue Street', '11:30, 2:20, 3:15', '11:00, 2:05, 3:00');
INSERT INTO BUS_STOP(STOP_NO,LOCATION,DEPARTURE_TIME,ARRIVAL_TIME)
VALUES(2, 'Walker Street', '1:30, 3:20, 6:15', '1:15, 2:50, 6:00');
INSERT INTO BUS_STOP(STOP_NO,LOCATION,DEPARTURE_TIME,ARRIVAL_TIME)
VALUES(4, 'Far Street', '10:30, 1:20, 4:15', '10:15, 12:50, 4:00');


INSERT INTO FARE(AMOUNT,FARE_NO,DATE_TRIP)
VALUES(12.50, 12345, '2017-10-29');
INSERT INTO FARE(AMOUNT,FARE_NO,DATE_TRIP)
VALUES(15.50, 67890, '2017-10-30');
INSERT INTO FARE(AMOUNT,FARE_NO,DATE_TRIP)
VALUES(20.00, 54321, '2017-10-23');



INSERT INTO STATION(STATION_NO,STATION_NAME,CAPACITY,NO_EMPLOYEES,SUPERVISER_ID,STREET, CITY)
VALUES(1456, 'Johnson', 12, 15, 222887777, 'Apple Street', 'New York City');
INSERT INTO STATION(STATION_NO,STATION_NAME,CAPACITY,NO_EMPLOYEES,SUPERVISER_ID,STREET, CITY)
VALUES(2134, 'Birmingham', 9, 5, 111228888, 'Gaver Street', 'New York City'); 
INSERT INTO STATION(STATION_NO,STATION_NAME,CAPACITY,NO_EMPLOYEES,SUPERVISER_ID,STREET, CITY)
VALUES(5678, 'Midway', 17, 6, 666445555, 'Straw Street', 'New York City');

INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID)
VALUES(5, 222887777, 'Johnson', 'David', 20.00, '121 Stone Ct, New York,NY', 222887777, 1456); /*superviser*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID)
VALUES(2, 111228888, 'Jackson', 'Aaron', 18.00, 'Route Blvd, New York, NY', 111228888, 2134); /*superviser*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID)
VALUES(10, 666445555, 'Wolfe', 'Rick', 25.00, 'Poll St, New York,NY', 666445555, 5678); /*superviser*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID)
VALUES(3, 009110088, 'Cleany', 'Drew', 12.00, 'Trash Ct, New York,NY', 222887777, 1456);  /*janitor*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID)
VALUES(3, 222119845, 'Moppy', 'Justin', 12.00, 'Garbage Street, New York,NY', 111228888, 2134);  /*janitor* new */
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID)
VALUES(3, 001985347, 'Dusty', 'Liam', 12.00, 'Dumpster Circle, New York,NY', 666445555, 5678);  /*janitor* new */
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID)
VALUES(5, 189181891, 'Poe', 'Josh', 15.00, 'Somewhere St, New York,NY', 111228888, 2134); /*driver*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID)
VALUES(5, 999887777, 'Rest', 'Eugene', 15.00, 'Place Blvd, New York,NY', 666445555, 5678); /*driver*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID)
VALUES(5, 333223333, 'Drivy', 'Duke', 15.00, 'Hollow Ave, New York,NY',222887777, 1456); /*driver*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID) 
VALUES(2, 777661111, 'Wrench', 'Leroy', 30.00, 'Bunch Ave, New York,NY', 111228888, 2134);/*mechanic*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID) 
VALUES(2, 123980643, 'Socket', 'Jeff', 30.00, 'Squeaky Road, New York,NY', 222887777, 1456);/*mechanic* new */
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID) 
VALUES(2, 345462752, 'Muffler', 'Tim', 30.00, 'Car Ave, New York,NY', 666445555, 5678);/*mechanic new*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID)
VALUES(6, 111557890, 'Ring', 'Paul', 11.00, 'Wayne Street, New York,NY', 666445555, 5678);/*cashier*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID)
VALUES(6, 234432234, 'Bling', 'Cash', 11.00, 'Money Way, New York,NY', 222887777, 1456);/*cashier new*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID)
VALUES(6, 967324564, 'Ching', 'Kyle', 11.00, 'Coin Ave, New York,NY', 111228888, 2134);/*cashier new*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID)
VALUES(7, 123879654, 'Flenderson', 'Toby', 17.00, 'Vincent Manor, New York,NY', 111228888, 2134);/*HR*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID)
VALUES(7, 555229807, 'Anderson', 'Pamela', 17.00, 'Rich Manor, New York,NY', 222887777, 1456);/*HR new*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS, SUP_ID, STATION_ID)
VALUES(7, 876568756, 'Rage', 'Roy', 17.00, 'Angry Way, New York,NY', 666445555, 5678);/*HR new*/





INSERT INTO DRIVER(BUS_LICENSE,BUS_NUM,EMP_ID)
VALUES(101101101,234234234,189181891);
INSERT INTO DRIVER(BUS_LICENSE,BUS_NUM,EMP_ID)
VALUES(232232232,567567567,999887777);
INSERT INTO DRIVER(BUS_LICENSE,BUS_NUM,EMP_ID)
VALUES(090090090, 131131131,333223333);

INSERT INTO SUPERVISER(SUPER_NUM,STATION_ID,NO_SUPERVISED)
VALUES(222887777,1456,20);
INSERT INTO SUPERVISER(SUPER_NUM,STATION_ID,NO_SUPERVISED)
VALUES(111228888,2134,10);
INSERT INTO SUPERVISER(SUPER_NUM,STATION_ID,NO_SUPERVISED)
VALUES(666445555, 5678, 7);

INSERT INTO JANITOR(STATION_NUM,JAN_ID)
VALUES(1456, 009110088);

INSERT INTO MECHANIC(WORK_ON,MECH_NUM)
VALUES('BUS', 777661111);

INSERT INTO CASHIER(REGISTER_PASS,CASH_ID)
VALUES(123456789, 111557890);

INSERT INTO HR(NO_COMPLAINTS,HR_ID)
VALUES(3, 123879654);

INSERT INTO REPAIR_LOG(DATE_WORK,WORKER_ID,CAR_NUM,TYPE_ISSUE)
VALUES('2016-9-17', 777661111, 234234234, 'front axel loose');
INSERT INTO REPAIR_LOG(DATE_WORK,WORKER_ID,CAR_NUM,TYPE_ISSUE)
VALUES('2017-7-27', 777661111, 567567567, 'blown tire');

INSERT INTO USERS (USER_ID, USERNAME, PASSWORD) 
VALUES (222887777, 'djohnson2','horse'),	   
	   (111228888, 'ajackson1','hockey'),		   	
       (666445555, 'rwolfe1','rocket'),  	
	   (009110088, 'dcleany5','bucket'),
	   (189181891, 'jpoe3','trash'),
	   (999887777, 'erest4','comfy'),
	   (333223333, 'ddrivy1','truck'),
	   (777661111, 'lwrench','tools'),
	   (111557890, 'pring2','trench'),
	   (123879654, 'tflenderson1','scranton'),
       (222119845, 'jmoppy2', 'cleany'),
       (001985347, 'ldusty5', 'dustbowl'),
       (123980643, 'jsocket', 'pockets'),
       (345462752, 'tmuffl6', 'carparts'),
       (234432234, 'cbling9', 'moneypool'),
       (967324564, 'kching2', 'leedle'),
       (555229807, 'pander3', 'country'),
       (876568756, 'rrage5', 'drugsarebad'),
       (888334567, 'admin','admin');
       


SET FOREIGN_KEY_CHECKS = 1;



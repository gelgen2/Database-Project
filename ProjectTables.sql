use jmillf2db;
SET FOREIGN_KEY_CHECKS = 0;
/* 
Create table */
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
Route_Num INT NOT NULL,
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
Date_Route DATE,
Distance varchar(15) NOT NULL,
Time_estimate DECIMAL(10,2),
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





SET FOREIGN_KEY_CHECKS = 1;
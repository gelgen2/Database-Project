use jmillf2db;
SET FOREIGN_KEY_CHECKS = 0;

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

INSERT INTO PUBLIC_BUS(STATION_NUM,CURRENT_STOP,ROUTE_NUM,DRIVER_ID,V_ID)
VALUES(1456, 'MLK', 5, 189181891, 234234234);
INSERT INTO PUBLIC_BUS(STATION_NUM,CURRENT_STOP,ROUTE_NUM,DRIVER_ID,V_ID)
VALUES(2134, 'Main Street', 2, 999887777, 567567567);
INSERT INTO PUBLIC_BUS(STATION_NUM,CURRENT_STOP,ROUTE_NUM,DRIVER_ID,V_ID)
VALUES(5678, 'Blue Street', 1, 333223333, 131131131);


INSERT INTO PRIVATE_BUS(START_LOCATION,END_LOCATION,FARE,NO_SEATS,DRIVE_ID,BUS_ID)
VALUES('New York City', 'Boston', 12.50, 30, 444444444, 890890890);
INSERT INTO PRIVATE_BUS(START_LOCATION,END_LOCATION,FARE,NO_SEATS,DRIVE_ID,BUS_ID)
VALUES('Manhattan', 'Dover', 15.50, 30, 888888888, 776776776);
INSERT INTO PRIVATE_BUS(START_LOCATION,END_LOCATION,FARE,NO_SEATS,DRIVE_ID,BUS_ID)
VALUES('Main Street', 'Baltimore', 20.00, 35, 555555555, 686686686);

INSERT INTO ROUTE(ROUTE_NO,DATE_ROUTE,DISTANCE,TIME_ESTIMATE,NO_STOPS)
VALUES(5, '2017-10-27', '30 miles', 45.00, 7);
INSERT INTO ROUTE(ROUTE_NO,DATE_ROUTE,DISTANCE,TIME_ESTIMATE,NO_STOPS)
VALUES(4, '2017-10-27', '35 miles', 60.00, 10);
INSERT INTO ROUTE(ROUTE_NO,DATE_ROUTE,DISTANCE,TIME_ESTIMATE,NO_STOPS)
VALUES(3, '2017-10-27', '15 miles', 20.00, 5);
INSERT INTO ROUTE(ROUTE_NO,DATE_ROUTE,DISTANCE,TIME_ESTIMATE,NO_STOPS)
VALUES(2, '2017-10-27', '12 miles', 17.00, 5);
INSERT INTO ROUTE(ROUTE_NO,DATE_ROUTE,DISTANCE,TIME_ESTIMATE,NO_STOPS)
VALUES(1, '2017-10-27', '10 miles', 15.00, 4);


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


INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS)
VALUES(5, 222887777, 'Johnson', 'David', 20.00, '121 Stone Ct, New York,NY'); /*superviser*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS)
VALUES(2, 111228888, 'Jackson', 'Aaron', 18.00, 'Route Blvd, New York, NY'); /*superviser*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS)
VALUES(10, 666445555, 'Wolfe', 'Rick', 25.00, 'Poll St, New York,NY'); /*superviser*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS)
VALUES(3, 009110088, 'Cleany', 'Drew', 12.00, 'Trash Ct, New York,NY');  /*janitor*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS)
VALUES(5, 189181891, 'Poe', 'Josh', 15.00, 'Somewhere St, New York,NY'); /*driver*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS)
VALUES(5, 999887777, 'Rest', 'Eugene', 15.00, 'Place Blvd, New York,NY'); /*driver*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS)
VALUES(5, 333223333, 'Drivy', 'Duke', 15.00, 'Hollow Ave, New York,NY'); /*driver*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS) 
VALUES(2, 777661111, 'Wrench', 'Leroy', 30.00, 'Bunch Ave, New York,NY');/*mechanic*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS)
VALUES(6, 111557890, 'Ring', 'Paul', 11.00, 'Wayne Street, New York,NY');/*cashier*/
INSERT INTO EMPLOYEE(YEARS_WORKED,EMPLOYEE_ID, FNAME,LNAME,WAGE, ADDRESS)
VALUES(7, 123879654, 'Flenderson', 'Toby', 17.00, 'Vincent Manor, New York,NY');/*HR*/

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
VALUES('9-17-2016', 777661111, 234234234, 'front axel loose');
INSERT INTO REPAIR_LOG(DATE_WORK,WORKER_ID,CAR_NUM,TYPE_ISSUE)
VALUES('7-27-2017', 777661111, 567567567, 'blown tire');




SET FOREIGN_KEY_CHECKS = 1;




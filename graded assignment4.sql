create database TravelOnTheGO;
use TravelOnTheGO;
create table PASSENGER (Passenger_name varchar(50),Category varchar(10),Gender varchar(10),Boarding_city varchar(20),Destination_City varchar(20),Distance int,Bus_Type varchar(10));
create table PRICE (Bus_Type varchar(20),Distance int,Price int);
insert into PASSENGER values('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert into PASSENGER values('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
insert into PASSENGER values('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');
insert into PASSENGER values('Khushboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
insert into PASSENGER values('Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper');
insert into PASSENGER values('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
insert into PASSENGER values('Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper');
insert into PASSENGER values('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
insert into PASSENGER values('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

insert into PRICE values('Sleeper',350,770);
insert into PRICE values('Sleeper',500,1100);
insert into PRICE values('Sleeper',600,1320);
insert into PRICE values('Sleeper',700,1540);
insert into PRICE values('Sleeper',1000,2200);
insert into PRICE values('Sleeper',1200,2640);
insert into PRICE values('Sleeper',350,434);
insert into PRICE values('Sitting',500,620);
insert into PRICE values('Sitting',500,620);
insert into PRICE values('Sitting',600,744);
insert into PRICE values('Sitting',700,868);
insert into PRICE values('Sitting',1000,1240);
insert into PRICE values('Sitting',1200,1488);
insert into PRICE values('Sitting',1500,1860);

#3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?

SELECT (SELECT COUNT(GENDER) FROM PASSENGER WHERE GENDER='M' AND DISTANCE>600)AS MALE ,(SELECT COUNT(GENDER) 
FROM PASSENGER WHERE GENDER='F' AND DISTANCE>600)AS FEMALE;

#34) Find the minimum ticket price for Sleeper Bus.

SELECT MIN(Price) AS Minimum_Sleeper_price FROM PRICE WHERE BUS_TYPE='Sleeper';

#5) Select passenger names whose names start with character 'S'

SELECT Passenger_name FROM PASSENGER WHERE Passenger_name LIKE 'S%';


#6) Calculate price charged for each passenger displaying Passenger name, Boarding City,
#Destination City, Bus_Type, Price in the output

SELECT passenger_name,Boarding_City,Destination_city,pr.Bus_type ,pr.price FROM passenger p 
LEFT JOIN price pr ON p.bus_Type=pr.bus_type AND p.distance=pr.distance ;

#7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a
#distance of 1000 KM s

SELECT Passenger_name,price FROM  Passenger pa,price pr WHERE pa.distance=1000 and pa.bus_type='sitting';


#8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to
#Panaji?


SELECT DISTINCT (SELECT distance FROM passenger WHERE passenger_name='pallavi') AS traveldistance ,
(SELECT price FROM Price WHERE bus_type='sleeper' AND distance=traveldistance) AS sleeper,
(SELECT price FROM Price WHERE bus_type='sitting' AND distance=traveldistance) AS sitting FROM passenger;



#9) List the distances from the "Passenger" table which are unique (non-repeated
#distances) in descending order.

SELECT DISTINCT distance AS UNIQUE_DISTANCE FROM passenger ORDER BY distance desc;


#10) Display the passenger name and percentage of distance travelled by that passenger
#from the total distance travelled by all passengers without using user variables


SELECT passenger_name,distance * 100 /(SELECT SUM(distance)  FROM passenger)AS Percentage FROM passenger ;
 
 #11#Display the distance, price in three categories in table Price
#a) Expensive if the cost is more than 1000
 #b) Average Cost if the cost is less than 1000 and greater than 500
#c) Cheap otherwise


 SELECT Distance ,Price ,
 CASE when price>1000 THEN 'Expensive'
 WHEN price >500 AND price <1000 THEN 'Average Cost'
 ELSE 'Cheap'
 END AS Category
 FROM PRICE;

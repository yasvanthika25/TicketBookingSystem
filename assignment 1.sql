--task1
--1. create database
create database TBS
--2.create table for venues
use TBS
create table venues(
venue_id int primary key,
venue_name varchar(50)not null,
[address] varchar(100)not null)

select* from venues
--create table customerTable(
create table Customers(
customer_id int primary key,
customer_name varchar(50),
email varchar(100),
phone_number varchar(15))
--create table for events
create table eventss(
event_id int primary key,
event_name varchar(50)not null,
event_dateDATE date not null,
event_timeTIME time not null,
venue_id int not null,
foreign key (venue_id) references venues (venue_id),
total_seats int not null,
available_seats int not null,
ticket_price decimal(10,2)not null,
event_type varchar(20) not null
--
)
--create table for booking
create table Bookings(
booking_id int primary key,
customer_id int not null,
foreign key (customer_id) references Customers(customer_id),
event_id int not null,
foreign key (event_id) references eventss(event_id),
num_tickets int not null, 
total_cost decimal(10,2) not null, 
booking_date date not null)
--task2
-- insert the values on table venues
insert into venues (venue_id,venue_name,[address]) values(1,'Phoenix Arena', 'Telangana'),
(2,'Kala Mandapam', '10 Gandhi Road, Coimbatore'),
(3,'The Grand Hall', 'Bengaluru'),
(4,'City Convention Center', ' Chennai'),
(5,'Riverfront Amphitheatre', ' Ahmedabad'),
(6,'Royal Expo Grounds', 'New Delhi'),
(7,'Symphony Auditorium', 'Kerala'),
(8,'Infinity Banquet Hall', 'Pune'),
(9,'Heritage Open Stage', 'Jaipur'),
(10,'Skyline Dome', ' Hyderabad')
select* from venues
-- insert the values on table customers
insert into Customers(customer_id,customer_name,email,phone_number)values
(1,'A', 'a@gmail.com','1234567890'),
(2,'B', 'b@gmail.com','1234567890'),
(3,'C', 'c@gmail.com','1234567891'),
(4,'D', 'd@gmail.com','1234567892'),
(5,'E', 'e@gmail.com','1234567893'),
(6,'F', 'f@gmail.com','1234567894'),
(7,'G', 'g@gmail.com','1234567895'),
(8,'H', 'h@gmail.com','1234567896'),
(9,'I', 'i@gmail.com','1234567897'),
(10,'J', 'j@gmail.com','1234567898')
select* from Customers
-- insert values on event table
insert into eventss(event_id,event_name,event_dateDATE,event_timeTIME,venue_id,total_seats,available_seats,
ticket_price,event_type)values (1,'Strings of India', '2025-07-05', '19:00:00',1, 1000, 320, 1200.00, 'Music'),
(2,'Kabaddi League Final', '2025-07-10', '18:00:00',3, 15000, 2500, 800.00, 'Sports'),
(3,'Shakespeare Live: Hamlet', '2025-07-12', '17:30:00',2, 500, 100, 600.00, 'Drama'),
(4,'Bollywood Beats', '2025-07-15', '20:00:00', 4,2000, 750, 1500.00, 'Music'),
(5,'National Basketball Finals', '2025-07-18', '19:00:00',5, 10000, 1400, 1000.00, 'Sports'),
(6,'Ramayana - The Play', '2025-07-20', '18:00:00',6, 700, 120, 700.00, 'Drama'),
(7,'Jazz Under the Stars', '2025-07-25', '20:30:00',7, 800, 300, 1300.00, 'Music'),
(8,'State Football Championship', '2025-07-28', '17:00:00',8, 18000, 3600, 950.00, 'Sports'),
(9,'The Broken Chair', '2025-08-01', '19:00:00',9, 600, 90, 500.00, 'Drama'),
(10,'Classical Raagas Night', '2025-08-05', '19:30:00',10, 900, 200, 1100.00, 'Music')
select*from eventss
-- insert values for booking tables
insert into Bookings(booking_id,customer_id,event_id,num_tickets,total_cost,booking_date)values
(1,3,10,2, 2400.00, '2025-06-10'),
(2,2,9,4, 3200.00, '2025-06-11'),
(3,1,8,1, 600.00,  '2025-06-11'),
(4,5,6,3, 4500.00, '2025-06-12'),
(5,4,7,2, 2000.00, '2025-06-12'),
(6,10,5,2, 1400.00, '2025-06-13'),
(7,6,4,3, 3900.00, '2025-06-13'),
(8,7,3,5, 4750.00, '2025-06-14'),
(9,8,2,1, 500.00,  '2025-06-14'),
(10,9,7,2, 2200.00, '2025-06-15')
select*from Bookings

--task2
--2.Write a SQL query to list all Events. 
select*from eventss
--3.Write a SQL query to select events with available tickets.
select*from eventss
where available_seats>0
--4.Write a SQL query to select events name partial match with ‘cup’. 
select event_name
from eventss
where event_name like '% cup %'
--5. Write a SQL query to select events with ticket price range is between 1000 to 2500.
select* from eventss
where ticket_price between 1000 and 2500
--6.Write a SQL query to retrieve events with dates falling within a specific range. 
select*from eventss 
where year(event_dateDATE) between 2024 and 2025
--7. Write a SQL query to retrieve events with available tickets that also have "Concert" in their name. 
select* from eventss
where available_seats>0 and event_name like '%concert%'
--8.Write a SQL query to retrieve users in batches of 5, starting from the 6th user. 
select customer_id from Customers
order by customer_id
offset 5 row
fetch next 5 row only

--9.Write a SQL query to retrieve bookings details contains booked no of ticket more than 4. 
select*from Bookings
where num_tickets>4
--10.Write a SQL query to retrieve customer information whose phone number end with ‘000’ 
select* from Customers
where phone_number like '%000'
--11. Write a SQL query to retrieve the events in order whose seat capacity more than 15000. 
select* from eventss
where total_seats>1500
--12.Write a SQL query to select events name not start with ‘x’, ‘y’, ‘z’
select event_name from eventss 
where event_name != 'x%''y%''z%'

--Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins: 
--1. Write a SQL query to List Events and Their Average Ticket Prices.
select event_name,avg(ticket_price) as averageticketprice
from eventss
group by event_name
--2.Write a SQL query to Calculate the Total Revenue Generated by Events. 
select sum(total_cost) as TotalRevenue from Bookings
--3.Write a SQL query to find the event with the highest ticket sales. 
select e.event_name, sum(b.total_cost) as HighestTicketSales
from Bookings b
join eventss e
on b.event_id=e.event_id
group by event_name
order by (HighestTicketSales) desc
--4.Write a SQL query to Calculate the Total Number of Tickets Sold for Each Event. 
select e.event_name,sum(b.num_tickets) as totalNumberofTickets
from Bookings b
join eventss e
on e.event_id=b.event_id
group by event_name
--5.Write a SQL query to Find Events with No Ticket Sales. 
select e.event_name
from eventss e
left join Bookings b
on e.event_id=b.event_id
group by event_name
having sum(b.num_tickets) is null
--6.Write a SQL query to Find the User Who Has Booked the Most Tickets. 
select c.customer_name,sum(b.num_tickets) as tickets
from Customers c
join Bookings b
on c.customer_id = b.customer_id
group by customer_name
order by tickets desc
--7.Write a SQL query to List Events and the total number of tickets sold for each month. 
select e.event_name, sum(b.num_tickets) as Totaltickets,month(e.event_dateDATE) as months from
eventss e
join Bookings b
on e.event_id=b.event_id
group by event_name,month(e.event_dateDATE) 
order by month(event_dateDATE)
--8.Write a SQL query to calculate the average Ticket Price for Events in Each Venue.
select v.venue_name,e.event_name, avg(e.ticket_price) as [average ticket price]
from eventss e
join venues v
on e.venue_id=v.venue_id
group by e.event_name,v.venue_name
order by [average ticket price]
--9.Write a SQL query to calculate the total Number of Tickets Sold for Each Event Type.
 select e.event_type, sum(b.num_tickets) as totaltickets
 from eventss e
 left join Bookings b
 on e.event_id=b.event_id
 group by event_type
 order by totaltickets
 --10. Write a SQL query to calculate the total Revenue Generated by Events in Each Year.
 select e.event_id,sum(b.total_cost) as totalrevenue,year(e.event_dateDATE) as [year]
 from eventss e
 left join Bookings b
 on e.event_id=b.event_id
 group by e.event_id,year(e.event_dateDATE)
 order by[year]
 --11. Write a SQL query to list users who have booked tickets for multiple events. 
 select c.customer_name,sum(b.event_id) as tickets
 from Customers c
 left join Bookings b
 on c.customer_id=b.customer_id
 group by c.customer_name
 having sum( b.event_id)>=2
 --12.Write a SQL query to calculate the Total Revenue Generated by Events for Each User.
 select e.event_name,b.customer_id,sum(b.total_cost) totalrevenue
 from eventss e
 join Bookings b
 on e.event_id=b.event_id
 group by e.event_name,b.customer_id
 --13.Write a SQL query to calculate the Average Ticket Price for Events in Each Category and Venue. 
 select e.event_type,v.venue_name,avg(e.ticket_price) as averageticketprice
 from eventss e
 join venues v
 on v.venue_id=e.venue_id
 group by event_type,v.venue_name
 --14.Write a SQL query to list Users and the Total Number of Tickets They've Purchased in the Last 30 Days.
 select top 30 convert(varchar,b.booking_date,103),c.customer_name,sum(b.num_tickets) as [total tickets]
 from Bookings b
 join Customers c
 on b.customer_id=c.customer_id
 
 group by c.customer_name,b.booking_date
 order by (b.booking_date)desc
 


 --class assignment related to subqueries
--given the customerName and Get the event details for that customerName 
select event_id,event_name
from eventss
where customer_id =(select customer_id from Customers where customer_name='A')
--given the eventid(1 and 2) and Get the eventdetails for that eventid from events table
select event_name,ticket_price
from eventss
where event_id 
in(select event_id from eventss where event_id=1 or event_id=2)
--find total number of tickets ordered for a event, given the event_id
select event_id,sum(num_tickets) as totaltickets
from Bookings
where event_id=(select sum(num_tickets)from bookings where event_id=5)
group by event_id

--task 4: Subquery and its types
--1.Calculate the Average Ticket Price for Events in Each Venue Using a Subquery. 
select avg(e.ticket_price) as averageticketprice
from eventss e
where exists
(select venue_id from venues v
where e.venue_id=v.venue_id)
group by venue_id
--2.Find Events with More Than 50% of Tickets Sold using subquery. 
select event_name
from eventss e
where (
    select sum(num_tickets)
    from Bookings b
    where b.event_id = e.event_id
) > total_seats / 2
--3.Calculate the Total Number of Tickets Sold for Each Event.
select sum(b.num_tickets) as ticketsSold
from Bookings b
where exists (select e.event_name from eventss e
where e.event_id=b.event_id)
group by event_id  
--4.Find Users Who Have Not Booked Any Tickets Using a NOT EXISTS Subquery.
select customer_name
from Customers c
where not exists(select customer_id from Bookings b
where c.customer_id=b.customer_id)
--5.List Events with No Ticket Sales Using a NOT IN Subquery. 
select event_name from eventss 
where event_id not in (select event_id from Bookings b
where b.num_tickets=0)
--6. Calculate the Total Number of Tickets Sold for Each Event Type Using a Subquery in the FROM Clause.
select event_type, sum(total_tickets_sold) as total_sold
from (
    select e.event_type, 
           (select sum(b.num_tickets)
            from Bookings b
            where b.event_id = e.event_id) as total_tickets_sold
    from eventss e ) as event_sales
group by event_type
--7.Find Events with Ticket Prices Higher Than the Average Ticket Price Using a Subquery in the WHERE Clause. 
select event_name from eventss
where ticket_price>(select avg(ticket_price) 
from eventss)
--8.Calculate the Total Revenue Generated by Events for Each User Using a Correlated Subquery.
select c.customer_name,(select sum(b.total_cost)
from Bookings b
where b.customer_id = c.customer_id ) as total_revenue
from Customers c
--9.List Users Who Have Booked Tickets for Events in a Given Venue Using a Subquery in the WHERE Clause. 
    select customer_name
    from Customers
    where customer_id in(select customer_id from Bookings
    where event_id in (select event_id
    from eventss
    where venue_id = (select venue_id from venues
    where venue_name = 'City Convention Center')))
--10. Calculate the Total Number of Tickets Sold for Each Event Category Using a Subquery with GROUP BY. 
select event_type, sum(total_tickets) as tickets_sold
from (
    select e.event_type,
           (select sum(b.num_tickets)
            from Bookings b
            where b.event_id = e.event_id) as total_tickets
    from eventss e
) as event_sales
group by event_type
--11. Find Users Who Have Booked Tickets for Events in each Month Using a Subquery with DATE_FORMAT.
select c.customer_id, c.customer_name
from Customers c
where exists (
    select *
    from Bookings b
    where b.customer_id = c.customer_id
      and format(b.booking_date, 'yy-MM') = '25-06')
--12. Calculate the Average Ticket Price for Events in Each Venue Using a Subquery
select v.venue_name,
(select cast (avg(e.ticket_price) as decimal (10,2))
from eventss e
where e.venue_id = v.venue_id) as avg_ticket_price
from venues v





 



 



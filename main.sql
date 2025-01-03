select model, speed, hd
from PC
where price < 500;

select distinct maker
from Product
where type = 'Printer';

select model, ram, screen
from Laptop
where price > 1000;

select *
from Printer 
where color = 'y';

select model, speed, hd
from PC
where cd in ('12x', '24x') and price < 600;

select distinct p.maker, l.speed
from Product p 
join Laptop l on p.model = l.model
where hd >= 10;

select p.model, pc.price
from Product p 
join PC pc on p.model = pc.model
where p.maker = 'B'
UNION
select p.model, l.price
from Product p 
join Laptop l on p.model = l.model
where p.maker = 'B'
UNION
select p.model, pr.price
from Product p 
join Printer pr on p.model = pr.model
where p.maker = 'B';

select maker
from Product
where type = 'PC'
except
select maker
from Product
where type = 'Laptop';

select distinct p.maker
from Product p 
join PC pc on p.model = pc.model
where speed >= 450;

select model, price
from Printer
where price = (select max(price) from Printer);

select avg(speed)
from PC;

select avg(speed)
from Laptop
where price > 1000;

select avg(pc.speed)
from Product p 
join PC pc on p.model = pc.model
where p.maker = 'A';

select c.class, s.name, c.country
from Ships s 
join Classes c on s.class = c.class
where c.numGuns >= 10;

select hd
from PC
group by hd
having count(hd)>=2;

select distinct pc.model, pc1.model, pc.speed, pc.ram
from PC pc, PC pc1
where pc.speed = pc1.speed 
and pc.ram = pc1.ram 
and pc.model > pc1. model;

select distinct p.type, l.model, l.speed
from Laptop l, Product p
where l.speed < (
    select min(speed) 
    from PC) 
    and p.type = 'Laptop';

select distinct p.maker, pr.price
from Product p 
join Printer pr on p.model = pr.model
where color = 'y' 
and price = (
    select min(price) 
    from Printer 
    where color = 'y');

select p.maker, avg(l.screen)
from Product p 
join Laptop l on p.model = l.model
group by p.maker;

select maker, count(maker)
from Product
where type = 'PC'
group by maker
having count(maker) >= 3;

select p.maker, max(PC.price)
from Product p 
join PC on p.model = PC.model
group by p.maker;

select speed, avg(price)
from PC
where speed > 600
group by speed;

select maker
from Product
INTERSECT
select p.maker 
from Product p 
join pc on p.model = pc.model
where pc.speed >= 750
INTERSECT
select p.maker
from Product p 
join Laptop l on p.model = l.model
where l.speed >= 750;

select model
from(
select model, price
from pc
union
select model, price
from Laptop
union
select model, price
from Printer
) t1
where price = (
select max(price)
from(
select price
from pc
union
select price
from Laptop
union
select price
from Printer
) t2);

select avg(price)
from(
select l.price
from Product p 
join Laptop l on p.model = l.model 
where maker = 'A'
union all
select pc.price
from Product p 
join PC on p.model = pc.model 
where maker = 'A'
) t1

select maker, avg(hd)
from Product p 
join PC on p.model = pc.model
where maker in (
    select maker 
    from Product 
    where type = 'Printer')
group by maker

select class, country
from Classes
where bore >=16

select ship
from Outcomes
where battle = 'North Atlantic' and  result = 'sunk'

select distinct s.name
from Classes c 
join Ships s on c.class = s.class
where s.launched >= 1922 
and c.displacement > 35000 
and c.type = 'bb'

Select country
from Classes 
where type = 'bb'
INTERSECT
Select country
from Classes 
where type = 'bc'

select ship, battle
from Outcomes 
where result = 'sunk'

select name
from Ships 
where name like 'R%'
union 
select ship
from Outcomes 
where ship like 'R%'

select name
from Ships 
where name like '% % %'
union
select ship
from Outcomes 
where ship like '% % %'

select s.name
from Ships s 
join Classes c on s.class = c.class
where c.bore = '16'
union
select o.ship
from Outcomes o 
join Classes c on o.ship = c.class 
where c.bore = '16'

select distinct o.battle
from Ships s 
join Outcomes o on s.name = o.ship
where s.class = 'Kongo'

select type
from Product
where type like 'p%'

select *
from Product
where model not in (
    select top 3 model
    from Product
    order by model desc) 
and model not in (
    select top 3 model
    from Product
    order by model asc)

select maker, count(model)
from Product
group by maker
having count(model) in(
    select max(t) 
    from (
        select count(model) t 
        from Product 
        group by maker) t1)
or count(model) in(
    select min(t) 
    from (
        select count(model) t 
        from Product 
        group by maker) t1)

insert into PC (code, model, speed, ram, hd, cd, price)
values (20, 2111, 950, 512, 60, '52x', 1100)

insert into Product
values 
('Z', 4003, 'Printer'),
('Z', 4001, 'PC'),
('Z', 4002, 'Laptop')

insert into PC
values (22, 4444, 1200, DEFAULT, DEFAULT, DEFAULT, 1350)

insert into pc (code, model, speed, ram, hd, price)
select 
min(code)+20, 
model + 1000, 
max(speed), 
max(ram)*2,
max(hd)*2,
max(price)/1.5
from Laptop
group by model

delete from pc
where 
ram = (
    select min(ram) 
    from pc) 
or
hd = (
    select min(hd) 
    from pc)

update Product
set maker = 'Z' 
where maker = 'A' 
and type = 'Printer'

delete from Ships 
where name in (
    select ship 
    from Outcomes 
    where result ='sunk')

update Classes 
set bore = bore*2.5, 
displacement = round(displacement/1.1, 0)

delete from PC 
where code not in (
select max(code) 
from pc
group by model)

update Laptop
set screen = screen + 1,
price = price - 100
where model in (
select model
from Product
where maker in ('E', 'B') and type = 'Laptop'
)

insert into Outcomes (ship, battle, result)
select 'Rodney' ship, (
    select distinct name 
    from Battles 
    where date= '1944-10-25') battle, 'sunk' result
union 
select 'Nelson', (
    select distinct 
    name from Battles 
    where date= '1945-01-28') , 'damaged'

insert into Outcomes (ship, battle, result)
values 
('Rodney', (
    select distinct name 
    from Battles 
    where date= '1944-10-25') , 'sunk'),
('Nelson', (
    select distinct name 
    from Battles 
    where date= '1945-01-28') , 'damaged')

delete from Product
where model not in (
select model from pc
union
select model from laptop
union
select model from Printer
)

delete from PC
where hd in (
    select distinct top 3 hd 
    from pc 
    order by hd)

select *
from customers

select city
from customers

select distinct country
from customers

select *
from customers
where city = 'Пермь'

select *
from customers
where not city = 'Пермь'

select *
from customers
where customerID = 32

select * from customer
where city = 'Пермь'
and postalcode = 614000

select * from  customer
where city = 'Пермь'
or city = 'Москва'

select * from customer
order by city

select * from customer
order by city desc 

select * from customer
order by 

insert into customer (customername, addres, city, postalcode, country)
values ('Андрей', 'Пермь', 'Пермь', 614000, 'Россия')

select * from customer
where postalcode is null 

select * from customer
where postalcode is not null 

update customer
set city = 'Свердловск'

update customer
set city = 'Свердловск'
where country = 'Россия'

update customer
set city = 'Свердловск', country = 'Россия'
where customerID = 32

delete from customer
where country = 'Россия'

delete from customer

select min(price)
from Product

select max(price)
from Product

select count(*)
from Product
where price = 18

select avg(price)
from Product

select sum(price)
from Product

select * from customer
where city like 'a%'

select * from customer
where city like '%a'

select * from customer
where city like '%a%'

select * from customer
where city like 'a%b'

select * from customer
where city not like 'a%'

select * from customer
where city like '_a%'

select * from customer
where city like '[acs]%'

select * from customer
where city like '[a-f]%'

select * from customer
where city like '[!acf]%'

select * from customer
where country in ('Норвегия', 'Франция')

select * from customer
where country not in ('Норвегия', 'Франция')

create database name1

drop database name1

create table name1 
(
    Id int,
    FirstName varchar(30),
    LastName varchar(30),
    Email varchar(30),
    Age int
)

drop table name1

alter table name1 
add address1 varchar(30)

alter table name1
drop column address1

alter table name1
rename colum address1 to city1

alter table name1
rename to name2

insert into name1 (id, firstname, lastname, Email, Age)
values 
(1, 'Join', 'Right', 'rj@mail.ru', 24),
(2, 'Join', 'Right', 'rj@mail.ru', 24),
(3, 'Join', 'Right', 'rj@mail.ru', 24)

update name1
set firstname = 'Jhon'
where firstname = 'Join'

delete from name1 
where firstname = 'Jhon'

select * from Product
where price between 10 and 20

select * from Product
where price not between 10 and 20

select * from customer
where Product between 'aa' and 'cc'

select customerID cid, addres ads, postalcode pc
from customer

select * 
from order o 
join customer c on o.customerID = c.customerID

select country, count(customerID)
from customer
group by country

select country, count(customerID)
from customer
group by country
order by count(customerID) desc

create database testDB

drop database testDB

create table person (
    personid int,
    lastname varchar(255),
    firstname varchar(255),
    addres varchar(255),
    city varchar(255)
)

drop table person

truncate table person

alter table person
add birthday date

alter table person
drop column birthday

select *
from Employees

select * 
from Employees
where firstname = 'David'

select * 
from Employees
where job_id = 'IT_PROG'

select
from Employees
where department_id = 50 
and salary > 400

select * 
from Employees
where department_id in (20, 30)

select * 
from Employees
where firstname like '%a'

select *
from Employees
where department_id in (50, 80) 
and commission_pct is not null

select * 
from Employees
where firstname like '%n%n%'

select * 
from Employees
where firstname like '%____%'

select * 
from Employees
where salary between 8000 and 9000

select distinct manager_id
from Employees
where manager_id is not null

select *
from Employees
where length (firstname) > 10

select name
from passenger

select name
from company

select *
from trip
where town_from = 'Moscow'

select name
from passenger
where name like '%man'

select count(*) count
from trip
where plane = 'TU-134'

select distinct name
from trip t 
join company c on t.company = c.id
where plane = 'Boeing'

select distinct plane
from trip
where town_to = 'Moscow'

select name
from company
where id = (
    select company 
    from trip 
    where town_from = 'Vladivostok')

select t.id, count(p.passenger) count
from trip t left 
join Pass_in_trip p on t.id = p.trip
group by t.id

select t.town_to
from trip t 
join Pass_in_trip p on t.id = p.trip
join passenger pa on p.passenger = pa.id
where pa.name = 'Bruce Willis'

select t.time_in 
from trip t 
join Pass_in_trip p on t.id = p.trip
join passenger pa on pa.id = p.passenger
where pa.name = 'Steve Martin' and t.town_to='London'

select distinct f.status
from FamilyMembers f
join Payments p on f.member_id = p.family_member
join goods g on p.good = g.good_id
where g.good_name = 'potato'

select member_name
from FamilyMembers
where status = 'mother'

select count(*) count 
from trip
where town_from = 'Rostov' 
and town_to = 'Moscow'

select count(*) count
from class
where name like '10%'

select *
from student
where address like 'ul. Pushkina%'

select count(*) count 
from student
where first_name = 'Anna'

select count(*) count 
from class c 
join Student_in_class s on c.id = s.class
where name like '10 B'

select distinct t.start_pair
from Schedule s 
join Timepair t on s.number_pair = t.id
where s.number_pair = 4

update FamilyMembers
set member_name = 'Andie Anthony'
where member_name = 'Andie Quincey'

delete from trip
where town_from = 'Moscow'

select last_name, first_name, birthday
from student
where birthday like '%-05-%'

select sum(price * items) income_from_female
from Purchases
where user_gender in ('f', 'female')

select c.name country_name
from Countries c 
join Regions r on c.id = r.countryid
join Cities ci on r.id = ci.regionid
where ci.name = 'Salzburg'

select p.name 
from Pilots p 
join Flights f on p.pilot_id = f.second_pilot_id
where flight_date like '2023-08-%' 
and f.destination ='New York'

select town_to, time(time_in - time_out) flight_time
from trip
where town_from = 'Paris'

select *
from trip
where time_out between 
'1900-01-01T10:00:00.000Z' and '1900-01-01T14:00:00.000Z'

select name
from passenger
group by name
having count(name) >= 2

select name, count(passenger) count
from passenger p 
join Pass_in_trip pt on p.id = pt.passenger
group by name
order by count desc, name asc

select member_name, status, sum(p.unit_price*p.amount) costs
from familymembers f 
join Payments p on f.member_id = p.family_member
where p.date like '2005%'
group by member_name, status

select member_name
from FamilyMembers
where birthday in (
    select min(birthday) 
    from FamilyMembers)

select party_rk,
    case gender_cd
        when 'M' then 'Мужской'
        when 'F' then 'Женский'
    end gender
from person_party

select count(*)
from table

select count(gender)
from table
where gender = 'M'

select count(distinct gender)
from table

















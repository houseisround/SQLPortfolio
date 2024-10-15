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
from Product p join Laptop l on p.model = l.model
where hd >= 10;

select p.model, pc.price
from Product p join PC pc on p.model = pc.model
where p.maker = 'B'
UNION
select p.model, l.price
from Product p join Laptop l on p.model = l.model
where p.maker = 'B'
UNION
select p.model, pr.price
from Product p join Printer pr on p.model = pr.model
where p.maker = 'B';

select maker
from Product
where type = 'PC'
except
select maker
from Product
where type = 'Laptop';

select distinct p.maker
from Product p join PC pc on p.model = pc.model
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
from Product p join PC pc on p.model = pc.model
where p.maker = 'A';

select c.class, s.name, c.country
from Ships s join Classes c on s.class = c.class
where c.numGuns >= 10;

select hd
from PC
group by hd
having count(hd)>=2;

select distinct pc.model, pc1.model, pc.speed, pc.ram
from PC pc, PC pc1
where pc.speed = pc1.speed and pc.ram = pc1.ram and pc.model > pc1. model;

select distinct p.type, l.model, l.speed
from Laptop l, Product p
where l.speed < (select min(speed) from PC) and p.type = 'Laptop';

select distinct p.maker, pr.price
from Product p join Printer pr on p.model = pr.model
where color = 'y' and price = (select min(price) from Printer where color = 'y');

select p.maker, avg(l.screen)
from Product p join Laptop l on p.model = l.model
group by p.maker;

select maker, count(maker)
from Product
where type = 'PC'
group by maker
having count(maker) >= 3;

select p.maker, max(PC.price)
from Product p join PC on p.model = PC.model
group by p.maker;

select speed, avg(price)
from PC
where speed > 600
group by speed;

select maker
from Product
INTERSECT
select p.maker 
from Product p join pc on p.model = pc.model
where pc.speed >= 750
INTERSECT
select p.maker
from Product p join Laptop l on p.model = l.model
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
from Product p join Laptop l on p.model = l.model 
where maker = 'A'
union all
select pc.price
from Product p join PC on p.model = pc.model 
where maker = 'A'
) t1

select maker, avg(hd)
from Product p join PC on p.model = pc.model
where maker in (select maker from Product where type = 'Printer')
group by maker

select class, country
from Classes
where bore >=16

select ship
from Outcomes
where battle = 'North Atlantic' and  result = 'sunk'

select distinct s.name
from Classes c join Ships s on c.class = s.class
where s.launched >= 1922 and c.displacement > 35000 and c.type = 'bb'

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
from Ships s join Classes c on s.class = c.class
where c.bore = '16'
union
select o.ship
from Outcomes o join Classes c on o.ship = c.class 
where c.bore = '16'

select distinct o.battle
from Ships s join Outcomes o on s.name = o.ship
where s.class = 'Kongo'

select type
from Product
where type like 'p%'

select *
from Product
where model not in (select top 3 model
from Product
order by model desc) and model not in (select top 3 model
from Product
order by model asc)

select maker, count(model)
from Product
group by maker
having count(model) in
(
select max(t) from (select count(model) t from Product group by maker) t1
)
or count(model) in
(
select min(t) from (select count(model) t from Product group by maker) t1
)

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
ram = (select min(ram) from pc) 
or
hd = (select min(hd) from pc)



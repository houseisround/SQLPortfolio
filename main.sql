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





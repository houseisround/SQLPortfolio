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


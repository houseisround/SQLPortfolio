SELECT *
FROM   products;

SELECT *
FROM   products
ORDER BY name;

SELECT courier_id,
       order_id,
       action,
       time
FROM   courier_actions
ORDER BY courier_id, action, time desc limit 1000;

SELECT name,
       price
FROM   products
ORDER BY price desc 
limit 5

SELECT name product_name,
       price product_price
FROM   products
ORDER BY price desc 
limit 5;

SELECT name,
       length(name) name_length,
       price
FROM   products
ORDER BY length(name) desc 
limit 1;

SELECT name,
       split_part(upper(name), ' ', 1) first_word,
       price
FROM   products
ORDER BY name;

SELECT name,
       price,
       price::varchar price_char
FROM   products
ORDER BY name;

SELECT name,
       price,
       cast(price as varchar) as price_char
FROM   products
ORDER BY name

SELECT concat('Заказ № ',
              order_id::varchar ,
              ' создан ',
              creation_time::date) order_info
FROM   orders 
limit 200;

SELECT courier_id,
       date_part('year', birth_date) birth_year
FROM   couriers
ORDER BY birth_year desc, courier_id

SELECT courier_id,
       coalesce(date_part('year', birth_date)::varchar, 'unknown') birth_year
FROM   couriers
ORDER BY birth_year desc, courier_id
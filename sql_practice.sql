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
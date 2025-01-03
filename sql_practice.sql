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


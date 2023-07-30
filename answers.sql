-- Problem 1 --
SELECT email FROM customers 
    ORDER BY email ASC;

-- Problem 2 --

SELECT id
    FROM orders
    WHERE customer_id =
        (SELECT id 
            FROM customers
            WHERE fname = 'Elizabeth' AND lname = 'Crocker'
        );

-- Problem 3 --

SELECT SUM(num_cupcakes) 
    FROM orders 
    WHERE processed = false;


-- Problem 4 --


SELECT cupcakes.name AS name, COALESCE(SUM(num_cupcakes), 0) as sum
    FROM cupcakes
        LEFT JOIN orders
            ON cupcakes.id = orders.cupcake_id
    GROUP BY cupcakes.name
    ORDER BY name ASC;


-- Problem 5 --

SELECT email, SUM(num_cupcakes) AS total
    FROM customers
        LEFT JOIN orders
        ON customers.id = orders.customer_id
        GROUP BY customers.email
        ORDER BY total DESC;


-- Problem 6 --

SELECT fname, lname, email
    FROM customers
        LEFT JOIN orders
        ON customers.id = orders.customer_id
        LEFT JOIN cupcakes
        ON orders.cupcake_id = cupcakes.id
        WHERE cupcake_id = 5 AND orders.processed = TRUE
        LIMIT 1;



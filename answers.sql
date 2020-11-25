  product_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(10,2)
  );

INSERT INTO products (name, price)
VALUES
('Spicy Chips', 3.99),
('Applebeer', 8.50),
('SnoShack', 1000.00);

CREATE TABLE orders(
  order_id SERIAL PRIMARY KEY,
  product_id INT REFERENCES products(product_id),
  order_quantity INT
  );

INSERT INTO orders (product_id, order_quantity)
VALUES
(1, 5),
(3, 1),
(2, 24);

SELECT * FROM products p
JOIN orders o ON o.product_id = p.product_id
WHERE order_id = 1;

SELECT * FROM orders;

SELECT SUM(p.price * o.order_quantity) FROM products p
JOIN orders o ON o.product_id = p.product_id
WHERE order_id = 1;

ALTER TABLE orders
ADD COLUMN user_id INT REFERENCES users(user_id);

UPDATE orders
SET user_id = 1
WHERE order_id = 3;

SELECT * FROM orders;

UPDATE orders
SET user_id = 2
WHERE order_id = 1;

SELECT * FROM orders;

UPDATE orders
SET user_id = 3
WHERE order_id = 2;

SELECT * FROM orders;

SELECT * FROM orders o
JOIN users u ON u.user_id = o.user_id;

SELECT COUNT(*), name FROM users u
JOIN orders o ON o.user_id = u.user_id
GROUP BY u.user_id;


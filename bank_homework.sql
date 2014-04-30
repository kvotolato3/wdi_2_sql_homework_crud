-- In case there is already a bank_homework database, drop it
DROP DATABASE IF EXISTS bank_homework;

-- Create a bank_homework database
CREATE DATABASE bank_homework;


-- Connect to the bank_homework databases
\c bank_homework;


-- Create a payments table
CREATE TABLE payments(
  id SERIAL PRIMARY KEY,
  created_at DATE,
  amount MONEY,
  payer_name TEXT,
  recipient_name TEXT,
  description TEXT
  );

--  The table should have columns of id, created_at, amount, payer_name,
--  recipient_name, and description with the appropriate datatypes


-- Alter the payments table, add the column of `zipcode`
-- to specify where the transaction was made

ALTER TABLE payments ADD zipcode TEXT;


-- Insert 20 rows into the payments table
-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.

INSERT INTO payments (payer_name, recipient_name, amount, created_at, description)
  VALUES('Kathleen', 'General Assembly', 2000, '2014-03-25', 'class payment');
INSERT INTO payments (payer_name, recipient_name, amount, created_at, description)
  VALUES('Jack', 'General Assembly', 1.00, '2014-04-25', 'class payment');
INSERT INTO payments (payer_name, recipient_name, amount, created_at, description)
  VALUES('Katie', 'Amazon', 0.50, '2014-04-25', 'deposit');
INSERT INTO payments (payer_name, recipient_name, amount, created_at, description)
  VALUES('Kelly', 'RIT', 20000, '2014-04-25', 'college');
INSERT INTO payments (payer_name, recipient_name, amount, created_at, description)
  VALUES('Kelly', 'RIT', 22000, '2014-04-26', 'college');
INSERT INTO payments (payer_name, recipient_name, amount, created_at, description)
  VALUES('Kelly', 'RIT', 18000, '2010-04-25', 'college');
INSERT INTO payments (payer_name, recipient_name, amount, created_at, description)
  VALUES('Kathleen', 'General Assembly', 3000, '2014-04-22', 'class payment');
INSERT INTO payments (payer_name, recipient_name, amount, created_at, description)
  VALUES('Kelly', 'Amazon', 1.50, '2014-04-25', 'fee');
INSERT INTO payments (payer_name, recipient_name, amount, created_at, description)
  VALUES('Kathleen', 'Amazon', 200, '2010-04-25', 'books');
INSERT INTO payments (payer_name, recipient_name, amount, created_at, description)
  VALUES('Kathleen', 'Amazon', 300, '2010-04-25', 'books');
INSERT INTO payments (payer_name, recipient_name, amount, created_at)
  VALUES('Kathleen', 'General Assembly', 2000, '2014-03-25');
INSERT INTO payments (payer_name, recipient_name, amount, created_at)
  VALUES('Jack', 'General Assembly', 1.00, '2014-04-25');
INSERT INTO payments (payer_name, recipient_name, amount, created_at)
  VALUES('Katie', 'Amazon', 0.50, '2014-04-25');
INSERT INTO payments (payer_name, recipient_name, amount, created_at)
  VALUES('Kelly', 'RIT', 20000, '2009-04-25');
INSERT INTO payments (payer_name, recipient_name, amount, created_at)
  VALUES('Kelly', 'RIT', 22000, '2008-04-25');
INSERT INTO payments (payer_name, recipient_name, amount, created_at)
  VALUES('Kelly', 'RIT', 18000, '2010-04-25');
INSERT INTO payments (payer_name, recipient_name, amount, created_at)
  VALUES('Kathleen', 'General Assembly', 3000, '2014-04-22');
INSERT INTO payments (payer_name, recipient_name, amount, created_at)
  VALUES('Kelly', 'Amazon', 1.50, '2014-04-25');
INSERT INTO payments (payer_name, recipient_name, amount, created_at)
  VALUES('Kathleen', 'Amazon', 200, '2010-04-25');
INSERT INTO payments (payer_name, recipient_name, amount, created_at)
  VALUES('Kathleen', 'Amazon', 300, '2010-04-25');


-- You receive notice that the payment with id of 9 is $10 too low.
-- Alter that row so that it is corrected

UPDATE payments SET amount = 210 WHERE id = 9;


-- Delete all payments with an amount under $2

DELETE FROM payments WHERE (amount::money::numeric::float8) < 2.00;


-- Select all entries from the payments table

SELECT * FROM payments;


-- In a single query, output all payments ordered from the largest to the smallest

SELECT * FROM payments ORDER BY amount DESC;


-- In a single query, output the names of all distinct recipients

SELECT DISTINCT recipient_name FROM payments;


-- In a single query, select all payments created in the past week

SELECT * FROM payments WHERE created_at > current_date - 7;


-- In a single query, select all payments with a blank description

SELECT * FROM payments WHERE description IS NULL;


-- In a single query, select all payments matching the name of one of the payers (choose any single one)

SELECT * FROM payments WHERE payer_name = 'Kathleen';

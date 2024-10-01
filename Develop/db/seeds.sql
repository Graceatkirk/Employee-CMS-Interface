BEGIN;

-- Clear existing data
DELETE FROM employees;
DELETE FROM roles;
DELETE FROM departments;

-- Insert sample data into departments
INSERT INTO departments (name) VALUES 
('Sound'),
('Lighting'),
('Scenic'),
('Props'),
('Makeup'),
('Hair'),
('Costuming'),
('Special Effects'),
('Front of House'),
('Marketing');

-- Check the inserted departments to verify IDs
SELECT * FROM departments;

-- Update the roles insert based on the actual department IDs
-- Make sure to replace the numbers below with the correct department_id values
-- from the output of the SELECT * FROM departments query
INSERT INTO roles (title, salary, department_id) VALUES 
('Sound Engineer', 90000.00, (SELECT id FROM departments WHERE name = 'Sound')),
('Lighting Designer', 90000.00, (SELECT id FROM departments WHERE name = 'Lighting')),
('Shop Master', 80000.00, (SELECT id FROM departments WHERE name = 'Sound')),
('Props Master', 70000.00, (SELECT id FROM departments WHERE name = 'Props')),
('Makeup Artist', 60000.00, (SELECT id FROM departments WHERE name = 'Makeup')),
('Hair Stylist', 60000.00, (SELECT id FROM departments WHERE name = 'Hair')),
('Costume Manager', 70000.00, (SELECT id FROM departments WHERE name = 'Costuming')),
('SFX Lead', 75000.00, (SELECT id FROM departments WHERE name = 'Scenic')),
('House Manager', 75000.00, (SELECT id FROM departments WHERE name = 'Front of House')),
('Marketing Manager', 100000.00, (SELECT id FROM departments WHERE name = 'Marketing'));

-- Check the inserted roles
SELECT * FROM roles;

-- Insert sample data into employees
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES 
('Gary', 'Gonzales', (SELECT id FROM roles WHERE title = 'Sound Engineer'), NULL),
('Cora', 'Anderson', (SELECT id FROM roles WHERE title = 'Lighting Designer'), (SELECT id FROM employees WHERE first_name = 'Gary')),
('Mark', 'Buran', (SELECT id FROM roles WHERE title = 'Shop Master'), NULL),
('Sue', 'Carry', (SELECT id FROM roles WHERE title = 'Props Master'), (SELECT id FROM employees WHERE first_name = 'Mark')),
('Bobby', 'Johnson', (SELECT id FROM roles WHERE title = 'Makeup Artist'), (SELECT id FROM employees WHERE first_name = 'Sue')),
('Wren', 'Baker', (SELECT id FROM roles WHERE title = 'Hair Stylist'), (SELECT id FROM employees WHERE first_name = 'Bobby')),
('Barry', 'Smith', (SELECT id FROM roles WHERE title = 'Costume Manager'), (SELECT id FROM employees WHERE first_name = 'Wren')),
('Joe', 'Hamilton', (SELECT id FROM roles WHERE title = 'SFX Lead'), (SELECT id FROM employees WHERE first_name = 'Barry')),
('Tom', 'Holiday', (SELECT id FROM roles WHERE title = 'House Manager'), (SELECT id FROM employees WHERE first_name = 'Joe')),
('Sam', 'Crush', (SELECT id FROM roles WHERE title = 'Marketing Manager'), (SELECT id FROM employees WHERE first_name = 'Tom'));

COMMIT;

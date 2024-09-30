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

-- Check the inserted departments
SELECT * FROM departments;

-- Insert sample data into roles
INSERT INTO roles (title, salary, department_id) VALUES 
('Sound Engineer', 90000.00, 1),
('Lighting Designer', 90000.00, 2),
('Shop Master', 80000.00, 1),
('Props Master', 70000.00, 4),
('Makeup Artist', 60000.00, 5),
('Hair Stylist', 60000.00, 6),
('Costume Manager', 70000.00, 7),
('SFX Lead', 75000.00, 3),
('House Manager', 75000.00, 9),
('Marketing Manager', 100000.00, 10);

-- Check the inserted roles
SELECT * FROM roles;

-- Insert sample data into employees
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES 
('Gary', 'Gonzales', 1, NULL),
('Cora', 'Anderson', 2, 1),
('Mark', 'Buran', 3, NULL),
('Sue', 'Carry', 4, 3),
('Bobby', 'Johnson', 5, 4),
('Wren', 'Baker', 6, 5),
('Barry', 'Smith', 7, 6),
('Joe', 'Hamilton', 8, 7),
('Tom', 'Holiday', 9, 8),
('Sam', 'Crush', 10, 9);

COMMIT;

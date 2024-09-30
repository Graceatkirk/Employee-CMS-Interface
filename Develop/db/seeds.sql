-- Insert sample data into departments
INSERT INTO departments (name) VALUES ('Sales');
INSERT INTO departments (name) VALUES ('Engineering');
INSERT INTO departments (name) VALUES ('HR');

-- Insert sample data into roles
INSERT INTO roles (title, salary, department_id) VALUES ('Sales Manager', 80000.00, 1);
INSERT INTO roles (title, salary, department_id) VALUES ('Software Engineer', 100000.00, 2);
INSERT INTO roles (title, salary, department_id) VALUES ('HR Manager', 75000.00, 3);

-- Insert sample data into employees
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ('John', 'Doe', 1, NULL);
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ('Jane', 'Smith', 2, 1);
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ('Mark', 'Johnson', 3, NULL);

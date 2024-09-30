-- Create the departments table
CREATE TABLE departments (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

-- Create the roles table
CREATE TABLE roles (
  id SERIAL PRIMARY KEY,
  title VARCHAR(30) NOT NULL,
  salary DECIMAL(10, 2) NOT NULL,
  department_id INT REFERENCES departments(id) ON DELETE CASCADE
);

-- Create the employees table
CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT REFERENCES roles(id) ON DELETE CASCADE,
  manager_id INT REFERENCES employees(id) ON DELETE SET NULL
);

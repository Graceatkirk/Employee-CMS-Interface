import inquirer from 'inquirer';
import { Client } from 'pg';

const client = new Client({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: Number(process.env.DB_PORT),
});

client.connect();

export function viewDepartments() {
  client.query('SELECT * FROM departments', (err, res) => {
    if (err) throw err;
    console.table(res.rows);
    mainMenu();
  });
}

export function viewRoles() {
  client.query(`
    SELECT roles.id, roles.title, roles.salary, departments.name AS department 
    FROM roles 
    JOIN departments ON roles.department_id = departments.id
  `, (err, res) => {
    if (err) throw err;
    console.table(res.rows);
    mainMenu();
  });
}

export function viewEmployees() {
  client.query(`
    SELECT e.id, e.first_name, e.last_name, roles.title, departments.name AS department, roles.salary,
           CONCAT(m.first_name, ' ', m.last_name) AS manager
    FROM employees e
    JOIN roles ON e.role_id = roles.id
    JOIN departments ON roles.department_id = departments.id
    LEFT JOIN employees m ON e.manager_id = m.id
  `, (err, res) => {
    if (err) throw err;
    console.table(res.rows);
    mainMenu();
  });
}

export function addDepartment() {
  inquirer.prompt([
    {
      type: 'input',
      name: 'name',
      message: 'Enter the department name:',
    },
  ]).then((answer) => {
    client.query('INSERT INTO departments (name) VALUES ($1)', [answer.name], (err) => {
      if (err) throw err;
      console.log('Department added!');
      mainMenu();
    });
  });
}

export function addRole() {
  // Implementation for adding a role
}

export function addEmployee() {
  // Implementation for adding an employee
}

export function updateEmployeeRole() {
  // Implementation for updating an employee's role
}

function mainMenu() {
    throw new Error('Function not implemented.');
}


import inquirer from 'inquirer';
import express from 'express'; // Import the express module
import { query } from '../dist/connections'; // Import the query function from connections.js
const app = express();
const PORT = process.env.PORT || 3000;
// Middleware to parse JSON request bodies
app.use(express.json());
// Function to start the application
const startApp = async () => {
    const options = [
        'View all departments',
        'View all roles',
        'View all employees',
        'Add a department',
        'Add a role',
        'Add an employee',
        'Update an employee role',
        'Exit'
    ];
    const { option } = await inquirer.prompt([
        {
            type: 'list',
            name: 'option',
            message: 'Select an option:',
            choices: options,
        },
    ]);
    switch (option) {
        case 'View all departments':
            await viewDepartments();
            break;
        case 'View all roles':
            await viewRoles();
            break;
        case 'View all employees':
            await viewEmployees();
            break;
        case 'Add a department':
            await addDepartment();
            break;
        case 'Add a role':
            await addRole();
            break;
        case 'Add an employee':
            await addEmployee();
            break;
        case 'Update an employee role':
            await updateEmployeeRole();
            break;
        case 'Exit':
            console.log('Exiting application...');
            process.exit();
    }
    // Restart the app after handling the selected option
    startApp();
};
// Function to view all departments
const viewDepartments = async () => {
    const res = await query('SELECT * FROM departments;');
    console.table(res.rows);
};
// Function to view all roles
const viewRoles = async () => {
    const res = await query('SELECT * FROM roles;');
    console.log(res.rows); // Log the result to check the data
    if (res.rows.length > 0) {
        console.table(res.rows);
    }
    else {
        console.log('No roles found.');
    }
};
// Function to view all employees
const viewEmployees = async () => {
    const res = await query('SELECT * FROM employees;');
    console.log(res.rows); // Log the result to check the data
    if (res.rows.length > 0) {
        console.table(res.rows);
    }
    else {
        console.log('No employees found.');
    }
};
// Function to add a department
const addDepartment = async () => {
    const { departmentName } = await inquirer.prompt([
        {
            type: 'input',
            name: 'departmentName',
            message: 'Enter the name of the department:',
        },
    ]);
    await query('INSERT INTO departments (name) VALUES ($1);', [departmentName]);
    console.log(`Department ${departmentName} added successfully.`);
};
// Function to add a role
const addRole = async () => {
    const { roleName, salary, departmentId } = await inquirer.prompt([
        {
            type: 'input',
            name: 'roleName',
            message: 'Enter the name of the role:',
        },
        {
            type: 'input',
            name: 'salary',
            message: 'Enter the salary for this role:',
        },
        {
            type: 'input',
            name: 'departmentId',
            message: 'Enter the department ID for this role:',
        },
    ]);
    await query('INSERT INTO roles (title, salary, department_id) VALUES ($1, $2, $3);', [roleName, salary, departmentId]);
    console.log(`Role ${roleName} added successfully.`);
};
// Function to add an employee
const addEmployee = async () => {
    const { firstName, lastName, roleId, managerId } = await inquirer.prompt([
        {
            type: 'input',
            name: 'firstName',
            message: 'Enter the employee\'s first name:',
        },
        {
            type: 'input',
            name: 'lastName',
            message: 'Enter the employee\'s last name:',
        },
        {
            type: 'input',
            name: 'roleId',
            message: 'Enter the role ID for this employee:',
        },
        {
            type: 'input',
            name: 'managerId',
            message: 'Enter the manager ID for this employee (leave blank if none):',
        },
    ]);
    await query('INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ($1, $2, $3, $4);', [firstName, lastName, roleId, managerId || null]);
    console.log(`Employee ${firstName} ${lastName} added successfully.`);
};
// Function to update an employee's role
const updateEmployeeRole = async () => {
    const { employeeId, newRoleId } = await inquirer.prompt([
        {
            type: 'input',
            name: 'employeeId',
            message: 'Enter the ID of the employee to update:',
        },
        {
            type: 'input',
            name: 'newRoleId',
            message: 'Enter the new role ID for this employee:',
        },
    ]);
    await query('UPDATE employees SET role_id = $1 WHERE id = $2;', [newRoleId, employeeId]);
    console.log(`Employee ID ${employeeId} updated to role ID ${newRoleId} successfully.`);
};
// Start the application
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
    startApp(); // Start the inquirer prompt
});

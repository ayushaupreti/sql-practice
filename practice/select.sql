-- questions from https://www.w3resource.com/mysql-exercises/ 



-- Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"
SELECT first_name "First Name", last_name "Last Name" 
	FROM employees;
-- dont need AS for this

-- Write a query to get unique department ID from employee table
SELECT DISTINCT department_ID 
	FROM employees;

-- Write a query to get all employee details from the employee table order by first name, descending.
SELECT * 
	FROM employees 
    ORDER BY first_name DESC;

-- Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary)
SELECT first_name, last_name, salary, salary*0.15 PF 
	FROM employees;

-- Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary
SELECT employee_ID, first_name, last_name, salary 
	FROM employees 
	ORDER BY salary;

-- Write a query to get the total salaries payable to employees
SELECT SUM(salary) 
	FROM employees;

-- Write a query to get the maximum and minimum salary from employees table
SELECT MIN(salary) min, MAX(salary) max 
	FROM employees;

-- Write a query to get the average salary and number of employees in the employees table
SELECT AVG(salary), COUNT(*) 
	FROM employees;

-- Write a query to get the number of employees working with the company
SELECT COUNT(*) 
	FROM employees;

-- Write a query to get the number of jobs available in the employees table
SELECT COUNT(DISTINCT job_ID) 
	FROM employees;

-- Write a query get all first name from employees table in upper case.
SELECT UPPER(first_name) 
	FROM employees;

-- Write a query to get the first 3 characters of first name from employees table
-- SELECT SUBSTRING(first_name,1,3) FROM employees;

-- Write a query to calculate 171*214+625.
SELECT 171*214+625;

-- Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table.
SELECT CONCAT(first_name, ' ', last_name) 
	FROM employees;

-- Write a query to get first name from employees table after removing white spaces from both side.
-- SELECT TRIM(first_name) FROM employees;

-- Write a query to check if the first_name fields of the employees table contains numbers.
-- SELECT * FROM employees WHERE first_name REGEXP '[0-9]';

-- Write a query to select first 10 records from a table
SELECT * 
	FROM employees 
    LIMIT 10;






-- Write a query to display the name (first_name, last_name) and salary for 
-- 		all employees whose salary is not in the range $10,000 through $15,000
SELECT first_name, last_name, salary 
	FROM employees 
    WHERE salary NOT BETWEEN 10000 AND 15000;

-- Write a query to display the name (first_name, last_name) and department ID of all employees 
-- 		in departments 30 or 100 in ascending order.
SELECT first_name, last_name, department_ID 
	FROM employees 
    WHERE department_ID = 30 OR department_ID = 100 
    ORDER BY department_ID;
-- can also do 'WHERE department_ID IN (30, 100)'

-- Write a query to display the name (first_name, last_name) and salary for all employees whose 
-- 		salary is not in the range $10,000 through $15,000 and are in department 30 or 100
SELECT first_name, last_name, salary 
	FROM employees 
    WHERE salary NOT BETWEEN 10000 AND 15000 
    AND department_ID IN (30, 100);

-- Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987.
SELECT first_name, last_name, hire_date 
	FROM employees 
    WHERE hire_date = 1987;

-- Write a query to display the first_name of all employees who have both "b" and "c" in their first name
SELECT first_name 
	FROM employees 
    WHERE first_name LIKE "%b%" 
    AND first_name LIKE "%c%";

-- Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer 
-- 		or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000
SELECT last_name, job_ID, salary 
	FROM employees 
    WHERE job_ID IN ('IT_PROG', 'SH_CLERK') 
    AND salary NOT IN (4500, 10000, 15000);

-- Write a query to display the last name of employees whose names have exactly 6 characters.
SELECT last_name 
	FROM employees 
    WHERE last_name LIKE "______";

-- Write a query to display the last name of employees having 'e' as the third character.
SELECT last_name 
	FROM employees 
    WHERE last_name LIKE "__e%";

-- Write a query to display the jobs/designations available in the employees table
SELECT DISTINCT job_ID 
	FROM employees;

-- Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.
SELECT * 
	FROM employees 
    WHERE last_name IN ('BLAKE', 'SCOTT', 'KING', 'FORD');






-- Write a query to get the maximum salary of an employee working as a Programmer
SELECT MAX(salary) 
	FROM employees 
    WHERE job_ID = 'IT_PROG';

-- Write a query to get the average salary and number of employees working the department 90
SELECT AVG(salary), COUNT(*) 
	FROM employees 
    WHERE department_ID = 90;

-- Write a query to get the number of employees with the same job.
-- SELECT job_id, COUNT(*) FROM employees GROUP BY job_id;

-- Write a query to get the difference between the highest and lowest salaries.
SELECT MAX(salary)-MIN(salary) 
	FROM employees;

-- Write a query to find the manager ID and the salary of the lowest-paid employee for that manager
SELECT manager_ID, MIN(salary) 
	FROM employees 
    GROUP BY manager_ID;
-- SELECT manager_id, MIN(salary) FROM employees WHERE manager_id IS NOT NULL GROUP BY manager_id ORDER BY MIN(salary) DESC;

-- Write a query to get the department ID and the total salary payable in each department.
SELECT department_ID, SUM(salary) 
	FROM employees 
    GROUP BY department_ID;

-- Write a query to get the average salary for each job ID excluding programmer.
SELECT job_id, AVG(salary) 
	FROM employees 
    WHERE job_ID <> 'IT_PROG'; 
    -- (GROUP BY job_ID)????

-- Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
-- SELECT job_id, MAX(salary) FROM employees GROUP BY job_id HAVING MAX(salary) >= 4000;

-- Write a query to get the average salary for all departments employing more than 10 employees
SELECT AVG(salary) 
	FROM employees 
    GROUP BY department_ID 
    HAVING COUNT(*) >= 10;






-- Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
SELECT location_id, street_address, city, state_province, country_name 
	FROM locations 
    NATURAL JOIN countries;

-- Write a query to find the name (first_name, last name), department ID and name of all the employees
SELECT first_name, last_name, department_ID, department_name 
	FROM employees 
    INNER JOIN departments 
    ON employees.department_ID = departments.department_ID;
    
-- Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
-- SELECT e.first_name, e.last_name, e.job_id, e.department_id, d.department_name 
	-- FROM employees e 
	-- JOIN departments d 
	-- ON (e.department_id = d.department_id) 
	-- JOIN locations l ON 
	-- (d.location_id = l.location_id) 
	-- WHERE LOWER(l.city) = 'London';

-- Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
-- SELF JOIN!!!!!
SELECT e.last_name 'EMPLOYEE', e.employee_ID 'EMPLOYEE ID', m.last_name 'MANAGER', m.employee_ID 'MANAGER ID'
	FROM employees e
    CROSS JOIN employees m
    ON e.manager_ID = m.employee_ID;
    
-- Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'
SELECT e.first_name, e.last_name, e.hire_date
	FROM employees e
    CROSS JOIN employees jones
    ON jones.last_name = 'Jones'
    WHERE jones.hire_date < e.hire_date;
    
-- Write a query to get the department name and number of employees in the department
SELECT d.department_ID, COUNT(*)
	FROM employees e
    INNER JOIN departments d
    ON e.department_ID = d.department_ID
    GROUP BY department_ID;

-- Write a query to display the department ID and name and first name of manager.
SELECT e.department_ID, e.first_name, e.last_name
	FROM employees e
    INNER JOIN departments d
    ON d.manager_ID = e.employee_ID;
	
-- Write a query to display the department name, manager name, and city
SELECT d.department_name, e.first_name, l.city
	FROM employees e
    INNER JOIN departments d ON e.employee_ID = d.manager_ID
    INNER JOIN locations l ON l.location_ID = d.location_ID;







-- Write a query to find the name (first_name, last_name) and the salary of the employees 
-- 		who have a higher salary than the employee whose last_name='Bull'.
SELECT first_name, last_name, salary
	FROM employees
    WHERE salary > (SELECT salary FROM employees WHERE last_name="Bull");
    
-- Write a query to find the name (first_name, last_name) of all employees who works in the IT department.
SELECT first_name, last_name
	FROM (SELECT * FROM employees WHERE job_id='IT_PROG');
    
-- Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department.
-- SELECT first_name, last_name FROM employees 
	-- WHERE manager_id in (select employee_id 
	-- FROM employees WHERE department_id 
	-- IN (SELECT department_id FROM departments WHERE location_id 
	-- IN (select location_id from locations where country_id='US')));
    
-- Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.
SELECT first_name, last_name, salary
	FROM employees 
    WHERE salary > (SELECT AVG(salary) FROM employees);

-- Write a query to find the name (first_name, last_name), and salary of the employees whose salary is 
-- 		equal to the minimum salary for their job grade.
SELECT e.first_name, e.last_name, e.salary
	FROM employees e
    INNER JOIN jobs j ON j.job_ID = e.job_ID
    WHERE e.salary = j.min_salary;
-- SELECT first_name, last_name, salary 
	-- FROM employees 
	-- WHERE employees.salary = (SELECT min_salary
	-- FROM jobs
	-- WHERE employees.job_id = jobs.job_id);


-- Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.
SELECT first_name, last_name, salary
	FROM employees 
    WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Bell');

















--Q1: List the employee number, last name, first name, sex, and salary of each employee.

CREATE VIEW question_one AS
SELECT 
	employees.emp_no,
	employees.first_name,
	employees.last_name,
	salaries.salary,
	employees.sex
FROM employees
INNER JOIN salaries ON
	employees.emp_no = salaries.emp_no;
	
SELECT *
FROM question_one



--Q2: List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT 
	employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees
WHERE hire_date LIKE '%1986'




--Q3: List the manager of each department along with their department number, department name, employee number, last name, and first name.

CREATE VIEW dept_name_manager AS
SELECT 
	departments.dept_name,
	dept_manager.emp_no,
	dept_manager.dept_no
FROM departments
LEFT JOIN dept_manager ON 
	dept_manager.dept_no = departments.dept_no
	
SELECT *
FROM dept_name_manager
	
SELECT 
	employees.emp_no,
	employees.first_name,
	employees.last_name,
	dept_name_manager.dept_name,
	dept_name_manager.dept_no
FROM dept_name_manager
LEFT JOIN employees ON 
	dept_name_manager.emp_no = employees.emp_no




--Q4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

CREATE VIEW employee_deptno AS
SELECT 
	employees.emp_no,
	employees.first_name,
	employees.last_name,
	dept_emp.dept_no
FROM employees
LEFT JOIN dept_emp ON
	dept_emp.emp_no = employees.emp_no

CREATE VIEW emp_with_dept AS
SELECT
	employee_deptno.emp_no,
	employee_deptno.first_name,
	employee_deptno.last_name,
	employee_deptno.dept_no,
	departments.dept_name
FROM employee_deptno
LEFT JOIN departments ON
	departments.dept_no = employee_deptno.dept_no
	


--Q5: List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT
	first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';



--Q6: List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
	emp_no,
	first_name,
	last_name
FROM emp_with_dept
WHERE dept_name = 'Sales';



--Q7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	emp_no,
	first_name,
	last_name,
	dept_name
FROM emp_with_dept
WHERE dept_name = 'Sales' OR dept_name = 'Development';


--Q8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS Employees_Lastname_Counts
FROM employees
GROUP BY last_name 
ORDER BY Employees_Lastname_Counts DESC










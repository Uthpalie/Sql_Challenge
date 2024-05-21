CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30)
);

SELECT *
FROM departments


CREATE TABLE employees(
	emp_no VARCHAR(6) NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(30),
	birth_date VARCHAR(10),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(1),
	hire_date VARCHAR(10)
);

SELECT *
FROM employees


CREATE TABLE dept_emp (
    emp_no VARCHAR(6) NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT *
FROM dept_emp


CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no VARCHAR(6) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT *
FROM dept_manager

CREATE TABLE salaries(
	emp_no VARCHAR(6) NOT NULL PRIMARY KEY,
	salary INT(10)
);

SELECT *
FROM salaries

CREATE TABLE titles(
	title_id VARCHAR(6) NOT NULL PRIMARY KEY,
	title VARCHAR(30)
);

SELECT *
FROM titles

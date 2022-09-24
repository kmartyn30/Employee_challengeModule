--Creating tables for PH-=EmployeeDB
CREATE TABLE departments(
	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE(dept_name)
);
 
CREATE TABLE employees (
	emp_no INT NOT NUll,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_managers(
dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no)REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
 	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no) 
);

CREATE TABLE dept_employees(
dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no)REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

SELECT*FROM departments;

--Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;



	-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');





	
FROM employyes 
	
-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
	dept_employees.to_date
FROM retirement_info
LEFT JOIN dept_employees
ON retirement_info.emp_no = dept_employees.emp_no;
	
	
SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_employees as de
ON ri.emp_no = de.emp_no;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date	 
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_employees as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_employees as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM salaries;

SELECT * FROM salaries
ORDER BY to_date DESC;

--Employees born and hired at the correct time 
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT emp_no,
	first_name
last_name,
	gender
INTO emp_info
FROM employees
WHERE(birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31'); 



--List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);














SELECT e.emp_no,
    e.first_name,
e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_employees as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');



CREATE TABLE unique_titles(
dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no)REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);


--Use Distinct with orderby to remove duplicate rows	 
SELECT DISTINCT ON (retirement_title)
	retirement_title.emp_no,
	retirement_titel.first_name,
	retirement_title.last_name,
	retirement_title.title,
INTO unique_titles
FROM retirement_title
WHERE(de.to_date = '9999-01-01');
ORDER BY last_date DESC




CREATE TABLE dept_employees(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL
);


--UNIQUE TITLES DIS 1
CREATE TABLE unique_titles(
	emp_no INT NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	title VARCHAR NOT NULL
);
SELECT rt.emp_no,rt.first_name,rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_title as rt
INNER JOIN titles 
ON rt.emp_no = titles.emp_no
WHERE (titles.to_date = '9999-01-01');

SELECT DISTINCT * FROM unique_titles
ORDER BY emp_no ASC, to_date DESC;

-- RETIRING TITLES delilvery 1

--CREATE TABLE retiring_titles(
--	title VARCHAR(50) NOT NULL
--);
--Count by title from unique titles to create retiring titles 
SELECT COUNT (ut.title) as counttitle,ut.title
INTO retiring_titles
FROM unique_titles as ut 
GROUP BY ut.title
ORDER BY counttitle DESC;

SELECT * FROM retiring_titles
SELECT * from unique_titles

CREATE TABLE mentorship_eligibility(
	emp_no INT NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	birth_date INT NOT NULL,
	titles VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  	PRIMARY KEY (emp_no)
);
	

SELECT e.emp_no,e.first_name,e.last_name,e.birth_date,
	de.from_date,
	de.to_date,
 	t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_employees as de
ON e.emp_no = de.emp_no
-- LEFT JOIN employees
-- ON e.emp_no = de.emp_no
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	And (de.to_date = '9999-01-01');

--SELECT DISTINCT emp_no
--ON (emp_no)
Select * from titles

SELECT* FROM mentorship_eligibility
--ORDER BY emp_no ASC

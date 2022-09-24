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

CREATE TABLE retiring_titles(
	title VARCHAR(50) NOT NULL
);
--Count by title from unique titles to create retiring titles 
SELECT COUNT (ut.title), rit.title
FROM unique_titles as ut 
INNER JOIN retiring_titles as rit
ON ut.title = rit.title
GROUP BY rit.title
ORDER BY rit.title DESC;

SELECT * FROM retiring_titles


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
LEFT JOIN employees
ON e.emp_no = de.emp_no
INNER JOIN titles as t
ON e.emp_no = t.emp_no
--WHERE(birth_date BETWEEN '1965-01-01' AND '1965-12-31')

--SELECT DISTINCT emp_no
--ON (emp_no)


SELECT* FROM mentorship_eligibility
--ORDER BY emp_no ASC

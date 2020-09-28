-- 1. Employee info plus salary
CREATE VIEW employee_salaries AS
	SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
	FROM employees AS e
	JOIN salaries as s ON e.emp_no = s.emp_no;
SELECT * FROM employee_salaries;

-- 2. Employees hired in 1986
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'
ORDER BY hire_date;

-- 3. Manager names and departments
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_mgr AS dm
	LEFT JOIN depts AS d ON dm.dept_no = d.dept_no
	LEFT JOIN employees AS e ON dm.emp_no = e.emp_no
ORDER BY dept_no;

-- 4. Employee departments
CREATE VIEW employee_departments AS
	SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM employees AS e
		LEFT JOIN emp_dept AS ed ON e.emp_no = ed.emp_no
		LEFT JOIN depts as d ON ed.dept_no = d.dept_no;
SELECT * FROM employee_departments
	ORDER BY emp_no;

-- 5. Hercules B.
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. Employees in Sales
SELECT * FROM employee_departments
WHERE dept_name = 'Sales'
ORDER BY emp_no;

-- 7. Employees in Sales and Development
SELECT * FROM employee_departments
WHERE dept_name = 'Sales' OR dept_name = 'Development'
ORDER BY emp_no;

-- 8. Employee last names
SELECT last_name, count(last_name) FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC, last_name;

-- Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id.
CREATE TABLE countries (
	country_id int NOT NULL,
    country_name varchar(200) NOT NULL,
    region_id int NOT NULL
);

-- Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id which is already exists.
CREATE TABLE IF NOT EXISTS countries (
	country_id int NOT NULL,
    country_name varchar(200) NOT NULL,
    region_id int NOT NULL
);

-- Write a SQL statement to create the structure of a table dup_countries similar to countries.
-- HAD PROBLEM WITH THIS
CREATE TABLE dup_countries LIKE countries;

-- Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_countries.
CREATE TABLE IF NOT EXISTS dup_countries AS SELECT * FROM countries;

-- Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary 
-- 		and check whether the max_salary amount exceeding the upper limit 25000.
CREATE TABLE jobs (
	job_id int NOT NULL,
    job_title varchar(500) NOT NULL,
    min_salary int NOT NULL,
    max_salary int NOT NULL CHECK (max_salary <= 25000)
);

-- Write a SQL statement to create a table named countries including columns country_id, country_name and region_id 
-- 		and make sure that no countries except Italy, India and China will be entered in the table.
CREATE TABLE IF NOT EXISTS countries (
	country_id int NOT NULL,
    country_name varchar(200) NOT NULL CHECK (country_name IN ('Italy', 'India', 'China')),
    region_id int NOT NULL
);

-- Write a SQL statement to create a table named job_histry including columns employee_id, start_date, end_date, job_id and department_id and make 
-- 		sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.
CREATE TABLE job_history (
	employee_id int NOT NULL,
    start_date varchar(500) NOT NULL,
    end_date varchar(500) NOT NULL CHECK (end_date LIKE '--/--/----'),
    job_id int NOT NULL,
    department_id int NOT NULL
);














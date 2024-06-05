-- just to connect to DB
SELECT * FROM EMPLOYEES;

/*
    AGGREGATE FUNCTIONS - MULTI ROWS - GROUP FUNCTIONS
    - count --> it will count rows
    - max --> it will return max value
    - min --> it will return min value
    - sum --> it will return total value
    -- avg --> it will return average value

    Aggregate functions takes multi row and return one result
    All of them ignore null values.
 */

-- how many departments we have?
SELECT * FROM DEPARTMENTS;
SELECT COUNT(*) FROM DEPARTMENTS;

-- How many locations we have?
SELECT * FROM LOCATIONS;
SELECT COUNT(*) FROM LOCATIONS;

SELECT * FROM EMPLOYEES;

--null values -- Kimberly will be excluded bc has NO Department id yet
SELECT COUNT(DEPARTMENT_ID)
FROM EMPLOYEES;

-- how many different firstname we have?
select count(DISTINCT FIRST_NAME) from EMPLOYEES;

--how many employees working as IT_PROG or SA_REP
SELECT count(*) from EMPLOYEES
WHERE JOB_ID IN('IT_PROG','SA_REP');

--max
SELECT MAX(SALARY)
FROM EMPLOYEES;

--min
SELECT MIN(SALARY)
FROM EMPLOYEES;

--avg
SELECT AVG(SALARY)
FROM EMPLOYEES;

--rounding result
SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES;
SELECT ROUND(AVG(SALARY),1) FROM EMPLOYEES;
SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEES;
SELECT ROUND(AVG(SALARY),3) FROM EMPLOYEES;
SELECT ROUND(AVG(SALARY),4) FROM EMPLOYEES;

--SUM
SELECT sum(SALARY) FROM EMPLOYEES;
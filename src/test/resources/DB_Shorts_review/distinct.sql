/*

 DISTINCT --> Display only different/unique values from result. Original data still stays in database

 */

select FIRST_NAME from EMPLOYEES;
select distinct (FIRST_NAME) from EMPLOYEES;

select SALARY from EMPLOYEES;
select distinct (SALARY) from EMPLOYEES;
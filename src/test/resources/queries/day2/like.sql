/*
    - Percent  % --> for matching any sequence of characters. (0 or more)
    - underscore _ --> for matching any single character.

    -contains
    -startswith
    -endswith

 */

--display all employees where first_name startswith S
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%';

--display all employees where firstname startswith N and length of it 5 letter
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'N____';

--display 5 letter firstname from employees where middle char is e
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME like '__e__';

--display firstname endswith 'e';
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME like '%e';

--display all employees where job id contains IT
SELECT * FROM EMPLOYEES
WHERE JOB_ID LIKE '%IT%';

--display all information where firstname startswith B and ending with e
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'B%e';
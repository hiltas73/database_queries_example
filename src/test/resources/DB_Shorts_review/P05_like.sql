/*

 LIKE
    Wild card characters -> '%' percent and '_' underscore
    - Percent ( % ) for matching any sequence of characters. (0 or more )
    - Underscore ( _ ) for matching any single character.

    We apply:
    - contains
    - startswith
    - endswith
        logic using wild card characters.

*/


-- STARTS WITH
-- Get me all countries where country_name starts with 'A';
select * from countries
where country_name like 'A%';


-- ENDS WITH
-- Get me all countries where country_name ends with 'a';
select * from countries
where country_name like '%a';


-- STARTS WITH  & ENDS WITH
-- Get me all countries where country_name starts with  'A' and ends with 'a';
select * from countries
where country_name like 'A%a';

-- Get me all countries where country_name starts with  'A' OR ends with 'a';
select * from countries
where country_name like 'A%' or country_name like '%a';


-- CONTAINS
-- Get All country names where country names contains 'b'
select * from countries
where country_name like '%ba%';


-- Get me all countries where country names ends with 'a' and 6 letter
select * from countries
where country_name like '_____a';

-- Get me all countries where country names 5th letter is a
select * from countries
where country_name like '____a%';
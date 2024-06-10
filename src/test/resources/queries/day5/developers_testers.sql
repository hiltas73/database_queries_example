select * from EMPLOYEES;

create table DeveloperTeam(
                           Id_Number Integer primary key,
                           Names varchar(30),
                           Salary Integer
);

select * from DeveloperTeam;

create table TesterTeam(
                        Id_Number Integer primary key,
                        Names varchar(30),
                        Salary Integer
);
select * from TesterTeam;

insert into DeveloperTeam values (1, 'Mike', 155000);
insert into DeveloperTeam values (2, 'John', 142000);
insert into DeveloperTeam values (3, 'Steven', 850000);
insert into DeveloperTeam values (4, 'Maria', 120000);
insert into TesterTeam values (1, 'Steven', 110000);
insert into TesterTeam values(2, 'Adam', 105000);
insert into TesterTeam values (3, 'Lex', 100000);

commit work;

SELECT* FROM DeveloperTeam;

SELECT * FROM TesterTeam;

/*
 UNION
 - to merge more than one table vertically
 - Remove DUPLICATES
 - Make an order as default asc
 */
SELECT * FROM DeveloperTeam
UNION
SELECT * FROM TesterTeam;

SELECT NAMES FROM DeveloperTeam
UNION
SELECT NAMES FROM TesterTeam;

/*
 UNION ALL
 - NOT Remove DUPLICATES
 - NOT Sort the results
 */

SELECT * FROM DeveloperTeam
UNION ALL
SELECT * FROM TesterTeam;


--wrong data type example (will not work)
SELECT Id_Number,Names FROM DeveloperTeam
UNION ALL
SELECT Names,Salary FROM TesterTeam;

/*
MINUS
 It removes same data from first table and gives result from first table
    It gives us whatever unique in the first query compared to the 2nd one

 */

SELECT NAMES FROM DeveloperTeam
    MINUS
SELECT NAMES FROM TesterTeam;

SELECT NAMES FROM TesterTeam
    MINUS
SELECT NAMES FROM DeveloperTeam;

--INTERSECT
SELECT NAMES FROM TesterTeam
INTERSECT
SELECT NAMES FROM DeveloperTeam;

SELECT NAMES FROM DeveloperTeam
INTERSECT
SELECT NAMES FROM TesterTeam;
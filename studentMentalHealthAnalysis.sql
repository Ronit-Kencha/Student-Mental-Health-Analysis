SELECT * 
FROM STUDENTS;

/*Showing how many records there are in the database and how many of them are international/domestic/empty*/
SELECT COUNT(*) AS total_records
FROM students;

SELECT COUNT(*) AS international_records
FROM students
WHERE inter_dom = 'Inter';

SELECT COUNT(*) AS domestic_records
FROM students
WHERE inter_dom = 'Dom';

SELECT COUNT(*) AS null_records
FROM students
WHERE inter_dom IS NULL;

/*Data for different types of students and how it differs*/
SELECT *
FROM students
WHERE inter_dom = 'Inter';

SELECT *
FROM students
WHERE inter_dom = 'Dom';

SELECT *
FROM students
WHERE inter_dom IS NULL;

/*Find the summary statistics of the diagnostic tests for all students using aggregate functions, 
rounding the test scores to two decimal places, and remembering to use aliases. 
To do this, we will get the minimum, maximum and average values(rounding to two decimal places) of tosc,toas and todep*/
SELECT MIN(toSC) AS min_tosc
FROM students;

SELECT MAX(toSC) AS max_tosc
FROM students;

SELECT ROUND(AVG(toSC), 2) AS avg_tosc
FROM students;

SELECT MIN(toAS) AS min_toas
FROM students;

SELECT MAX(toAS) AS max_toas
FROM students;

SELECT ROUND(AVG(toAS), 2) AS avg_toas
FROM students;

SELECT MIN(toDep) AS min_todep
FROM students;

SELECT MAX(toDep) AS max_todep
FROM students;

SELECT ROUND(AVG(toDep), 2) AS avg_todep
FROM students;

/*Summarize the data for international students only. See if the length of stay impacts the average diagnostic scores rounded to two decimal places
for international students, and order the results in descending order of the length of stay.*/
SELECT stay, ROUND(AVG(toSC),2) AS avg_tosc, ROUND(AVG(toAS),2) AS avg_toas, ROUND(AVG(toDep),2) AS avg_toDep
FROM students
WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY stay DESC;
/*There was a strong positive correlation between the length of stay and the score for depression.*/

SELECT region, COUNT(*)
FROM students
WHERE inter_dom = 'Inter'
GROUP BY region;

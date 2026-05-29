SELECT salary as second_highest_salary
FROM employee
ORDER BY salary DESC
offset 1 limit 1;

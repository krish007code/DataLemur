SELECT
  e.employee_id,
  e.name as employee_name
FROM employee as e LEFT JOIN employee as m
on e.manager_id = m.employee_id
WHERE e.salary > m.salary;

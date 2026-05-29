SELECT
  department_name, name, salary
from(
SELECT
  e.name as name,
  e.employee_id,
  e.department_id,
  d.department_name as department_name,
  e.salary as salary,
  DENSE_RANK() OVER(PARTITION BY d.department_name ORDER BY e.salary DESC) as rnk
  FROM employee as e left outer join department as d
  ON e.department_id = d.department_id
) as subq 
WHERE rnk < 4
ORDER BY department_name ASC, salary DESC, name ;

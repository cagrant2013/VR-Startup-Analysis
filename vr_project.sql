-- examine employees and projects tables
SELECT *
FROM employees;

SELECT *
FROM projects;

-- able to perform join on employees.current_project and projects.project_id

-- determine projects not chosen an employee

SELECT project_name
FROM projects
WHERE project_id NOT IN (
  SELECT current_project
  FROM employees
  WHERE current_project IS NOT NULL);

-- determine projects chosen by most employees

SELECT p.project_name
FROM projects AS p
INNER JOIN employees AS e
  ON p.project_id = e.current_project
WHERE current_project IS NOT NULL
GROUP BY current_project
HAVING COUNT(current_project) > 1;

-- determine how many available positions ther are for developers and if we have enough to fill the needed positions (each project requires 2 developers)
SELECT (COUNT(*) * 2) -
(
  SELECT COUNT(*)
  FROM employees
  WHERE current_project IS NOT NULL
    AND position = 'Developer') AS 'Count'
FROM projects;

-- Working with personality type column: 

-- determine which personality is the most common among employees

SELECT personality
FROM employees
GROUP BY personality
ORDER BY COUNT(1) DESC
LIMIT 1;

-- determine the personality type most represented by employees with a selected project

SELECT e.last_name, e.first_name, e.personality, p.project_name
FROM employees AS e
INNER JOIN projects as p
  ON e.current_project = p.project_id
WHERE personality = (
   SELECT personality 
   FROM employees
   WHERE current_project IS NOT NULL
   GROUP BY personality
   ORDER BY COUNT(personality) DESC
   LIMIT 1);

-- For each employee, provide their name, personality, the names of any projects they’ve chosen, and the number of incompatible co-workers.

SELECT last_name, first_name, personality, project_name,
CASE 
   WHEN personality = 'INFP' 
   THEN (SELECT COUNT(*)
      FROM employees 
      WHERE personality IN ('ISFP', 'ESFP', 'ISTP', 'ESTP', 'ISFJ', 'ESFJ', 'ISTJ', 'ESTJ'))
   WHEN personality = 'ISFP' 
   THEN (SELECT COUNT(*)
      FROM employees 
      WHERE personality IN ('INFP', 'ENTP', 'INFJ'))
   ELSE 0
END AS 'IMCOMPATIBLE'
FROM employees
LEFT JOIN projects on employees.current_project = projects.project_id;
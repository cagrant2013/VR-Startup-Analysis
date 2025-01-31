🎮 VR Startup Data Analysis – SQL Project

Overview

This project focuses on analyzing key business metrics for a Virtual Reality (VR) startup using SQL. It explores employee assignments, project selection trends, and personality compatibility within a VR startup. By querying employee and project data, we gain insights into project participation, developer staffing needs, and team dynamics.

Dataset

The analysis is based on two key tables:

employees: Contains details about employees, including their current project and personality type.

projects: Lists available projects and their unique identifiers.


Key Insights
1. Unselected Projects – Identifies projects that have not been chosen by any employees.
2. Popular Projects – Determines which projects have the highest participation.
3. Developer Staffing Analysis – Calculates if there are enough developers to meet project demands.
4. Personality Trends – Finds the most common employee personality type.
5. Personality & Project Alignment – Determines which personality type is most represented in assigned projects.
6. Team Compatibility – Evaluates the number of potentially incompatible co-workers based on personality types.


The queries used in this project include:

JOIN operations to combine employee and project data.
GROUP BY and HAVING clauses to analyze participation trends.
SUBQUERIES to filter personality-based insights.
CASE statements to assess personality compatibility.

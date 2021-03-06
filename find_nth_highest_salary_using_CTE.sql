WITH RESULT
AS (
	SELECT SALARY
		,DENSE_RANK() OVER (
			ORDER BY SALARY DESC
			) AS DENSERANK
	FROM EMPLOYEES
	)
SELECT TOP 1 SALARY
FROM RESULT
WHERE DENSERANK = N

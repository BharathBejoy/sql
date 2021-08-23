SELECT TOP 1 SALARY
FROM (
	SELECT DISTINCT TOP N SALARY
	FROM EMPLOYEES
	ORDER BY SALARY DESC
	) RESULT
ORDER BY SALARY
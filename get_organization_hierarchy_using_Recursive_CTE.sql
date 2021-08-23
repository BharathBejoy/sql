DECLARE @ID INT;

SET @ID = 7; -- Emp-ID

WITH EmployeeCTE
AS (
	SELECT EmployeeId
		,EmployeeName
		,ManagerID
	FROM Employees
	WHERE EmployeeId = @ID

	UNION ALL

	SELECT Employees.EmployeeId
		,Employees.EmployeeName
		,Employees.ManagerID
	FROM Employees
	JOIN EmployeeCTE ON Employees.EmployeeId = EmployeeCTE.ManagerID
	)
SELECT E1.EmployeeName
	,ISNULL(E2.EmployeeName, 'No Boss') AS ManagerName
FROM EmployeeCTE E1
LEFT JOIN EmployeeCTE E2 ON E1.ManagerID = E2.EmployeeId

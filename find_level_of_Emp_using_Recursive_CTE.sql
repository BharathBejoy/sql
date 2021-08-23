WITH EmployeesCTE (
	EmployeeId
	,Name
	,ManagerId
	,[Level]
	)
AS (
	SELECT EmployeeId
		,Name
		,ManagerId
		,1
	FROM tblEmployee
	WHERE ManagerId IS NULL

	UNION ALL

	SELECT tblEmployee.EmployeeId
		,tblEmployee.Name
		,tblEmployee.ManagerId
		,EmployeesCTE.[Level] + 1
	FROM tblEmployee
	JOIN EmployeesCTE ON tblEmployee.ManagerID = EmployeesCTE.EmployeeId
	)
SELECT EmpCTE.Name AS Employee
	,Isnull(MgrCTE.Name, 'Super Boss') AS Manager
	,EmpCTE.[Level]
FROM EmployeesCTE EmpCTE
LEFT JOIN EmployeesCTE MgrCTE ON EmpCTE.ManagerId = MgrCTE.EmployeeId

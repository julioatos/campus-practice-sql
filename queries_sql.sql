select * from Company;
go
select * from Employees
go
select * from Projects where FinishedOn <= Deadline 
go
select * from Projects where StartDate <= GETDATE()
go
select * from Employees where Salary > 10000;
go
select 
	Employees.FirstName,
	Employees.LastName,
	Employees.Email,
	Employees.Phone,
	Employees.Salary,
	Company.Name as Company
from Employees
inner join Company on Employees.CompanyId != 3 AND Employees.CompanyId = Company.Id;
go
select 
	Employees.FirstName,
	Employees.LastName,
	Employees.Email,
	Employees.Phone,
	Employees.Salary,
	Company.Name as Company
from Employees 
inner join Company on Employees.CompanyId = Company.Id order by Company,Employees.LastName;

go
select 
	e.FirstName,
	e.LastName,
	e.Email,
	e.Phone,
	e.Salary,
	p.Name as Project,
	s.Name as Status

from EmployeesProjects ep

Inner join Employees e on ep.EmployeeId = e.Id
Inner join Projects p on ep.ProjectId = p.Id
inner join Status s on p.StatusId = s.Id WHERE p.StatusId != 1 AND p.StatusId != 2;
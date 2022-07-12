create function GetLastProjetIdByEmployeeName(@EmployeeName varchar)
	returns int
as
begin
	declare @ret int;
	declare @employeeId int;
	declare @projectId int;

	select @employeeId = Id from Employees where Employees.FirstName = @EmployeeName;
	select @projectId = 

	 p.Id from EmployeesProjects ep
	inner join Projects p on ep.ProjectId = p.Id and ep.EmployeeId = @employeeId  and p.StartDate 
	in (select max(p.StartDate) from EmployeesProjects ep inner join Projects p on ep.ProjectId = p.Id and ep.EmployeeId = @employeeId)

	select @ret = @projectId;
	if(@ret is null) set @ret = 0;
	return @ret;
end;
create function GetLastProjetIdByEmployeeName(@EmployeeName varchar(max))
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

create function HasAnyProject(
	@EmployeeName as varchar(max)
)
returns bit
as
begin
	declare @projectsCount int;
	declare @epId int;

	select @epId = Id from Employees where FirstName = @EmployeeName;
	select @projectsCount =

		  COUNT(*) from EmployeesProjects ep inner join Projects p on ep.ProjectId = p.Id where ep.EmployeeId = @epId;

	if(@projectsCount > 1) return 1
	return 0
end;
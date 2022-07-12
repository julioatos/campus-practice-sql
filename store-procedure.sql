create procedure AddEmployeeToProjectAndRemoveFromOtherProjects(@companyName varchar(max), @projectName varchar(max))
as
	declare @companyId int;
	declare @employeeId int;
	declare @employeeName varchar(max);

	declare @projectId int;
	declare @employeeProjectsCount int;
	declare @hasAnyProject bit;

	
	select @companyId = Id from Company where Name = @companyName;
	select @projectId = Id from Projects where Name = @projectName;

	Declare Company_Cursor CURSOR FOR
		Select distinct e.Id,e.FirstName from Company c inner join Employees e on e.CompanyId = @companyId;

	Open Company_Cursor

	FETCH NEXT From Company_Cursor INTO @employeeId, @employeeName

	while @@FETCH_STATUS = 0
	begin
		select @hasAnyProject =  dbo.HasAnyProject(@employeeName);
		if(@hasAnyProject = 1)
		begin
			delete from EmployeesProjects where EmployeeId = @employeeId
			insert into EmployeesProjects values (@employeeId, @projectId);
		end
		else 
		begin 
		insert into EmployeesProjects values (@employeeId, @projectId); 
		end 
		FETCH NEXT FROM Company_Cursor INTO
			@employeeId, @employeeName
	end
	close Company_Cursor
	DEALLOCATE Company_Cursor
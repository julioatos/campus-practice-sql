alter table Employees add CompanyId int;
alter table Employees add constraint FK_Company_Employees foreign key (CompanyId) references Company (Id);
create table EmployeesProjects
(
	Id int,
	EmployeeId int not null,
	ProjectId int not null,
	constraint PK_EmployeesProjects primary key(Id),
	constraint FK_Employee foreign key (EmployeeId) references Employees(Id),
	constraint FK_Project foreign key (ProjectId) references Projects(Id),
);
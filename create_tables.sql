create table Company 
(
	Id int,
	Name varchar(150),
	Address varchar(max),
	constraint PK_Company primary key (Id)
);

create table Status
(
	Id int,
	Name varchar(50),
	constraint PK_Status primary key (Id),
	constraint UQ_Status_Name unique(Name) 
);

create table Projects
(
	Id int,
	Name varchar(150),
	StartDate Date,
	Deadline Date,
	FinishedOn Date,
	StatusId int,

	constraint PK_Projects primary key(Id),
	constraint UQ_Projects_Name unique(Name),
	constraint FK_Status_Projects foreign key(StatusId) references Status(Id)
);

create table Employees
(
	Id int,
	FirstName varchar(50),
	LastName varchar(50),
	Email varchar(100),
	Phone varchar(10),
	Salary decimal
	constraint PK_Employees primary key(Id),
	constraint UQ_Employees_Email unique(Email),
	constraint UQ_Employees_Phone unique(Phone)
);
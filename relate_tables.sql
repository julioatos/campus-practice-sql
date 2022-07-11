alter table Employees add CompanyId int;
alter table Employees add constraint FK_Company_Employees foreign key (CompanyId) references Company (Id);

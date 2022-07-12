create trigger TR_Projects
on Projects for insert

as
	declare @startDate date, @deadLine date;
	declare @projectId int;
	declare @currentDate date;

	set @currentDate = GETDATE();

	select @startDate = StartDate from inserted;
	select @deadLine = Deadline from inserted;
	select @projectId = Id from inserted;

	if (@deadLine <= @startDate) 
	begin
		raiserror('La fecha de entrega es igual o menor a la fecha de inicio',16,1);
		rollback transaction;
		return
	end
	else
		if (@startDate <= @currentDate OR @deadLine >= @currentDate)
		begin
			update Projects set StatusId = 1 where Id = @projectId;
			return
		end

insert into Projects values (6, 'blabla', '7/13/2022', '7/20/2022', '', 4);

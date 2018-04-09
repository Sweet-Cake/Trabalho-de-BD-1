declare @n1 table(
nota decimal(3, 1)
)
if((select COUNT(nota) from NotaQuesito where idQuesito = 1) < 14)
begin
	declare @cont int
	set @cont = 1
	while (@cont <=14)
	begin
		if ((select COUNT(nota) from notaquesito where idEscola = @cont and idQuesito = 1 and idJurado = 1) = 0)
		begin
			insert into @n1 values
				(0)
		end
		else
		begin
			insert @n1(nota)
				select nota from notaquesito where idEscola = @cont and idQuesito = 1 and idJurado = 1
		end
		set @cont = @cont + 1
	end
end
select * from @n1


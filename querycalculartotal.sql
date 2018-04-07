create procedure sp_calcularTotal
as
	declare @soma decimal(4, 1),
			@max decimal(3, 1),
			@min decimal(3, 1),
			@cEscola int,
			@cJurado int,
			@cQuesito int

	set @cEscola = 1
	set @cQuesito = 1
	while (@cEscola <= (select count(id) from Escola))
	begin
		set @soma = 0.0
		while (@cQuesito <= (select count(id) from Quesito))
		begin
			if ((select count(nota) from NotaQuesito where idEscola = @cEscola and idQuesito = @cQuesito) >= 3)
			begin
				set @min = (select min(nota) from NotaQuesito where idEscola = @cEscola and idQuesito = @cQuesito)
				set @max = (select max(nota) from NotaQuesito where idEscola = @cEscola and idQuesito = @cQuesito)
				set @soma = @soma + ((select sum(nota) from NotaQuesito where idEscola = @cEscola and idQuesito = @cQuesito) - @min - @max)
			end
			set @cQuesito = @cQuesito + 1
		end
		set @cQuesito = 1
		update Escola
		set totalPontos = @soma
		where id = @cEscola
		set @cEscola = @cEscola + 1
	end


-----

exec sp_calcularTotal
select * from Escola order by totalPontos desc

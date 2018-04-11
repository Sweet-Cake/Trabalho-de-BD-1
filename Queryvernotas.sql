create function sp_verifNota(@idquesito int, @idescola int, @idjurado int)
returns decimal(3, 1)
as
begin
	declare @valor decimal(3, 1)
	set @valor = (select nota from notaquesito 
					where idEscola = @idescola and idQuesito = @idquesito and idJurado = @idjurado)
	if (@valor is null)
	begin
		set @valor = 0
	end
	return @valor
end

create function fn_verifMaior(@idquesito int, @idescola int)
returns decimal(3, 1)
as
begin
	declare @valor decimal(3, 1)
	set @valor = (select max(nota) from NotaQuesito where idQuesito = @idquesito and idEscola = @idescola)
	if (@valor is null)
	begin
		set @valor = 0
	end
	return @valor
end


create function fn_verifMenor(@idquesito int, @idescola int)
returns decimal(3, 1)
as
begin
	declare @valor decimal(3, 1)
	set @valor = (select min(nota) from NotaQuesito where idQuesito = @idquesito and idEscola = @idescola)
	if (@valor is null)
	begin
		set @valor = 0
	end
	return @valor
end

create function fn_verifTotal(@idquesito int, @idescola int)
returns decimal(3, 1)
as
begin
	declare @valor decimal(3, 1), @menor decimal(3, 1), @maior decimal(3, 1)
	set @valor = 0
	if ((select count(nota) from NotaQuesito where idQuesito = @idquesito and idEscola = @idescola) >=3)
	begin
		set @maior = (select max(nota) from NotaQuesito where idEscola = @idescola and idQuesito = @idquesito)
		set @menor = (select min(nota) from NotaQuesito where idEscola = @idescola and idQuesito = @idquesito)
		set @valor = (select sum(nota) from NotaQuesito where idEscola = @idescola and idQuesito = @idquesito)
		set @valor = @valor - (@maior + @menor)
	end
	return @valor
end

-----

create procedure sp_vernotas(@idquesito int)
as
select distinct es.nome, dbo.sp_verifNota(@idquesito, es.id, 1) as n1, dbo.sp_verifNota(@idquesito, es.id, 2) as n2, 
dbo.sp_verifNota(@idquesito, es.id, 3) as n3, 
dbo.sp_verifNota(@idquesito, es.id, 4) as n4, dbo.sp_verifNota(@idquesito, es.id, 5) as n5,
dbo.fn_verifMaior(@idquesito, es.id) as maior, dbo.fn_verifMenor(@idquesito, es.id) as menor,
dbo.fn_verifTotal(@idquesito, es.id) as total 
from Escola es, Quesito qu, NotaQuesito nq
where qu.id = @idquesito
order by total desc

exec sp_vernotas 1

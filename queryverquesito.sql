create function fn_verifnulo(@nota decimal(3, 1))
returns decimal(3, 1)
as
begin
	if ((count(@nota)) = 0)
	begin
		set @nota = 0
	end
	return @nota
end

-------

create procedure sp_calcNota(@idquesito int, @idescola int)
as
declare @n1 decimal(3, 1),
		@n2 decimal(3, 1),
		@n3 decimal(3, 1),
		@n4 decimal(3, 1),
		@n5 decimal(3, 1),
		@max decimal (3, 1),
		@min decimal (3 ,1),
		@total decimal(3, 1)

set @n1 = (select nota from NotaQuesito
where idJurado = 1 and idQuesito = @idquesito and idEscola = @idescola)
	exec @n1 = dbo.fn_verifnulo @n1
set @n2 = (select nota from NotaQuesito 
where idJurado = 2 and idQuesito = @idquesito and idEscola = @idescola)
	exec @n2 = dbo.fn_verifnulo @n2
set @n3 = (select nota from NotaQuesito 
where idJurado = 3 and idQuesito = @idquesito and idEscola = @idescola)
	exec @n3 = dbo.fn_verifnulo @n3
set @n4 = (select nota from NotaQuesito 
where idJurado = 4 and idQuesito = @idquesito and idEscola = @idescola)
	exec @n4 = dbo.fn_verifnulo @n4
set @n5 = (select nota from NotaQuesito 
where idJurado = 5 and idQuesito = @idquesito and idEscola = @idescola)
	exec @n5 = dbo.fn_verifnulo @n5
set @max = (select max(nota) from NotaQuesito 
where idEscola = @idescola and idQuesito = @idquesito)
	exec @max = dbo.fn_verifnulo @max
set @min = (select min(nota) from NotaQuesito 
where idEscola = @idescola and idQuesito = @idquesito)
	exec @min = dbo.fn_verifnulo @min
set @total = (select sum(nota) from NotaQuesito 
where idEscola = @idescola and idQuesito = @idquesito)
	exec @total = dbo.fn_verifnulo @total

select distinct es.nome, 
@n1 as nota1, @n2 as nota2, @n3 as nota3, @n4 as nota4, @n5 as nota5,
@min as menor, @max as maior, @total as total 
from Escola es, NotaQuesito nq
where
es.id = nq.idEscola and
es.id = @idescola

-----------

exec sp_calcNota 1, 1
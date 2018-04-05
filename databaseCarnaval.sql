create database Carnaval
go
use Carnaval

create table Escola(
	id int identity not null,
	nome varchar(100) not null,
	totalPontos decimal (3, 1) null,
	primary key (id)
)

create table Jurado(
	id int identity not null,
	nome varchar(100) not null,
	primary key(id)
)

create table Quesito(
	id int identity not null,
	nome varchar(100) not null,
	primary key (id)
)

create table NotaQuesito(
	idQuesito int not null,
	idEscola int not null,
	idJurado int not null,
	nota decimal (3, 1) not null,
	foreign key (idQuesito) references Quesito(id),
	foreign key (idEscola) references Escola(id),
	foreign key (idJurado) references Jurado(id),
	primary key (idQuesito, idEscola, idJurado)
)

select * from NotaQuesito

insert into Escola values
('Acadêmicos do Tatuapé', null),
('Rosas de Ouro', null),
('Mancha Verde', null), 
('Vai-Vai', null),
('X-9 Paulistana', null),
('Dragões da Real', null),
('Águia de Ouro', null),
('Nenê de Vila Matilde', null),
('Gaviões da Fiel', null),
('Mocidade Alegre', null),
('Tom Maior', null),
('Unidos de Vila Maria', null),
('Acadêmicos do Tucuruvi',null),
('Império de Casa Verde', null)

insert into Quesito values
('Comissão de Frente'),
('Evolução'),
('Fantasia'),
('Bateria'),
('Alegoria'),
('Harmonia'),
('Samba-Enredo'),
('Mestre-Sala e Porta-Bandeira'),
('Enredo')

insert into Jurado values
('1º Jurado'),
('2º Jurado'),
('3º Jurado'),
('4º Jurado'),
('5º Jurado')

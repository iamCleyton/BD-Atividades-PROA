create database jogo_pokemon;
use jogo_pokemon;

drop database jogo_pokemon;

create table treinador (
  id_treinador int primary key auto_increment,
  nome varchar(100) not null,
  idade int,
  aparencia varchar(255),
  gostos varchar(255),
  regiao varchar(50)
);

create table pokemon (
  id_pokemon int primary key auto_increment,
  nome varchar(50) not null,
  forma varchar(30),
  tipo1 varchar(20) not null,
  tipo2 varchar(20),
  hp int,
  ataque int,
  defesa int,
  ataque_especial int,
  defesa_especial int,
  agilidade int,
  geracao int
);

create table fazenda (
  id_fazenda int primary key auto_increment,
  nome varchar(100),
  localizacao varchar(100),
  capacidade int
);

create table time (
  id_time int primary key auto_increment,
  nome_time varchar(100),
  quantidade_maxima int default 6
);

create table batalha (
  id_batalha int primary key auto_increment,
  data_batalha date,
  local varchar(100),
  resultado varchar(50)
);

create table pokebola (
  id_pokebola int primary key auto_increment,
  tipo varchar(50),
  eficiencia decimal(4,2)
);

/* tabelas associativas: */

create table treinador_pokemon (
  id_treinador int,
  id_pokemon int,
  local enum('time', 'fazenda') default 'fazenda',
  apelido varchar(50),
  primary key (id_treinador, id_pokemon),
  constraint foreign key (id_treinador) references treinador(id_treinador),
  constraint foreign key (id_pokemon) references pokemon(id_pokemon)
);

create table fazenda_pokemon (
  id_fazenda int,
  id_pokemon int,
  dataentrada date,
  primary key (id_fazenda, id_pokemon),
  constraint foreign key (id_fazenda) references fazenda(id_fazenda),
  constraint foreign key (id_pokemon) references pokemon(id_pokemon)
);

create table time_pokemon (
  id_time int,
  id_pokemon int,
  posição_notime int,
  primary key (id_time, id_pokemon),
  constraint foreign key (id_time) references time(id_time),
  constraint foreign key (id_pokemon) references pokemon(id_pokemon)
);

create table treinador_batalha (
  id_treinador int,
  id_batalha int,
  pontos int,
  resultado varchar(50),
  primary key (id_treinador, id_batalha),
  constraint foreign key (id_treinador) references treinador(id_treinador),
  constraint foreign key (id_batalha) references batalha(id_batalha)
);

create table captura (
  id_treinador int,
  id_pokebola int,
  datacaptura date,
  sucesso boolean,
  primary key (id_treinador, id_pokebola, datacaptura),
  constraint foreign key (id_treinador) references treinador(id_treinador),
  constraint foreign key (id_pokebola) references pokebola(id_pokebola)
);

insert into treinador (
nome,
idade, 
aparencia, 
gostos, 
regiao
) values
('lillie', 12, 'chapéu branco, vestido', 'pokémon de gelo e fada', 'alola'),
('hau', 13, 'roupa verde, bandana amarela', 'pokémon do tipo grama', 'alola'),
('gloria', 15, 'boné de lã, sobretudo', 'pokémon do tipo água', 'galar'),
('leon', 20, 'capa vermelha, boné', 'pokémon do tipo dragão', 'galar'),
('elisa', 16, 'óculos, uniforme de ginásio', 'pokémon do tipo elétrico', 'unova'),
('n', 17, 'cabelos verdes, camisa branca', 'pokémon diversos', 'unova'),
('calem', 15, 'boné azul, jaqueta', 'pokémon de fogo', 'kalos'),
('brendan', 14, 'boné branco, mochila', 'pokémon aquáticos', 'hoenn'),
('wallace', 24, 'roupas elegantes, cabelo azul', 'pokémon aquáticos', 'hoenn'),
('iris', 10, 'cabelos longos, roupa de verão', 'pokémon dragão', 'unova');

select * from treinador;

insert into pokemon (
id_pokemon, 
nome, 
forma, 
tipo1, 
tipo2, 
hp, 
ataque, 
defesa, 
ataque_especial, 
defesa_especial, 
agilidade,
geracao) values
(11, 'sceptile', 'normal', 'grama', null, 70, 85, 65, 105, 85, 120, 3),
(12, 'blaziken', 'normal', 'fogo', 'lutador', 80, 120, 70, 110, 70, 80, 3),
(13, 'swampert', 'normal', 'água', 'terra', 100, 110, 90, 85, 90, 60, 3),
(14, 'rayquaza', 'mega', 'dragão', 'voador', 105, 180, 100, 180, 100, 115, 3),
(15, 'dialga', 'origem', 'aço', 'dragão', 100, 150, 120, 120, 100, 90, 4),
(16, 'zoroark', 'hisui', 'sombra', 'fantasma', 70, 105, 60, 120, 60, 105, 5),
(17, 'aegislash', 'escudo', 'aço', 'fantasma', 60, 50, 150, 50, 150, 60, 6),
(18, 'greninja', 'ash', 'água', 'sombra', 72, 145, 67, 153, 71, 132, 6),
(19, 'silvally', 'fogo', 'normal', null, 95, 95, 95, 95, 95, 95, 7),
(20, 'zacian', 'coroa', 'fada', 'aço', 92, 170, 115, 80, 115, 148, 8);

select * from pokemon;

insert into fazenda (
nome, 
localizacao, 
capacidade) values
('retiro kalos', 'couriway town', 45),
('reserva hoenn', 'sootopolis city', 65),
('fazenda unova', 'nuvema town', 75),
('rancho galar', 'wedgehurst', 85),
('clube alola', 'royal avenue', 95),
('pousada kanto', 'cerulean city', 55),
('santuário johto', 'goldenrod city', 40),
('abrigo sinnoh', 'canalave city', 70),
('viveiro paldea', 'mesagoza', 80),
('fazenda lendária', 'mt. silver', 110);

select * from fazenda;

insert into time (
nome_time, 
quantidade_maxima) values
('time sombra', 6),
('time gelo', 6),
('time dragão mestre', 6),
('time lendário', 6),
('time campeões', 6),
('time unova', 6),
('time galar', 6),
('time alola', 6),
('time hoenn', 6),
('time kalos', 6);

select * from time;

insert into batalha (
data_batalha, 
local, 
resultado) values
('2024-05-15', 'moss rock', 'derrota'),
('2024-06-22', 'sunyshore city', 'vitória'),
('2024-07-13', 'driftveil city', 'vitória'),
('2024-08-05', 'laverre city', 'empate'),
('2024-09-20', 'malie garden', 'vitória'),
('2024-10-11', 'wyndon stadium', 'derrota'),
('2024-11-03', 'nimbasa city', 'vitória'),
('2024-12-15', 'alola league', 'vitória'),
('2025-01-25', 'hoenn grand festival', 'derrota'),
('2025-02-04', 'sinnoh league', 'vitória');

select * from batalha;

insert into pokebola (
tipo, 
eficiencia) values
('heal ball', 1.00),
('safari ball', 1.50),
('love ball', 2.00),
('friend ball', 1.00),
('moon ball', 1.10),
('fast ball', 4.00),
('heavy ball', 3.00),
('level ball', 5.00),
('lure ball', 4.00),
('beast ball', 0.10);

select * from pokebola;

/* tabelas associativas */

insert into treinador_pokemon (
id_treinador, 
id_pokemon, 
local, 
apelido) values
(1, 19, 'fazenda', 'type s'),
(2, 11, 'time', 'leaf cutter'),
(3, 13, 'time', 'mudfish'),
(4, 20, 'time', 'king'),
(5, 12, 'fazenda', 'chicken'),
(6, 16, 'time', 'illusion'),
(7, 18, 'time', 'ninja'),
(8, 13, 'fazenda', 'swampy'),
(9, 14, 'time', 'sky lord'),
(10, 15, 'fazenda', 'time god');

select * from treinador_pokemon;

insert into fazenda_pokemon (
id_fazenda, 
id_pokemon, 
dataentrada) values
(1, 11, '2024-06-11'),
(2, 12, '2024-06-15'),
(3, 13, '2024-06-20'),
(4, 14, '2024-07-11'),
(5, 15, '2024-07-25'),
(6, 16, '2024-08-11'),
(7, 17, '2024-08-20'),
(8, 18, '2024-09-11'),
(9, 19, '2024-09-30'),
(10, 20, '2024-10-11');

select * from fazenda_pokemon;

insert into time_pokemon (
id_time, 
id_pokemon, 
posição_notime) values
(1, 16, 1),
(2, 20, 1),
(3, 14, 1),
(4, 15, 1),
(5, 18, 1),
(6, 12, 1),
(7, 17, 1),
(8, 19, 1),
(9, 13, 1),
(10, 11, 1);

select * from time_pokemon;

insert into treinador_batalha (
id_treinador, 
id_batalha, 
pontos, 
resultado) values
(1, 1, 4, 'derrota'),
(2, 2, 10, 'vitória'),
(3, 3, 10, 'vitória'),
(4, 4, 7, 'empate'),
(5, 5, 10, 'vitória'),
(6, 6, 5, 'derrota'),
(7, 7, 9, 'vitória'),
(8, 8, 10, 'vitória'),
(9, 9, 3, 'derrota'),
(10, 10, 10, 'vitória');

select * from treinador_batalha;

insert into captura (
id_treinador, 
id_pokebola, 
datacaptura, 
sucesso) values
(1, 1, '2024-05-12', false),
(2, 2, '2024-05-20', true),
(3, 3, '2024-06-22', true),
(4, 4, '2024-06-30', true),
(5, 5, '2024-07-11', false),
(6, 6, '2024-07-20', true),
(7, 7, '2024-07-25', true),
(8, 8, '2024-08-11', true),
(9, 9, '2024-08-25', false),
(10, 10, '2024-09-11', true);

select * from captura;
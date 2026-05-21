create database concenssionária;
use concenssionária;

create table cliente(
cpf varchar(11) not null,
nome varchar(30) not null,
telefone varchar(15) not null,
primary key(cpf)
);

create table veiculo(
categoria varchar(10),
modelo varchar(10),
id_veiculo int auto_increment,
estado varchar(10),
placa varchar(15),
primary key(id_veiculo)
);

create table contrato(
 id_contrato int Auto_Increment,
 da_retirada varchar (11) not null,
 da_devolução_prevista varchar(11) not null,
 valor_diaria varchar (10),
 tipo_seguro varchar (20),
 cpf varchar(11) not null,
 id_veiculo int,
 primary key(id_contrato),
 foreign key (cpf) References cliente(cpf),
foreign key (id_veiculo) References veiculo(id_veiculo)
);

create table multa(
desc_multa varchar (50),
id_multa int auto_increment,
id_veiculo int,
id_contrato int,
valor_multa float,
primary key(id_multa),
foreign key (id_veiculo) references veiculo(id_veiculo),
foreign key (id_contrato) references contrato(id_contrato)
);

create table manuntenção(
id_manuntenção int auto_increment,
id_veiculo int,
desc_manuntenção varchar(50),
primary key(id_manuntenção),
foreign key (id_veiculo) references veiculo(id_veiculo)
);

create table reserva(
id_reserva int auto_increment,
data_res varchar(11),
id_veiculo int,
cpf varchar(11) not null,
primary key(id_reserva),
foreign key (id_veiculo) references veiculo(id_veiculo),
foreign key (cpf) references cliente(cpf)
);

create table pagamento(
id_pag int auto_increment,
estado varchar(10),
valor float,
cpf varchar(11),
primary key(id_pag),
foreign key (cpf) references cliente(cpf)
);

create table devolução(
id_devolução int auto_increment,
km_final varchar(20),
danos_ident varchar(50),
valor_adic float,
cpf varchar(11) not null,
primary key(id_devolução),
foreign key (cpf) references cliente(cpf)
);

INSERT INTO cliente (cpf, nome, telefone) VALUES 
('11122233344', 'Renata Moreira', '11988887777'),
('22233344455', 'Marcos Oliveira', '11977776666'),
('33344455566', 'Ana Paula Silva', '11966665555'),
('44455566677', 'Ricardo Santos', '11955554444'),
('55566677788', 'Beatriz Souza', '11944443333'),
('66677788899', 'Carlos Eduardo', '11933332222'),
('77788899900', 'Fernanda Lima', '11922221111'),
('88899900011', 'Gabriel Moita', '11911110000'),
('99900011122', 'Juliana Paes', '11900009999'),
('00011122233', 'Lucas Gabriel', '11899998888');

INSERT INTO veiculo (categoria, modelo, estado, placa) VALUES 
('Popular', 'Fiat Uno', 'manutenção', 'ABC1D23'),
('Sedã', 'Corolla', 'alugado', 'XYZ9D87'),
('SUV', 'Compass', 'reservado', 'LMN4X55'),
('Utilitário', 'Master', 'disponível', 'KJU2M11'),
('Vans', 'Sprinter', 'disponível', 'VWC8P99'),
('Popular', 'Gol', 'disponível', 'GOL1A22'),
('Sedã', 'Civic', 'alugado', 'HDA3F44'),
('SUV', 'Renegade', 'reservado', 'JEE5G66'),
('Popular', 'Mobi', 'manutenção', 'MOB7H88'),
('Utilitário', 'Fiorino', 'disponível', 'FIO9I00');

INSERT INTO contrato (da_retirada, da_devolução_prevista, valor_diaria, tipo_seguro, cpf, id_veiculo) VALUES 
('01/03/2026', '10/03/2026', '250.00', 'Completo', '44455566677', 2),
('05/03/2026', '12/03/2026', '300.00', 'Básico', '66677788899', 7),
('10/03/2026', '15/03/2026', '150.00', 'Total', '88899900011', 1),
('15/03/2026', '20/03/2026', '450.00', 'Premium', '00011122233', 10),
('20/03/2026', '25/03/2026', '200.00', 'Completo', '33344455566', 6);

INSERT INTO multa (desc_multa, id_veiculo, id_contrato, valor_multa) VALUES 
('Excesso de velocidade', 2, 1, 195.23),
('Estacionamento proibido', 7, 2, 130.16),
('Sinal vermelho', 2, 1, 293.47),
('Falar ao celular', 10, 4, 243.00),
('Sem cinto de segurança', 6, 5, 195.23);

INSERT INTO manuntenção (id_veiculo, desc_manuntenção) VALUES 
(1, 'Troca de óleo e filtro'),
(9, 'Reparo na suspensão dianteira'),
(4, 'Revisão dos 50.000km'),
(5, 'Troca de pneus traseiros'),
(2, 'Higienização interna pós-aluguel');

INSERT INTO reserva (data_res, id_veiculo, cpf) VALUES 
('10/04/2026', 3, '22233344455'),
('12/04/2026', 8, '77788899900'),
('15/04/2026', 4, '99900011122'),
('18/04/2026', 6, '11122233344'),
('20/04/2026', 10, '55566677788');

INSERT INTO pagamento (estado, valor, cpf) VALUES 
('pago', 2500.00, '44455566677'),
('pendente', 1200.00, '66677788899'),
('pago', 750.00, '88899900011'),
('pago', 2250.00, '00011122233'),
('atrasado', 500.00, '33344455566');

INSERT INTO devolução (km_final, danos_ident, valor_adic, cpf) VALUES 
('15200', 'Nenhum dano', 0.00, '44455566677'),
('18900', 'Arranhão porta esquerda', 150.00, '66677788899'),
('10450', 'Falta de combustível', 80.00, '88899900011'),
('45600', 'Pneu furado', 200.00, '00011122233'),
('12300', 'Nenhum dano', 0.00, '33344455566');

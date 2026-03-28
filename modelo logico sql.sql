drop database if exists chamusca;
create database chamusca;
use chamusca;


CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    email VARCHAR(50),
    endereco VARCHAR(40),
    idade VARCHAR(4)
);


CREATE TABLE empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    endereco VARCHAR(40),
    email VARCHAR(50),
    telefone VARCHAR(20)
);


CREATE TABLE veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_empresa INT,
    valor DECIMAL(10, 2),
    quilometragem DECIMAL(10, 2),
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);


CREATE TABLE CONTRATO (
    id_contracto INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_veiculo INT,
    data_devolucao VARCHAR(10),
    valor DECIMAL(10, 2),
    quilometragem_inicial DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);


CREATE TABLE manutencao (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT,
    id_cliente INT,
    id_contrato INT,
    valor DECIMAL(10, 2),
    tipo_manutencao VARCHAR(20),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_contrato) REFERENCES CONTRATO(id_contracto)
);

INSERT INTO CLIENTE (nome, email, endereco, idade) VALUES
('Ana Pereira', 'ana@gmail.com', 'Rua D', '28'),
('Bruno Costa', 'bruno@gmail.com', 'Rua E', '35'),
('Fernanda Alves', 'fernanda@gmail.com', 'Rua F', '22'),
('Ricardo Gomes', 'ricardo@gmail.com', 'Rua G', '45'),
('Juliana Rocha', 'juliana@gmail.com', 'Rua H', '31');

INSERT INTO empresa (nome, endereco, email, telefone) VALUES
('FastCar', 'Av Paulista', 'fastcar@gmail.com', '11777777777'),
('MoveAuto', 'Rua Azul', 'moveauto@gmail.com', '11666666666');

INSERT INTO veiculo (id_empresa, valor, quilometragem) VALUES
(1, 45000.00, 20000.00),
(2, 90000.00, 5000.00),
(1, 55000.00, 18000.00),
(2, 70000.00, 10000.00),
(1, 65000.00, 22000.00);

INSERT INTO CONTRATO (id_cliente, id_veiculo, data_devolucao, valor, quilometragem_inicial) VALUES
(1, 2, '2026-04-15', 2200.00, 5000.00),
(2, 3, '2026-04-20', 1700.00, 18000.00),
(3, 4, '2026-04-22', 2100.00, 10000.00),
(4, 5, '2026-04-25', 1900.00, 22000.00),
(5, 1, '2026-04-30', 1600.00, 20000.00);

INSERT INTO manutencao (id_veiculo, id_cliente, id_contrato, valor, tipo_manutencao) VALUES
(2, 1, 1, 400.00, 'Troca de pneus'),
(3, 2, 2, 350.00, 'Troca de óleo'),
(4, 3, 3, 600.00, 'Revisão completa'),
(5, 4, 4, 450.00, 'Freios'),
(1, 5, 5, 300.00, 'Alinhamento');

select * from Cliente;
select * from empresa;
select * from veiculo;
select * from contrato;
select * from manutencao;
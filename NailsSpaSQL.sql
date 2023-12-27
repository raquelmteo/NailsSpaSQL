CREATE DATABASE Spa_dos_Pes
GO

USE Spa_dos_Pes
GO

CREATE TABLE cliente
(nif int PRIMARY KEY NOT NULL,
nome text NOT NULL,
telefone text NOT NULL,
email text NOT NULL,
localidade text NOT NULL)

CREATE TABLE servico
(cod_servico int PRIMARY KEY NOT NULL,
nome_servico text NOT NULL,
valor money NOT NULL,
especialidade text NOT NULL)

CREATE TABLE atendente
(cod_atendente int PRIMARY KEY NOT NULL,
nome_atendente text NOT NULL)

CREATE TABLE agendamento
(cod_agendamento int PRIMARY KEY NOT NULL,
data_agendamento date NOT NULL,
hora_agendamento time NOT NULL,
nif int NOT NULL FOREIGN KEY REFERENCES cliente(nif),
cod_servico int NOT NULL FOREIGN KEY REFERENCES servico(cod_servico),
cod_atendente int NOT NULL FOREIGN KEY REFERENCES atendente(cod_atendente))

INSERT INTO cliente (nif, nome, telefone, email, localidade)
VALUES (321654987, 'Raquel Melo', '913712070', 'raquelmteofilo@gmail.com', 'Porto'),
(345678901, 'Iago Santos', '987098765', 'iagosantos@gmail.com', 'Penafiel'),
(356789098, 'Catarina Pinheiro', '987908765', 'catarina@gmail.com', 'Santa Maria da Feira'),
(345678123, 'Wesley Filgueiras', '956765432', 'filgueiras@gmail.com', 'Porto')

INSERT INTO servico (cod_servico, nome_servico, valor, especialidade)
VALUES (1, 'Alongamento S/M', 30.00, 'Alongamentos'),
(2, 'Alongamento L', 37.00, 'Alongamentos'),
(3, 'Manicure Gelinho', 16.00, 'Mãos'),
(4, 'Manicure Comum', 11.00, 'Mãos'),
(5, 'Reforço Nails´', 22.00, 'Mãos'),
(6, 'Hidratação com parafina', 6.00, 'Pés'),
(7, 'Pedicure Comum', 20.00, 'Pés'),
(8, 'Pedicure Gelinho', 22.00, 'Pés'),
(9, 'Pedicure Calista', 33.00, 'Pés'),
(10, 'Pedicure Medical', 27.00, 'Pés'),
(11, 'Manutenção S/M', 22.00, 'Manutenção'),
(12, 'Manutenção L', 28.00, 'Manutenção'),
(13, 'Manutenção XL', 40.00, 'Manutenção')

INSERT INTO atendente (cod_atendente, nome_atendente)
VALUES (1, 'Karine Santos'),
(2, 'Danielle Maia')

INSERT INTO agendamento (cod_agendamento, data_agendamento, hora_agendamento, nif, cod_servico, cod_atendente)
VALUES (10, '2023-11-13', '09:00:00', 321654987, 7, 2),
(20, '2023-11-13', '10:00:00', 345678901, 8, 1),
(30, '2023-11-13', '11:00:00', 356789098, 10, 2),
(40, '2023-11-13', '12:00:00', 345678123, 11, 1)

SELECT cod_servico, nome_servico
FROM servico
WHERE especialidade LIKE 'Mãos'

SELECT * FROM agendamento
WHERE cod_atendente LIKE 2

SELECT c.nome AS NomeCliente, s.nome_servico AS NomeServico
FROM cliente AS c
INNER JOIN agendamento AS a ON c.nif = a.nif
INNER JOIN servico AS s ON a.cod_servico = s.cod_servico
WHERE a.data_agendamento = '2023-11-13'


INSERT INTO parque_diversao (nome, cnpj, preco_ingresso, logradouro, bairro, estado, numero, cidade) VALUES
('Hopi Hari', '11111111000101', 199.90, 'Rodovia dos Bandeirantes', 'Km 72', 'SP', 0, 'Vinhedo'),
('Beto Carrero World', '22222222000102', 249.90, 'Rodovia Beto Carrero', 'Praia de Armação', 'SC', 0, 'Penha'),
('Beach Park', '33333333000103', 179.90, 'Rua Porto das Dunas', 'Porto das Dunas', 'CE', 2734, 'Aquiraz'),
('Playcenter Indoor', '44444444000104', 89.90, 'Shopping Aricanduva', 'Vila Matilde', 'SP', 555, 'São Paulo'),
('Mirabilandia', '55555555000105', 99.90, 'Av. Professor Andrade Bezerra', 'Salgadinho', 'PE', 620, 'Olinda'),
('Magic City', '66666666000106', 149.90, 'Estrada do Pavoeiro', 'Cidade Mágica', 'SP', 8870, 'Suzano'),
('Wet’n Wild', '77777777000107', 159.90, 'Rod. dos Bandeirantes', 'Km 72', 'SP', 0, 'Itupeva'),
('Cidade da Criança', '88888888000108', 59.90, 'Rua Tasman', 'Centro', 'SP', 301, 'São Bernardo do Campo'),
('Terra Encantada', '99999999000109', 119.90, 'Av. Ayrton Senna', 'Barra da Tijuca', 'RJ', 3000, 'Rio de Janeiro'),
('Fun City', '00000000000110', 89.90, 'Av. das Américas', 'Recreio', 'RJ', 500, 'Rio de Janeiro');

INSERT INTO turista (nome, cpf, logradouro, bairro, estado, numero, cidade) VALUES
('Ana Souza', '11122233344', 'Rua das Flores', 'Jardim América', 'SP', 123, 'São Paulo'),
('Bruno Lima', '22233344455', 'Av. Brasil', 'Centro', 'RJ', 456, 'Rio de Janeiro'),
('Carla Mendes', '33344455566', 'Rua das Acácias', 'Savassi', 'MG', 789, 'Belo Horizonte'),
('Daniel Oliveira', '44455566677', 'Av. Paulista', 'Bela Vista', 'SP', 101, 'São Paulo'),
('Eduarda Silva', '55566677788', 'Rua XV de Novembro', 'Centro', 'PR', 202, 'Curitiba'),
('Felipe Costa', '66677788899', 'Av. Afonso Pena', 'Centro', 'MG', 303, 'Belo Horizonte'),
('Gabriela Rocha', '77788899900', 'Rua das Palmeiras', 'Copacabana', 'RJ', 404, 'Rio de Janeiro'),
('Henrique Almeida', '88899900011', 'Av. Sete de Setembro', 'Centro', 'BA', 505, 'Salvador'),
('Isabela Martins', '99900011122', 'Rua da Aurora', 'Boa Vista', 'PE', 606, 'Recife'),
('João Pedro', '00011122233', 'Av. Beira Mar', 'Meireles', 'CE', 707, 'Fortaleza');

INSERT INTO visita (numero_cartao_consumo, data_hora_entrada, data_hora_saida, valor_ingresso, turista_id, parque_diversao_id) VALUES
(1001, '2025-05-01 09:00:00', '2025-05-01 17:00:00', 0.00, 1, 1),
(1002, '2025-05-02 10:00:00', '2025-05-02 18:00:00', 10.00, 2, 2),
(1003, '2025-05-03 08:30:00', '2025-05-03 16:30:00', 0.00, 3, 3),
(1004, '2025-05-04 09:15:00', '2025-05-04 17:15:00', 0.00, 4, 4),
(1005, '2025-05-05 10:45:00', '2025-05-05 18:45:00', 0.00, 5, 5),
(1006, '2025-05-06 09:30:00', '2025-05-06 17:30:00', 0.00, 6, 6),
(1007, '2025-05-07 08:00:00', '2025-05-07 16:00:00', 5.00, 7, 7),
(1008, '2025-05-08 09:45:00', '2025-05-08 17:45:00', 15.00, 8, 8),
(1009, '2025-05-09 10:15:00', '2025-05-09 18:15:00', 0.00, 9, 9),
(1010, '2025-05-10 09:00:00', '2025-05-10 17:00:00', 0.00, 10, 10);

INSERT INTO parceiro_comercial (nome, cnpj) VALUES
('Coca-Cola Brasil', '12345678000199'),
('Petrobras', '23456789000188'),
('Banco do Brasil', '34567890000177'),
('Itaú Unibanco', '45678900000166'),
('Ambev', '56789000000155'),
('Bradesco', '67890000000144'),
('Nestlé Brasil', '78900000000133'),
('Vale S.A.', '89000000000122'),
('Embraer', '90000000000111'),
('Gerdau', '01234567000100');

INSERT INTO parceria (parque_diversao_id, parceiro_comercial_id, valor_investimento, percentual_arrecadacao) VALUES
(1, 1, 500000.00, 10.0),
(2, 2, 750000.00, 12.5),
(3, 3, 600000.00, 11.0),
(4, 4, 800000.00, 13.0),
(5, 5, 550000.00, 9.5),
(6, 6, 700000.00, 12.0),
(7, 7, 650000.00, 11.5),
(8, 8, 900000.00, 14.0),
(9, 9, 500000.00, 10.0),
(10, 10, 750000.00, 12.5);

INSERT INTO despesa (num_despesa, valor, parceria_parque_diversao_id, parceria_parceiro_comercial_id, visita_numero_cartao_consumo) VALUES
(1, 10000.00, 1, 1, 1001),
(2, 15000.00, 2, 2, 1002),
(3, 12000.00, 3, 3, 1003),
(4, 18000.00, 4, 4, 1004),
(5, 11000.00, 5, 5, 1005),
(6, 16000.00, 6, 6, 1006),
(7, 13000.00, 7, 7, 1007),
(8, 20000.00, 8, 8, 1008),
(9, 10000.00, 9, 9, 1009),
(10, 15000.00, 10, 10, 1010);

INSERT INTO atracao (nome, idade_minima, altura_minima, horario_func, parque_diversao_id) VALUES
('Montezum - Montanha Russa de Madeira', 12, 1.4, '2025-06-01 10:00:00', 1),
('Vurang - Montanha Russa no Escuro', 10, 1.3, '2025-06-01 11:00:00', 1),
('Big Tower', 14, 1.4, '2025-06-02 10:00:00', 2),
('FireWhip - Montanha Russa Suspensa', 12, 1.3, '2025-06-02 11:30:00', 2),
('Insano - Toboágua Radical', 13, 1.4, '2025-06-03 10:00:00', 3),
('Aqua Show', 5, 1.0, '2025-06-03 11:30:00', 3),
('Space Mountain', 10, 1.2, '2025-06-04 09:30:00', 4),
('Pirates of the Caribbean', 5, 1.0, '2025-06-04 11:00:00', 4),
('Harry Potter and the Forbidden Journey', 10, 1.2, '2025-06-05 10:00:00', 5),
('Jurassic Park River Adventure', 8, 1.1, '2025-06-05 11:30:00', 5),
('Carrossel da Mônica', 3, 0.9, '2025-06-06 10:00:00', 6),
('Engenheiros do Riso', 6, 1.0, '2025-06-06 11:00:00', 6),
('Boomerang - Montanha Russa de Ré', 12, 1.3, '2025-06-07 10:00:00', 7),
('Turbo Drop', 13, 1.4, '2025-06-07 11:00:00', 7),
('Fênix - Barco Viking', 8, 1.2, '2025-06-08 10:00:00', 8),
('Roda-Gigante Mirabilandia', 5, 1.0, '2025-06-08 11:00:00', 8),
('Crazy Drop', 10, 1.2, '2025-06-09 10:00:00', 9),
('Lazy River', 0, 0.0, '2025-06-09 11:00:00', 9),
('Tower of Terror', 12, 1.3, '2025-06-10 10:00:00', 10),
('Rock’n’Roller Coaster', 14, 1.4, '2025-06-10 11:30:00', 10);
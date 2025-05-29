CREATE TABLE parque_diversao (
    id SERIAL PRIMARY KEY,
    nome CHAR(40) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    preco_ingresso FLOAT,
    logradouro VARCHAR(60),
    bairro CHAR(45),
    estado CHAR(2),
    numero INT,
    cidade CHAR(40)
);

CREATE TABLE turista (
    id SERIAL PRIMARY KEY,
    nome CHAR(40) NOT NULL,
    cpf CHAR(11) NOT NULL,
    logradouro VARCHAR(60),
    bairro CHAR(45),
    estado CHAR(2),
    numero INT,
    cidade CHAR(40)
);

CREATE TABLE visita (
    numero_cartao_consumo INT PRIMARY KEY,
    data_hora_entrada TIMESTAMP,
    data_hora_saida TIMESTAMP,
    valor_ingresso FLOAT,
    turista_id INT NOT NULL,
    parque_diversao_id INT NOT NULL,
    FOREIGN KEY (turista_id) REFERENCES turista (id),
    FOREIGN KEY (parque_diversao_id) REFERENCES parque_diversao (id)
);

CREATE TABLE parceiro_comercial (
    id SERIAL PRIMARY KEY,
    nome CHAR(40) NOT NULL,
    cnpj CHAR(14) NOT NULL
);

CREATE TABLE parceria (
    parque_diversao_id INT NOT NULL,
    parceiro_comercial_id INT NOT NULL,
    valor_investimento FLOAT,
    percentual_arrecadacao FLOAT,
    PRIMARY KEY (
        parque_diversao_id,
        parceiro_comercial_id
    ),
    FOREIGN KEY (parque_diversao_id) REFERENCES parque_diversao (id),
    FOREIGN KEY (parceiro_comercial_id) REFERENCES parceiro_comercial (id)
);

CREATE TABLE despesa (
    num_despesa INT PRIMARY KEY,
    valor FLOAT,
    parceria_parque_diversao_id INT NOT NULL,
    parceria_parceiro_comercial_id INT NOT NULL,
    visita_numero_cartao_consumo INT NOT NULL,
    FOREIGN KEY (
        parceria_parque_diversao_id,
        parceria_parceiro_comercial_id
    ) REFERENCES parceria (
        parque_diversao_id,
        parceiro_comercial_id
    ),
    FOREIGN KEY (visita_numero_cartao_consumo) REFERENCES visita (numero_cartao_consumo)
);

CREATE TABLE atracao (
    id SERIAL PRIMARY KEY,
    nome CHAR(40) NOT NULL,
    idade_minima INT,
    altura_minima FLOAT,
    horario_func TIMESTAMP,
    parque_diversao_id INT NOT NULL,
    FOREIGN KEY (parque_diversao_id) REFERENCES parque_diversao (id)
);
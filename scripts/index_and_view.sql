CREATE UNIQUE INDEX unq_turista_cpf
ON turista (cpf);

CREATE UNIQUE INDEX unq_parque_cnpj
ON parque_diversao (cnpj);

CREATE VIEW vw_visitas_detalhadas AS
SELECT
    t.nome AS nome_turista,
    pd.nome AS nome_parque,
    a.nome AS nome_atracao,
    v.data_hora_entrada,
    v.valor_ingresso
FROM turista t
JOIN visita v ON t.id = v.turista_id
JOIN parque_diversao pd ON v.parque_diversao_id = pd.id
JOIN atracao a ON a.parque_diversao_id = pd.id;

CREATE VIEW vw_despesas_por_parque AS
SELECT
    pd.nome AS nome_parque,
    SUM(d.valor) AS total_despesas
FROM despesa d
JOIN parceria p ON d.parceria_parque_diversao_id = p.parque_diversao_id
               AND d.parceria_parceiro_comercial_id = p.parceiro_comercial_id
JOIN parque_diversao pd ON p.parque_diversao_id = pd.id
GROUP BY pd.nome;

SELECT * FROM vw_visitas_detalhadas;

SELECT * FROM vw_despesas_por_parque;
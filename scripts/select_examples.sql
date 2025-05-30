-- a) Liste os nomes dos turistas, os nomes dos parques que visitaram e os nomes das atrações visitadas, ordenando os resultados pelo nome do turista em ordem alfabética.
SELECT
    t.nome AS nome_turista,
    pd.nome AS nome_parque,
    a.nome AS nome_atracao
FROM
    turista t
    JOIN visita v ON t.id = v.turista_id
    JOIN parque_diversao pd ON v.parque_diversao_id = pd.id
    JOIN atracao a ON a.parque_diversao_id = pd.id
ORDER BY t.nome;

-- b) Liste os nomes dos turistas, os nomes dos parques e os nomes das atrações visitadas, apenas para os turistas cujo nome comece com a letra ‘A’ e que tenham visitado após 01/01/2024. Ordene por data de entrada decrescente.
SELECT
    t.nome AS nome_turista,
    pd.nome AS nome_parque,
    a.nome AS nome_atracao
FROM
    turista t
    JOIN visita v ON t.id = v.turista_id
    JOIN parque_diversao pd ON v.parque_diversao_id = pd.id
    JOIN atracao a ON a.parque_diversao_id = pd.id
WHERE
    t.nome LIKE 'A%'
    AND v.data_hora_entrada > '2024-01-01'
ORDER BY v.data_hora_entrada DESC;

-- c) Liste os nomes dos turistas, nomes dos parques e valores de ingresso das visitas realizadas entre ‘2024-01-01’ e ‘2024-12-31’, onde o nome do parque contenha a palavra ‘Park’.
SELECT t.nome AS nome_turista, pd.nome AS nome_parque, v.valor_ingresso
FROM
    turista t
    JOIN visita v ON t.id = v.turista_id
    JOIN parque_diversao pd ON v.parque_diversao_id = pd.id
WHERE
    v.data_hora_entrada BETWEEN '2024-01-01' AND '2024-12-31'
    AND pd.nome LIKE '%Park%';

-- d) Mostre os nomes dos turistas, nomes dos parques e os valores das despesas feitas, apenas para os turistas com Estado em uma lista específica (ex: ‘RJ’, ‘SP’, ‘MG) e que possuam alguma despesa (não nula).
SELECT
    t.nome AS nome_turista,
    pd.nome AS nome_parque,
    d.valor AS valor_despesa
FROM
    turista t
    JOIN visita v ON t.id = v.turista_id
    JOIN despesa d ON v.numero_cartao_consumo = d.visita_numero_cartao_consumo
    JOIN parque_diversao pd ON v.parque_diversao_id = pd.id
WHERE
    t.estado IN ('RJ', 'SP', 'MG')
    AND d.valor IS NOT NULL;

-- e) Exiba a média de valor de ingresso por parque, agrupando por nome do parque e ordenando do maior para o menor valor médio de ingresso.
SELECT
    pd.nome AS nome_parque,
    AVG(v.valor_ingresso) AS media_valor_ingresso
FROM parque_diversao pd
    JOIN visita v ON pd.id = v.parque_diversao_id
GROUP BY
    pd.nome
ORDER BY media_valor_ingresso DESC;

-- f) Liste os nomes dos parques e a soma dos valores das despesas associadas, apenas para os parques cuja soma total das despesas supere R$ 10.000.
SELECT pd.nome AS nome_parque, SUM(d.valor) AS total_despesas
FROM
    despesa d
    JOIN parceria p ON d.parceria_parque_diversao_id = p.parque_diversao_id
    AND d.parceria_parceiro_comercial_id = p.parceiro_comercial_id
    JOIN parque_diversao pd ON p.parque_diversao_id = pd.id
GROUP BY
    pd.nome
HAVING
    SUM(d.valor) > 10000;

-- g) Liste os nomes dos parques cujo preço do ingresso seja maior que a média dos preços de ingresso de todos os parques.
SELECT nome
FROM parque_diversao
WHERE
    preco_ingresso > (
        SELECT AVG(preco_ingresso)
        FROM parque_diversao
    );

-- h) Liste os nomes dos turistas e seus respectivos valores de ingresso, apenas se o valor do ingresso da visita for maior que a média dos ingressos pagos por aquele turista.
SELECT t.nome AS nome_turista, v.valor_ingresso
FROM turista t
    JOIN visita v ON t.id = v.turista_id
WHERE
    v.valor_ingresso > (
        SELECT AVG(v2.valor_ingresso)
        FROM visita v2
        WHERE
            v2.turista_id = t.id
    );

-- i) Liste os nomes dos parques que possuem pelo menos uma parceria registrada com um parceiro comercial.
SELECT pd.nome
FROM parque_diversao pd
WHERE
    EXISTS (
        SELECT 1
        FROM parceria p
        WHERE
            p.parque_diversao_id = pd.id
    );

-- j) Liste os nomes dos turistas e a quantidade de visitas realizadas por cada um, apenas para os turistas que fizeram mais de 3 visitas.
SELECT
    t.nome AS nome_turista,
    COUNT(v.numero_cartao_consumo) AS quantidade_visitas
FROM turista t
    JOIN visita v ON t.id = v.turista_id
GROUP BY
    t.nome
HAVING
    COUNT(v.numero_cartao_consumo) > 3;
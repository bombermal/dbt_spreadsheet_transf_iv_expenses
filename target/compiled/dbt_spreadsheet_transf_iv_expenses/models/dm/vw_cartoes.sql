

with cartoes as (
	SELECT categoria
        , "data"
        , descricao
        , valor_total
        , parcelas
        , cartao
        , recorrencia
        , parcelas as orig_parc
	FROM "ivan_pessoal"."personal_expenses"."stg_cartoes"
)
, temp as (
    SELECT
        e.categoria,
        (e.data + (interval '1 month' * (gen - 1)))::date AS data,
        e.descricao,
        e.valor_total / e.parcelas AS valor_total,
        1 AS parcelas,
        e.cartao,
        e.recorrencia
    FROM cartoes e
    JOIN generate_series(1, e.parcelas) AS gen ON 1=1
)

select categoria
    , "data"
    , extract(year from "data") as ano
    , extract(month from "data") as mes
    , descricao
    , valor_total
    , parcelas
    , cartao
    , 'Saída' as natureza
    , recorrencia
     from temp
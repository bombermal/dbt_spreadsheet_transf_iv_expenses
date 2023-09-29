

with cartoes as (
    SELECT 
        categoria
        , TO_DATE("Data", 'DD/MM/YYYY')::DATE as data
        , "Descrição" as descricao
        , REPLACE(REPLACE(REPLACE(valor, 'R$', ''), '.', ''), ',', '.')::NUMERIC AS valor_total
        , "Nº Parcelas"::INTEGER as parcelas
        , "Cartão" as cartao
        , "Recorrência" as recorrencia
    FROM personal_expenses.cartoes
)

select * from cartoes


with movimentacao as (
    SELECT 
        TO_DATE("Data", 'DD/MM/YYYY')::DATE as data
        , "Descrição" as descricao
        , REPLACE(REPLACE(REPLACE(valor, 'R$', ''), '.', ''), ',', '.')::NUMERIC AS valor_total
        , origem
        , destino
    FROM personal_expenses.movimentacao
)

select * from movimentacao
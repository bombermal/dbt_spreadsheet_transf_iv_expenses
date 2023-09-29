{{
  config(
    materialized = 'table',
    )
}}

with extrato as (
    SELECT 
        categoria
        , TO_DATE("Data", 'DD/MM/YYYY')::DATE as data
        , "Descrição" as descricao
        , REPLACE(REPLACE(REPLACE(valor, 'R$', ''), '.', ''), ',', '.')::NUMERIC AS valor_total
        , "Código Conta" as cod_conta
        , natureza
        , "Recorrência" as recorrencia
    FROM personal_expenses.extrato
)

select * from extrato


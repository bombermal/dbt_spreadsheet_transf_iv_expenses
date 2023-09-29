
  
    

  create  table "ivan_pessoal"."personal_expenses"."stg_cartoes__dbt_tmp"
  
  
    as
  
  (
    

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
  );
  
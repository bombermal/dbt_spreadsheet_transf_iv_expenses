
  
    

  create  table "ivan_pessoal"."personal_expenses"."stg_consolidado__dbt_tmp"
  
  
    as
  
  (
    

with consolidado as (
    SELECT 
        categoria
        , TO_DATE("Data", 'DD/MM/YYYY')::DATE as data
        , "Descrição" as descricao
        , REPLACE(REPLACE(REPLACE(valor, 'R$', ''), '.', ''), ',', '.')::NUMERIC AS valor_total
        , "Código Conta" as cod_conta
        , natureza
        , "Recorrência" as recorrencia
    FROM personal_expenses.consolidado
)

select * from consolidado
  );
  
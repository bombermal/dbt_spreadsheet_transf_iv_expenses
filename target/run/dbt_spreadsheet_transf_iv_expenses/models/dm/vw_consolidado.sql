
  
    

  create  table "ivan_pessoal"."personal_expenses"."vw_consolidado__dbt_tmp"
  
  
    as
  
  (
    

with consolidado as (
    SELECT 
        categoria
        , data
        , extract(year from data) as ano
        , extract(month from data) as mes
        , descricao
        , valor_total
        , cod_conta
        , natureza
        , recorrencia
    FROM "ivan_pessoal"."personal_expenses"."stg_consolidado"
)

select * from consolidado
  );
  
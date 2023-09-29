{{
  config(
    materialized = 'table',
    )
}}

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
    FROM {{ref('stg_consolidado')}}
)

select * from consolidado


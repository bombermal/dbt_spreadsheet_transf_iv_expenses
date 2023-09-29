{{
  config(
    materialized = 'table',
    )
}}

with extrato as (
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
    FROM  {{ref('stg_extrato')}}
)
, movimentacao as (
	select 'Movimentação' as categoria
		, data
        , extract(year from data) as ano
        , extract(month from data) as mes
		, descricao
		, valor_total
		, origem as cod_conta
		, 'Saída' as natureza
		, 'Única' as recorrencia
		from {{ref('stg_movimentacao')}}
	union all
	select 'Movimentação' as categoria
		, data
        , extract(year from data) as ano
        , extract(month from data) as mes
		, descricao
		, valor_total
		, destino as cod_conta
		, 'Entrada' as natureza
		, 'Única' as recorrencia
		from {{ref('stg_movimentacao')}}
)
, consolidado as (
	select * from {{ref('vw_consolidado')}}
)
select * from consolidado
union all
select * from extrato
union all
select * from movimentacao

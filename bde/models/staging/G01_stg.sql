{{
    config(
        unique_key='lga_code'
    )
}}

with

source  as (

    select * from {{ source('raw', 'census_g01_nsw_lga') }}

),

lga as (
    SELECT
    	cast(replace(lga_code_2016, 'LGA', '') as integer) as lga_code,
        *
    from source
)


select * from lga
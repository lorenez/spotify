{# Ideally we could users as a table from the application, but for this exercise this will suffice #}

with source as (

    select
        owner,
        owner_country

    from {{ ref('seed_playlist_revision_v02') }}

),

rename as (

    select distinct
        owner as id,
        owner_country as user_country

    from source

)

select * from rename

with source as (

    select
        genre_1,
        genre_2,
        genre_3

    from {{ ref('seed_playlist_revision_v02') }}

),

unioned as (

    {#  while there are only 26 genres right now in each column, this could help us verify that in the future
        we do not accidentally overloom other genres. it would be better to have a genres tables that
        feeds the definitions of what genres are available from elsewhere. #}
    select distinct genre_1 as genre from source
    union all
    select distinct genre_2 from source
    union all
    select distinct genre_3 from source

),

final as (

    select distinct
        {{ rename_category('genre') }} as genre

    from unioned

)

select * from final

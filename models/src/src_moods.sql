with source as (

    select
        mood_1,
        mood_2,
        mood_3

    from {{ ref('seed_playlist_revision_v02') }}

),

unioned as (

    {#  while there are only 27 moods right now in each column, this could help us verify that in the future
        we do not accidentally overlook other moods. it would be better to have a moods tables that
        feeds the definitions of what moods are available from elsewhere. #}
    select distinct mood_1 as mood from source
    union all
    select distinct mood_2 from source
    union all
    select distinct mood_3 from source

),

final as (

    select distinct
        {{ rename_category('mood') }} as mood

    from unioned

)

select * from final

with

playlists as (
    select
        *,
        case
        when owner_id = 'spotify'
        then true
        else false
        end as is_spotify_playlist

    from {{ ref('src_playlists') }}
),

count_tokens as (

    select
        playlist_uri,
        count(tokens) as num_tokens

    from spotify.src_playlists,
    {#  The below selection is excessive for the purposes of only counting because it does some
        cleanup on the tokens so it would be possible to later analyze the tokens individually.
        I am using BigQuery and it is not possible to split tokens into new rows. For the purposes
        of what I am doing now I am going to leave this here, but retain the count on tokens #}
    unnest(
        split(
            replace(
                trim(
                    replace(tokens, ' ', ''),
                '[]'),
            '"', ''),
        ',')
    )

    group by 1

),

final as (

    select * from playlists
    left join count_tokens using (playlist_uri)

)

select * from final

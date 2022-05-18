with

playlists as (
    select * from {{ ref('prep_playlists') }}
    where is_spotify_playlist
),

{#  it is important to do this standalone and not in all_playlists because this gives the percent rank only for
    spotify playlists #}
playlist_percentage_ranks as (

    select
        playlist_uri,
        round(percent_rank() over(order by num_streams), 2)               as num_streams_perc_rank,
        round(percent_rank() over(order by num_streams_30s), 2)           as num_streams_30s_perc_rank,
        round(percent_rank() over(order by daily_active_users), 2)        as daily_active_users_perc_rank,
        round(percent_rank() over(order by weekly_active_users), 2)       as weekly_active_users_perc_rank,
        round(percent_rank() over(order by monthly_active_users), 2)      as monthly_active_users_perc_rank,
        round(percent_rank() over(order by mau_previous_month), 2)        as mau_previous_month_perc_rank,
        round(percent_rank() over(order by mau_both_months), 2)           as mau_both_months_perc_rank,
        round(percent_rank() over(order by num_users), 2)                 as num_users_perc_rank,
        round(percent_rank() over(order by num_skippers), 2)              as num_skippers_perc_rank,
        round(percent_rank() over(order by num_tracks), 2)                as num_tracks_perc_rank,
        round(percent_rank() over(order by num_local_tracks), 2)          as num_local_tracks_perc_rank,
        round(percent_rank() over(order by num_artists), 2)               as num_artists_perc_rank,
        round(percent_rank() over(order by num_albums), 2)                as num_albums_perc_rank,
        round(percent_rank() over(order by monthly_stream30s), 2)         as monthly_stream30s_perc_rank,
        round(percent_rank() over(order by monthly_owner_stream30s), 2)   as monthly_owner_stream30s_perc_rank

    from playlists

),

final as (

    select
        playlists.*,
        playlist_percentage_ranks.num_streams_perc_rank,
        playlist_percentage_ranks.num_streams_30s_perc_rank,
        playlist_percentage_ranks.daily_active_users_perc_rank,
        playlist_percentage_ranks.weekly_active_users_perc_rank,
        playlist_percentage_ranks.monthly_active_users_perc_rank,
        playlist_percentage_ranks.mau_previous_month_perc_rank,
        playlist_percentage_ranks.mau_both_months_perc_rank,
        playlist_percentage_ranks.num_users_perc_rank,
        playlist_percentage_ranks.num_skippers_perc_rank,
        playlist_percentage_ranks.num_tracks_perc_rank,
        playlist_percentage_ranks.num_local_tracks_perc_rank,
        playlist_percentage_ranks.num_artists_perc_rank,
        playlist_percentage_ranks.num_albums_perc_rank,
        playlist_percentage_ranks.monthly_stream30s_perc_rank,
        playlist_percentage_ranks.monthly_owner_stream30s_perc_rank

    from playlists
    left join playlist_percentage_ranks
        on playlists.playlist_uri = playlist_percentage_ranks.playlist_uri

)

select * from final

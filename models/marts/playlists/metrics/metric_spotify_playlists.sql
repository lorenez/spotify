with

spotify_playlists as (

    select * from {{ ref('spotify_playlists') }}

)

select
        round(avg(num_streams), 0)              as avg_num_streams,
        round(avg(num_streams_30s), 0)          as avg_num_streams_30s,
        round(avg(daily_active_users), 0)       as avg_daily_active_users,
        round(avg(weekly_active_users), 0)      as avg_weekly_active_users,
        round(avg(monthly_active_users), 0)     as avg_monthly_active_users,
        round(avg(mau_previous_month), 0)       as avg_mau_previous_month,
        round(avg(mau_both_months), 0)          as avg_mau_both_months,
        round(avg(num_users), 0)                as avg_num_users,
        round(avg(num_skippers), 0)             as avg_num_skippers,
        round(avg(num_tracks), 0)               as avg_num_tracks,
        round(avg(num_local_tracks), 0)         as avg_num_local_tracks,
        round(avg(num_artists), 0)              as avg_num_artists,
        round(avg(num_albums), 0)               as avg_num_albums,
        round(avg(monthly_stream30s), 0)        as avg_monthly_stream30s,
        round(avg(monthly_owner_stream30s), 0)  as avg_monthly_owner_stream30s,

        max(num_streams)                        as max_num_streams,
        max(num_streams_30s)                    as max_num_streams_30s,
        max(daily_active_users)                 as max_daily_active_users,
        max(weekly_active_users)                as max_weekly_active_users,
        max(monthly_active_users)               as max_monthly_active_users,
        max(mau_previous_month)                 as max_mau_previous_month,
        max(mau_both_months)                    as max_mau_both_months,
        max(num_users)                          as max_num_users,
        max(num_skippers)                       as max_num_skippers,
        max(num_tracks)                         as max_num_tracks,
        max(num_local_tracks)                   as max_num_local_tracks,
        max(num_artists)                        as max_num_artists,
        max(num_albums)                         as max_num_albums,
        max(monthly_stream30s)                  as max_monthly_stream30s,
        max(monthly_owner_stream30s)            as max_monthly_owner_stream30s,

        min(num_streams)                        as min_num_streams,
        min(num_streams_30s)                    as min_num_streams_30s,
        min(daily_active_users)                 as min_daily_active_users,
        min(weekly_active_users)                as min_weekly_active_users,
        min(monthly_active_users)               as min_monthly_active_users,
        min(mau_previous_month)                 as min_mau_previous_month,
        min(mau_both_months)                    as min_mau_both_months,
        min(num_users)                          as min_num_users,
        min(num_skippers)                       as min_num_skippers,
        min(num_tracks)                         as min_num_tracks,
        min(num_local_tracks)                   as min_num_local_tracks,
        min(num_artists)                        as min_num_artists,
        min(num_albums)                         as min_num_albums,
        min(monthly_stream30s)                  as min_monthly_stream30s,
        min(monthly_owner_stream30s)            as min_monthly_owner_stream30s,

        count(distinct owner_country)           as num_distinct_countries,
        count(distinct owner_id)                as num_distinct_owners,
        count(playlist_uri)                     as num_playlists,
        sum(num_streams)                        as total_num_streams,
        sum(num_streams_30s)                    as total_num_streams_30s,
        sum(monthly_stream30s)                  as total_num_monthly_streams_30s


from spotify_playlists

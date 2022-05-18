with source as (

    select
        playlist_uri,
        owner,
        streams,
        stream30s,
        dau,
        wau,
        mau,
        mau_previous_month,
        mau_both_months,
        users,
        skippers,
        owner_country,
        n_tracks,
        n_local_tracks,
        n_artists,
        n_albums,
        monthly_stream30s,
        monthly_owner_stream30s,
        tokens,
        genre_1,
        genre_2,
        genre_3,
        mood_1,
        mood_2,
        mood_3

    from {{ ref('seed_playlist_revision_v02') }}

),

rename as (

    select
        playlist_uri,
        owner                               as owner_id,
        streams                             as num_streams,
        stream30s                           as num_streams_30s,
        dau                                 as daily_active_users,
        wau                                 as weekly_active_users,
        mau                                 as monthly_active_users,
        mau_previous_month,
        mau_both_months,
        users                               as num_users,
        skippers                            as num_skippers,
        owner_country,
        n_tracks                            as num_tracks,
        n_local_tracks                      as num_local_tracks,
        n_artists                           as num_artists,
        n_albums                            as num_albums,
        monthly_stream30s,
        monthly_owner_stream30s,
        tokens, {# TODO: This needs to convert to UTF-8 encoding and remove the special characters #}
        {{ rename_category('genre_1') }}    as genre_1,
        {{ rename_category('genre_2') }}    as genre_2,
        {{ rename_category('genre_3') }}    as genre_3,
        {{ rename_category('mood_1') }}     as mood_1,
        {{ rename_category('mood_2') }}     as mood_2,
        {{ rename_category('mood_3') }}     as mood_3

    from source

)

select * from rename

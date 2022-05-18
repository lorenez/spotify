with

moods as (
  select * from {{ ref('moods') }}
),

spotify_playlists as (
    select * from {{ ref('spotify_playlists') }}
),

mood_1 as (

  select
    mood_1 as mood,
    count(mood_1) as num_mood_1_appearances

  from spotify_playlists
  group by 1

),

mood_2 as (

  select
    mood_2 as mood,
    count(mood_2) as num_mood_2_appearances
  from spotify_playlists
  group by 1

),

mood_3 as (

  select
    mood_3 as mood,
    count(mood_3) as num_mood_3_appearances
  from spotify_playlists
  group by 1

),

final as (

  select
    moods.mood,
    num_mood_1_appearances,
    num_mood_2_appearances,
    num_mood_3_appearances

  from moods
  left join mood_1 using (mood)
  left join mood_2 using (mood)
  left join mood_3 using (mood)

)

select * from final

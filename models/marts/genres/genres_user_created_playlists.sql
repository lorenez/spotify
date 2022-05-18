with

genres as (
  select * from {{ ref('genres') }}
),

user_created_playlists as (
    select * from {{ ref('user_created_playlists') }}
),

genre_1 as (

  select
    genre_1 as genre,
    count(genre_1) as num_genre_1_appearances

  from user_created_playlists
  group by 1

),

genre_2 as (

  select
    genre_2 as genre,
    count(genre_2) as num_genre_2_appearances
  from user_created_playlists
  group by 1

),

genre_3 as (

  select
    genre_3 as genre,
    count(genre_3) as num_genre_3_appearances
  from user_created_playlists
  group by 1

),

final as (

  select
    genres.genre,
    num_genre_1_appearances,
    num_genre_2_appearances,
    num_genre_3_appearances

  from genres
  left join genre_1 using (genre)
  left join genre_2 using (genre)
  left join genre_3 using (genre)

)

select * from final

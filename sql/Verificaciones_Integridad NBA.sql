USE NBA_Player_Performance_DB;

-- Verificar duplicados en dim_player_info (no debería haber duplicados en player_id)
SELECT player_id, COUNT(*)
FROM dim_player_info
GROUP BY player_id
HAVING COUNT(*) > 1;

-- Verificar valores nulos en columnas críticas de dim_player_info
SELECT *
FROM dim_player_info
WHERE player_id IS NULL
   OR player_name IS NULL
   OR salary IS NULL;

-- Verificar duplicados en dim_game_info (no debería haber duplicados en game_id)
SELECT game_id, COUNT(*)
FROM dim_game_info
GROUP BY game_id
HAVING COUNT(*) > 1;

-- Verificar valores nulos en columnas críticas de dim_game_info
SELECT *
FROM dim_game_info
WHERE game_id IS NULL
   OR game_date IS NULL;

-- Verificar duplicados en dim_team (no debería haber duplicados en team_id)
SELECT team_id, COUNT(*)
FROM dim_team
GROUP BY team_id
HAVING COUNT(*) > 1;

-- Verificar valores nulos en columnas críticas de dim_team
SELECT *
FROM dim_team
WHERE team_id IS NULL
   OR full_name IS NULL
   OR team_abbreviation IS NULL
   OR city IS NULL
   OR state IS NULL
   OR year_founded IS NULL;

-- Verificar duplicados en dim_season (no debería haber duplicados en season_id)
SELECT season_id, COUNT(*)
FROM dim_season
GROUP BY season_id
HAVING COUNT(*) > 1;

-- Verificar valores nulos en columnas críticas de dim_season
SELECT *
FROM dim_season
WHERE season_id IS NULL
   OR start_date IS NULL
   OR end_date IS NULL;

-- Verificar duplicados en fact_game_stats (no debería haber duplicados en las claves primarias compuestas)
SELECT season_id, game_id, team_id_home, team_id_away, COUNT(*)
FROM fact_game_stats
GROUP BY season_id, game_id, team_id_home, team_id_away
HAVING COUNT(*) > 1;

-- Verificar valores nulos en columnas críticas de fact_game_stats
SELECT *
FROM fact_game_stats
WHERE season_id IS NULL
   OR game_id IS NULL
   OR team_id_home IS NULL
   OR team_id_away IS NULL
   OR game_date IS NULL;

-- Verificar duplicados en fact_player_stats (no debería haber duplicados en primary_key_composed)
SELECT primary_key_composed, COUNT(*)
FROM fact_player_stats
GROUP BY primary_key_composed
HAVING COUNT(*) > 1;

-- Verificar valores nulos en columnas críticas de fact_player_stats
SELECT *
FROM fact_player_stats
WHERE primary_key_composed IS NULL
   OR player_id IS NULL
   OR player_name IS NULL
   OR position IS NULL
   OR age IS NULL
   OR team_id IS NULL
   OR season_id IS NULL;


-- Verificar duplicados en fact_draft (no debería haber duplicados en draft_id)
SELECT draft_id, COUNT(*)
FROM fact_draft
GROUP BY draft_id
HAVING COUNT(*) > 1;

-- Verificar valores nulos en columnas críticas de fact_draft
SELECT *
FROM fact_draft
WHERE draft_id IS NULL
   OR player_name IS NULL
   OR draft_season IS NULL
   OR team_id IS NULL;

-- Verificar integridad referencial: Fact tables vs Dim tables

-- Verificar si hay game_id en fact_game_stats que no existan en dim_game_info
SELECT DISTINCT fg.game_id
FROM fact_game_stats fg
LEFT JOIN dim_game_info dg ON fg.game_id = dg.game_id
WHERE dg.game_id IS NULL;

-- Verificar si hay player_id en fact_player_stats que no existan en dim_player_info
SELECT DISTINCT fp.player_id
FROM fact_player_stats fp
LEFT JOIN dim_player_info dp ON fp.player_id = dp.player_id
WHERE dp.player_id IS NULL;

-- Verificar si hay team_id en fact_game_stats (home) que no existan en dim_team
SELECT DISTINCT fg.team_id_home
FROM fact_game_stats fg
LEFT JOIN dim_team dt ON fg.team_id_home = dt.team_id
WHERE dt.team_id IS NULL;

-- Verificar si hay season_id en fact_game_stats que no existan en dim_season
SELECT DISTINCT fg.season_id
FROM fact_game_stats fg
LEFT JOIN dim_season ds ON fg.season_id = ds.season_id
WHERE ds.season_id IS NULL;

-- Verificar valores nulos en columnas críticas de fact_team_stats

SELECT *
FROM fact_team_stats
WHERE season_id IS NULL
   OR team_id IS NULL
   OR team_abbreviation IS NULL
   OR fgm IS NULL
   OR fga IS NULL
   OR fg_pct IS NULL
   OR fg3m IS NULL
   OR fg3a IS NULL
   OR fg3_pct IS NULL
   OR ftm IS NULL
   OR fta IS NULL
   OR ft_pct IS NULL
   OR oreb IS NULL
   OR dreb IS NULL
   OR reb IS NULL
   OR ast IS NULL
   OR stl IS NULL
   OR blk IS NULL
   OR tov IS NULL
   OR pf IS NULL
   OR pts IS NULL
   OR plus_minus IS NULL
   OR pie_denominador IS NULL;

-- Verificar valores duplicados en la columna primary_key_composed de fact_player_stats
SELECT primary_key_composed, COUNT(*)
FROM fact_player_stats
GROUP BY primary_key_composed
HAVING COUNT(*) > 1;

-- Verificar valores duplicados en combinación de season_id y team_id en fact_team_stats
SELECT season_id, team_id, COUNT(*)
FROM fact_team_stats
GROUP BY season_id, team_id
HAVING COUNT(*) > 1;

-- Verificar equipos que no existen en dim_team
SELECT DISTINCT team_id
FROM fact_team_stats
WHERE team_id NOT IN (SELECT team_id FROM dim_team);

-- Verificar temporadas que no existen en dim_season
SELECT DISTINCT season_id
FROM fact_team_stats
WHERE season_id NOT IN (SELECT season_id FROM dim_season);

-- Verificar jugadores que no existen en dim_player_info
SELECT DISTINCT player_id
FROM fact_player_stats
WHERE player_id NOT IN (SELECT player_id FROM dim_player_info);

-- Verificar equipos que no existen en dim_team
SELECT DISTINCT team_id
FROM fact_player_stats
WHERE team_id NOT IN (SELECT team_id FROM dim_team);

-- Verificar jugadores que no existen en dim_player_info
SELECT DISTINCT player_id
FROM fact_player_stats
WHERE player_id NOT IN (SELECT player_id FROM dim_player_info);

-- Verificar equipos que no existen en dim_team
SELECT DISTINCT team_id
FROM fact_player_stats
WHERE team_id NOT IN (SELECT team_id FROM dim_team);

-- Verificar temporadas que no existen en dim_season
SELECT DISTINCT season_id
FROM fact_player_stats
WHERE season_id NOT IN (SELECT season_id FROM dim_season);
;

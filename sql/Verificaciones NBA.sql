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
   OR pos IS NULL
   OR age IS NULL
   OR team_abbrevation IS NULL
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

select * from dim_game_info

select* from fact_game_stats
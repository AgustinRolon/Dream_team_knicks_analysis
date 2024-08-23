
USE NBA_Player_Performance_DB

-- Flujo de importacion de los datos:

-- CARGA DE DATOS EN LA TABLA dim_player_info
BULK INSERT dim_player_info
FROM 'C:\CSV Carga\player_info_final.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT TOP (5)* FROM dim_player_info 

-- CARGA DE DATOS EN LA TABLA dim_game_info
BULK INSERT dim_game_info
FROM 'C:\CSV Carga\game_info_filtrado.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Consultar la tabla:
SELECT TOP (5)* FROM dim_game_info


-- CARGA DE DATOS EN LA TABLA dim_team 
BULK INSERT dim_team
FROM 'C:\CSV Carga\team_completo_filtrado.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Consultar la tabla:
SELECT TOP (5)* FROM dim_team


-- CARGA DE DATOS EN LA TABLA dim_season 
BULK INSERT dim_season
FROM 'C:\CSV Carga\seasons.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Consultar la tabla:
SELECT TOP (5)* FROM dim_season


-- CARGA DE DATOS EN LA TABLA fact_game_stats 
BULK INSERT fact_game_stats
FROM 'C:\CSV Carga\game_filtrado.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Consultar la tabla:
SELECT TOP (5)* FROM fact_game_stats


--CARGA DE DATOS EN LA TABLA fact_player_stats 
BULK INSERT fact_player_stats
FROM 'C:\CSV Carga\player_final_merged_with_stats.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Consultar la tabla:
SELECT TOP (5)* FROM fact_player_stats


--CARGA DE DATOS EN LA TABLA fact_draft 
BULK INSERT fact_draft
FROM 'C:\CSV Carga\draft_completo.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Consultar la tabla:
SELECT TOP (5)* FROM fact_draft

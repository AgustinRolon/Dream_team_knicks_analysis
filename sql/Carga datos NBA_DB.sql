
USE NBA_Player_Performance_DB

-- Flujo de importacion de los datos:

-- CARGA DE DATOS EN LA TABLA dim_player_info
BULK INSERT dim_player_info
FROM 'C:\pie carga\player_info_final.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT TOP (5)* FROM dim_player_info 

-- CARGA DE DATOS EN LA TABLA dim_game_info
BULK INSERT dim_game_info
FROM 'C:\pie carga\game_info_filtrado.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Consultar la tabla:
SELECT TOP (5)* FROM dim_game_info


-- CARGA DE DATOS EN LA TABLA dim_team 
BULK INSERT dim_team
FROM 'C:\pie carga\team_completo_filtrado.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Consultar la tabla:
SELECT TOP (5)* FROM dim_team


-- CARGA DE DATOS EN LA TABLA dim_season 
BULK INSERT dim_season
FROM 'C:\pie carga\seasons.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Consultar la tabla:
SELECT TOP (5)* FROM dim_season


-- CARGA DE DATOS EN LA TABLA fact_game_stats 
BULK INSERT fact_game_stats
FROM 'C:\pie carga\game_filtrado.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Consultar la tabla:
SELECT TOP (5)* FROM fact_game_stats

--CARGA DE DATOS EN LA TABLA fact_player_stats
BULK INSERT fact_player_stats
FROM 'C:\pie carga\player_stats_with_ML.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Consultar la tabla:
SELECT TOP (5)* FROM fact_player_stats


--CARGA DE DATOS EN LA TABLA fact_draft 
BULK INSERT fact_draft
FROM 'C:\pie carga\draft_completo.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Consultar la tabla:
SELECT TOP (5)* FROM fact_draft

--CARGA DE DATOS EN LA TABLA fact_team_stats 
BULK INSERT fact_team_stats
FROM 'C:\pie carga\team_stats_filtrado.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


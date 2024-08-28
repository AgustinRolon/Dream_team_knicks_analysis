USE NBA_Player_Performance_DB;
GO

CREATE PROCEDURE sp_CargarDatos
AS
BEGIN
    -- CARGA DE DATOS EN LA TABLA dim_player_info
    BULK INSERT dim_player_info
    FROM 'C:\CSV Carga\player_info_final.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2
    );

    -- CARGA DE DATOS EN LA TABLA dim_game_info
    BULK INSERT dim_game_info
    FROM 'C:\CSV Carga\game_info_filtrado.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2
    );

    -- CARGA DE DATOS EN LA TABLA dim_team 
    BULK INSERT dim_team
    FROM 'C:\CSV Carga\team_completo_filtrado.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2
    );

    -- CARGA DE DATOS EN LA TABLA dim_season 
    BULK INSERT dim_season
    FROM 'C:\CSV Carga\seasons.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2
    );

    -- CARGA DE DATOS EN LA TABLA fact_game_stats 
    BULK INSERT fact_game_stats
    FROM 'C:\CSV Carga\game_filtrado.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2
    );

    -- CARGA DE DATOS EN LA TABLA fact_player_stats 
    BULK INSERT fact_player_stats
    FROM 'C:\CSV Carga\player_final_merged_with_stats.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2
    );

    -- CARGA DE DATOS EN LA TABLA fact_draft 
    BULK INSERT fact_draft
    FROM 'C:\CSV Carga\draft_completo.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2
    );
END;
GO

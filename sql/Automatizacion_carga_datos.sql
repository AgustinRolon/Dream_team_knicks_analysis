USE NBA_Player_Performance_DB;
GO

CREATE PROCEDURE Load_All_Data
AS
BEGIN
    -- Cargar datos en la tabla dim_player_info
    BEGIN TRY
        PRINT 'Cargando datos en dim_player_info...';
        BULK INSERT dim_player_info
        FROM 'C:\pie carga\player_info_final.csv'
        WITH (
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            FIRSTROW = 2
        );
        SELECT TOP (5) * FROM dim_player_info;
    END TRY
    BEGIN CATCH
        PRINT 'Error al cargar datos en dim_player_info: ' + ERROR_MESSAGE();
    END CATCH;

    -- Cargar datos en la tabla dim_game_info
    BEGIN TRY
        PRINT 'Cargando datos en dim_game_info...';
        BULK INSERT dim_game_info
        FROM 'C:\pie carga\game_info_filtrado.csv'
        WITH (
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            FIRSTROW = 2
        );
        SELECT TOP (5) * FROM dim_game_info;
    END TRY
    BEGIN CATCH
        PRINT 'Error al cargar datos en dim_game_info: ' + ERROR_MESSAGE();
    END CATCH;

    -- Cargar datos en la tabla dim_team
    BEGIN TRY
        PRINT 'Cargando datos en dim_team...';
        BULK INSERT dim_team
        FROM 'C:\pie carga\team_completo_filtrado.csv'
        WITH (
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            FIRSTROW = 2
        );
        SELECT TOP (5) * FROM dim_team;
    END TRY
    BEGIN CATCH
        PRINT 'Error al cargar datos en dim_team: ' + ERROR_MESSAGE();
    END CATCH;

    -- Cargar datos en la tabla dim_season
    BEGIN TRY
        PRINT 'Cargando datos en dim_season...';
        BULK INSERT dim_season
        FROM 'C:\pie carga\seasons.csv'
        WITH (
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            FIRSTROW = 2
        );
        SELECT TOP (5) * FROM dim_season;
    END TRY
    BEGIN CATCH
        PRINT 'Error al cargar datos en dim_season: ' + ERROR_MESSAGE();
    END CATCH;

    -- Cargar datos en la tabla fact_game_stats
    BEGIN TRY
        PRINT 'Cargando datos en fact_game_stats...';
        BULK INSERT fact_game_stats
        FROM 'C:\pie carga\game_filtrado.csv'
        WITH (
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            FIRSTROW = 2
        );
        SELECT TOP (5) * FROM fact_game_stats;
    END TRY
    BEGIN CATCH
        PRINT 'Error al cargar datos en fact_game_stats: ' + ERROR_MESSAGE();
    END CATCH;

    -- Cargar datos en la tabla fact_player_stats
    BEGIN TRY
        PRINT 'Cargando datos en fact_player_stats...';
        BULK INSERT fact_player_stats
        FROM 'C:\pie carga\player_stats_ultimate.csv'
        WITH (
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            FIRSTROW = 2
        );
        SELECT TOP (5) * FROM fact_player_stats;
    END TRY
    BEGIN CATCH
        PRINT 'Error al cargar datos en fact_player_stats: ' + ERROR_MESSAGE();
    END CATCH;

    -- Cargar datos en la tabla fact_draft
    BEGIN TRY
        PRINT 'Cargando datos en fact_draft...';
        BULK INSERT fact_draft
        FROM 'C:\pie carga\draft_completo.csv'
        WITH (
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            FIRSTROW = 2
        );
        SELECT TOP (5) * FROM fact_draft;
    END TRY
    BEGIN CATCH
        PRINT 'Error al cargar datos en fact_draft: ' + ERROR_MESSAGE();
    END CATCH;

    -- Cargar datos en la tabla fact_team_stats
    BEGIN TRY
        PRINT 'Cargando datos en fact_team_stats...';
        BULK INSERT fact_team_stats
        FROM 'C:\pie carga\team_stats_filtrado.csv'
        WITH (
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            FIRSTROW = 2
        );
        SELECT TOP (5) * FROM fact_team_stats;
    END TRY
    BEGIN CATCH
        PRINT 'Error al cargar datos en fact_team_stats: ' + ERROR_MESSAGE();
    END CATCH;
END;
GO

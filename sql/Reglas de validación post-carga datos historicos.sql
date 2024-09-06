--Reglas de validacion post-carga de datos historicos.

USE NBA_Player_Performance_DB;

-- Agregar la restricción de fecha en dim_game_info a partir de la temporada 23/24.
CREATE TRIGGER trg_game_info_date_validation
ON dim_game_info
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE game_date < '2023-10-24')
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR ('No se pueden insertar registros con game_date anterior al 24 de octubre de 2023.', 16, 1);
    END
END;

-- Agregar la restricción de fecha en dim_season a partir de la season 23/24.
CREATE TRIGGER trg_season_date_validation
ON dim_season
AFTER INSERT, UPDATE
AS
BEGIN
    -- Verificar si alguno de los registros nuevos o actualizados tiene una start_date anterior al 24 de octubre de 2023
    IF EXISTS (SELECT * FROM inserted WHERE start_date < '2023-10-24')
    BEGIN
        -- Si se encuentra algún registro no válido, se revierte la transacción
        ROLLBACK TRANSACTION;
        
        -- Lanzar un error que explique la razón del rollback
        RAISERROR ('No se pueden insertar o actualizar registros en dim_season con start_date anterior al 24 de octubre de 2023.', 16, 1);
    END
END;

-- Agregar la restricción de fecha en fact_game_stats a partir de la temporada 23/24.
CREATE TRIGGER trg_fact_game_date_validation
ON fact_game_stats
AFTER INSERT, UPDATE
AS
BEGIN
    -- Verificar si alguno de los registros nuevos o actualizados tiene un game_date anterior al 24 de octubre de 2023
    IF EXISTS (SELECT * FROM inserted WHERE game_date < '2023-10-24')
    BEGIN
        -- Si se encuentra algún registro no válido, se revierte la transacción
        ROLLBACK TRANSACTION;
        
        -- Lanzar un error que explique la razón del rollback
        RAISERROR ('No se pueden insertar o actualizar registros en fact_game_stats con game_date anterior al 24 de octubre de 2023.', 16, 1);
    END
END;



USE NBA_Player_Performance_DB;

CREATE TRIGGER trg_fact_draft_season_validation
ON fact_draft
AFTER INSERT, UPDATE
AS
BEGIN
    -- Verificar que draft_season sea mayor o igual a 2004
    IF EXISTS (SELECT * FROM inserted WHERE draft_season < '2023-10-24')
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR ('El año de la temporada de draft (draft_season) debe ser 2004 o posterior.', 16, 1);
    END
END;





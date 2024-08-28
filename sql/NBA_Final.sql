CREATE DATABASE	 NBA_Player_Performance_DB
ON
( NAME = 'NBA_Player_Performance_DB_Data',
  FILENAME = 'C:\sql\NBA_Player_Performance_DB.mdf',
  SIZE = 50MB,
  MAXSIZE = 1GB,
  FILEGROWTH = 5MB )
LOG ON
( NAME = 'NBA_Player_Performance_DB_Log',
  FILENAME = 'C:\sql\NBA_Player_Performance_DB.ldf',
  SIZE = 50MB,
  MAXSIZE = 1GB,
  FILEGROWTH = 5MB );

USE NBA_Player_Performance_DB;

-- Tabla dim_player_info
CREATE TABLE dim_player_info (
    player_id INT PRIMARY KEY NOT NULL,
    player_name VARCHAR(255) NOT NULL,
	salary INT NOT NULL CHECK (salary >= 0)
);

--Tabla dim_game_info
CREATE TABLE dim_game_info (
    game_id INT PRIMARY KEY NOT NULL,
    game_date DATE NOT NULL,
    attendance INT CHECK (attendance >= 0)
);

--Tabla dim_team
CREATE TABLE dim_team (
    team_id INT PRIMARY KEY NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    team_abbreviation VARCHAR(5) NOT NULL,
    nickname VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    year_founded INT NOT NULL CHECK (year_founded >= 1900),
    arena VARCHAR(255) NOT NULL,
    arenacapacity INT NOT NULL CHECK (arenacapacity > 0),
    headcoach VARCHAR(255)
);

--Tabla dim_season
CREATE TABLE dim_season (
	season_id INT PRIMARY KEY NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	CHECK (start_date < end_date)
)

--Tabla fact_game_stats
CREATE TABLE fact_game_stats (
    season_id INT NOT NULL, 
    team_id_home INT NOT NULL,
    team_abbreviation_home VARCHAR(5) NOT NULL,
    team_name_home VARCHAR(255) NOT NULL,
    game_id INT NOT NULL,
    game_date date NOT NULL,
    matchup_home VARCHAR(255) NOT NULL,
    wl_home VARCHAR(1) NOT NULL CHECK (wl_home IN ('W', 'L')),
    game_minutes int NOT NULL CHECK (game_minutes >= 0),
    fgm_home FLOAT,
    fga_home FLOAT,
    fg_pct_home FLOAT,
    fg3m_home FLOAT,
    fg3a_home FLOAT,
    fg3_pct_home FLOAT,
    ftm_home FLOAT,
    fta_home FLOAT,
    ft_pct_home FLOAT,
    oreb_home FLOAT,
    dreb_home FLOAT,
    reb_home FLOAT,
    ast_home FLOAT,
    stl_home FLOAT,
    blk_home FLOAT,
    tov_home FLOAT,
    pf_home FLOAT,
    pts_home FLOAT,
    plus_minus_home INT,
    team_id_away INT NOT NULL,
    team_abbreviation_away VARCHAR(5) NOT NULL,
    team_name_away VARCHAR(255) NOT NULL,
    matchup_away VARCHAR(255) NOT NULL,
    wl_away VARCHAR(1) NOT NULL CHECK (wl_away IN ('W', 'L')),
    fgm_away FLOAT,
    fga_away FLOAT,
    fg_pct_away FLOAT,
    fg3m_away FLOAT,
    fg3a_away FLOAT,
    fg3_pct_away FLOAT,
    ftm_away FLOAT,
    fta_away FLOAT,
    ft_pct_away FLOAT,
    oreb_away FLOAT,
    dreb_away FLOAT,
    reb_away FLOAT,
    ast_away FLOAT,
    stl_away FLOAT,
    blk_away FLOAT,
    tov_away FLOAT,
    pf_away FLOAT,
    pts_away FLOAT,
    plus_minus_away INT,
    season_type VARCHAR(255),
	PRIMARY KEY (season_id, game_id, team_id_home, team_id_away),
    FOREIGN KEY (team_id_home) REFERENCES dim_team (team_id),
    FOREIGN KEY (team_id_away) REFERENCES dim_team (team_id),
	FOREIGN KEY (game_id) REFERENCES dim_game_info (game_id),
	FOREIGN KEY (season_id) REFERENCES dim_season (season_id),
);

CREATE TABLE fact_player_stats (
    primary_key_composed VARCHAR(255) PRIMARY KEY NOT NULL,
    season_id INT NOT NULL,
    player_id INT NOT NULL,
    player_name VARCHAR(255) NOT NULL, 
    team_id INT NOT NULL,
    team_abbreviation VARCHAR(10) NOT NULL,
    position VARCHAR(10) NOT NULL,
    age INT NOT NULL,
    GP INT, -- Games Played (Juegos Jugados)
    GS INT, -- Games Started (Juegos Iniciados)
    MP FLOAT, -- Minutes Played (Minutos Jugados)
    FG FLOAT, -- Field Goals Made (Tiros de campo anotados)
    FGA FLOAT, -- Field Goals Attempted (Tiros de campo intentados)
    FG_pct FLOAT, -- Field Goal Percentage (Porcentaje de tiros de campo)
    "3P" FLOAT, -- Three-Point Field Goals Made (Tiros de 3 puntos anotados)
    "3PA" FLOAT, -- Three-Point Field Goals Attempted (Tiros de 3 puntos intentados)
    "3P_pct" FLOAT, -- Three-Point Percentage (Porcentaje de tiros de 3 puntos)
    "2P" FLOAT, -- Two-Point Field Goals Made (Tiros de 2 puntos anotados)
    "2PA" FLOAT, -- Two-Point Field Goals Attempted (Tiros de 2 puntos intentados)
    "2P_pct" FLOAT, -- Two-Point Percentage (Porcentaje de tiros de 2 puntos)
    eFG_pct FLOAT, -- Effective Field Goal Percentage (Porcentaje de tiro efectivo)
    FT FLOAT, -- Free Throws Made (Tiros libres anotados)
    FTA FLOAT, -- Free Throws Attempted (Tiros libres intentados)
    FT_pct FLOAT, -- Free Throw Percentage (Porcentaje de tiros libres)
    ORB FLOAT, -- Offensive Rebounds (Rebotes ofensivos)
    DRB FLOAT, -- Defensive Rebounds (Rebotes defensivos)
    TRB FLOAT, -- Total Rebounds (Rebotes totales)
    AST FLOAT, -- Assists (Asistencias)
    STL FLOAT, -- Steals (Robos)
    BLK FLOAT, -- Blocks (Bloqueos)
    TOV FLOAT, -- Turnovers (Pérdidas de balón)
    PF FLOAT, -- Personal Fouls (Faltas personales)
    PTS FLOAT, -- Points (Puntos)
    divisor_pie FLOAT,
    pie FLOAT,
    FOREIGN KEY (season_id) REFERENCES dim_season(season_id),
    FOREIGN KEY (team_id) REFERENCES dim_team(team_id),
    FOREIGN KEY (player_id) REFERENCES dim_player_info(player_id) 
);

-- Tabla fact_draft
CREATE TABLE fact_draft (
    draft_id INT PRIMARY KEY,
    player_name NVARCHAR(255),
    draft_season INT,
    round_number INT CHECK (round_number IN (1, 2)),
    round_pick INT CHECK (round_pick BETWEEN 1 AND 30),
    overall_pick INT CHECK (overall_pick BETWEEN 1 AND 60),
    team_id INT,
    team_city NVARCHAR(255),
    team_name NVARCHAR(255),
    team_abbreviation NVARCHAR(50),
    organization NVARCHAR(255),
    organization_type NVARCHAR(100),
    position NVARCHAR(100),
    height_wo_shoes FLOAT,
    height_wo_shoes_ft_in NVARCHAR(50),
    height_w_shoes FLOAT,
    height_w_shoes_ft_in NVARCHAR(50),
    weight FLOAT,
    wingspan FLOAT,
    wingspan_ft_in NVARCHAR(50),
    standing_reach FLOAT,
    standing_reach_ft_in NVARCHAR(50),
    body_fat_pct FLOAT,
    hand_length FLOAT,
    hand_width FLOAT,
    standing_vertical_leap FLOAT,
    max_vertical_leap FLOAT,
    lane_agility_time FLOAT,
    modified_lane_agility_time FLOAT,
    three_quarter_sprint FLOAT,
	FOREIGN KEY (team_id) REFERENCES dim_team (team_id)
);

CREATE TABLE fact_team_stats (
    season_id INT NOT NULL,
    team_id INT NOT NULL,
    team_abbreviation VARCHAR(3) NOT NULL,
    fgm FLOAT,
    fga FLOAT,
    fg_pct FLOAT,
    fg3m FLOAT,
    fg3a FLOAT,
    fg3_pct FLOAT,
    ftm FLOAT,
    fta FLOAT,
    ft_pct FLOAT,
    oreb FLOAT,
    dreb FLOAT,
    reb FLOAT,
    ast FLOAT,
    stl FLOAT,
    blk FLOAT,
    tov FLOAT,
    pf FLOAT,
    pts FLOAT,
    plus_minus INT,
    pie_denominador FLOAT,
	PRIMARY KEY (season_id, team_id),
    FOREIGN KEY (season_id) REFERENCES dim_season(season_id),
    FOREIGN KEY (team_id) REFERENCES dim_team(team_id)
);




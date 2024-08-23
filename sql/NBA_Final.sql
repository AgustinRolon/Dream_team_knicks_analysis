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
	salary INT NOT NULL
);

--Tabla dim_game_info
CREATE TABLE dim_game_info (
    game_id INT PRIMARY KEY NOT NULL,
    game_date DATE NOT NULL,
    attendance INT
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
	end_date DATE NOT NULL
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
    wl_home VARCHAR(1) NOT NULL,
    game_minutes int NOT NULL,
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
    wl_away VARCHAR(1) NOT NULL,
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

--Tabla fact_player_stats
CREATE TABLE fact_player_stats (
    primary_key_composed VARCHAR(225) PRIMARY KEY NOT NULL,
    player_id INT NOT NULL,
    player_name VARCHAR(255) NOT NULL,
    pos VARCHAR(10) NOT NULL,
    age INT NOT NULL,
    team_abbrevation VARCHAR(255) NOT NULL,
    GP INT,
    GS INT,
    MP FLOAT,
    FG FLOAT,
    FGA FLOAT,
    FG_percent FLOAT,
    three_P FLOAT,
    three_PA FLOAT,
    three_P_percent FLOAT,
    two_P FLOAT,
    two_PA FLOAT,
    two_P_percent FLOAT,
    eFG_percent FLOAT,
    FT FLOAT,
    FTA FLOAT,
    FT_percent FLOAT,
    ORB FLOAT,
    DRB FLOAT,
    TRB FLOAT,
    AST FLOAT,
    STL FLOAT,
    BLK FLOAT,
    TOV FLOAT,
    PF FLOAT,
    PTS FLOAT,
    season_id INT NOT NULL,
    total_team VARCHAR(255),
	FOREIGN KEY (player_id) REFERENCES dim_player_info(player_id),
	FOREIGN KEY (season_id) REFERENCES dim_season(season_id)
);

-- Tabla fact_draft
CREATE TABLE fact_draft (
    draft_id INT PRIMARY KEY,
    player_name NVARCHAR(255),
    draft_season INT,
    round_number INT,
    round_pick INT,
    overall_pick INT,
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


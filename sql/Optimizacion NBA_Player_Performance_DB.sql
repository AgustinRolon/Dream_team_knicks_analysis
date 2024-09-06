USE NBA_Player_Performance_DB

-- OPTIMIZACION DE LA BASE DE DATOS

-- Crear indices

--Indices tabla dim_team
CREATE INDEX idx_abbreviation ON dim_team(team_abbreviation);

--Indices tabla fact_game_stats
CREATE INDEX idx_game_id ON fact_game_stats(game_id);
CREATE INDEX idx_season_id ON fact_game_stats(season_id);
CREATE INDEX idx_team_home_away ON fact_game_stats(team_id_home, team_id_away);
CREATE INDEX idx_game_date ON fact_game_stats(game_date);

--Indices tabla fact_player_stats
CREATE INDEX idx_player_id ON fact_player_stats(player_id);
CREATE INDEX idx_season_id ON fact_player_stats(season_id);
CREATE INDEX idx_team_abbreviation ON fact_player_stats(team_abbreviation);
CREATE INDEX idx_position ON fact_player_stats(position);


--Indices tabla fact_draft
CREATE INDEX idx_player_name ON fact_draft(player_name);
CREATE INDEX idx_team_id ON fact_draft(team_id);
CREATE INDEX idx_draft_season ON fact_draft(draft_season);
CREATE INDEX idx_round_pick ON fact_draft(round_number, round_pick);
CREATE INDEX idx_organization ON fact_draft(organization);
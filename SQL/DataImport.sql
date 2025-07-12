-- Odin Lee
-- Importing Data for FantasyFootball Project

---------------------------------------------------------------
-------------------- Teams ------------------------------------
---------------------------------------------------------------

INSERT ALL
    -- AFC East
    INTO teams (teamid, name, city, state, division) VALUES ('BUF', 'Buffalo Bills', 'Buffalo', 'New York', 'AFC East')
    INTO teams (teamid, name, city, state, division) VALUES ('MIA', 'Miami Dolphins', 'Miami', 'Florida', 'AFC East')
    INTO teams (teamid, name, city, state, division) VALUES ('NYJ', 'New York Jets', 'New York', 'New York', 'AFC East')
    INTO teams (teamid, name, city, state, division) VALUES ('NE', 'New England Patriots', 'Foxborough', 'Massachusetts', 'AFC East')
    
    -- AFC North
    INTO teams (teamid, name, city, state, division) VALUES ('PIT', 'Pittsburgh Steelers', 'Pittsburgh', 'Pennsylvania', 'AFC North')
    INTO teams (teamid, name, city, state, division) VALUES ('BAL', 'Baltimore Ravens', 'Baltimore', 'Maryland', 'AFC North')
    INTO teams (teamid, name, city, state, division) VALUES ('CIN', 'Cincinnati Bengals', 'Cincinnati', 'Ohio', 'AFC North')
    INTO teams (teamid, name, city, state, division) VALUES ('CLE', 'Cleveland Browns', 'Cleveland', 'Ohio', 'AFC North')
    
    -- AFC South
    INTO teams (teamid, name, city, state, division) VALUES ('HOU', 'Houston Texans', 'Houston', 'Texas', 'AFC South')
    INTO teams (teamid, name, city, state, division) VALUES ('IND', 'Indianapolis Colts', 'Indianapolis', 'Indiana', 'AFC South')
    INTO teams (teamid, name, city, state, division) VALUES ('TEN', 'Tennessee Titans', 'Nashville', 'Tennessee', 'AFC South')
    INTO teams (teamid, name, city, state, division) VALUES ('JAX', 'Jacksonville Jaguars', 'Jacksonville', 'Florida', 'AFC South')
    
    -- AFC West
    INTO teams (teamid, name, city, state, division) VALUES ('KC', 'Kansas City Chiefs', 'Kansas City', 'Missouri', 'AFC West')
    INTO teams (teamid, name, city, state, division) VALUES ('LAC', 'Los Angeles Chargers', 'Los Angeles', 'California', 'AFC West')
    INTO teams (teamid, name, city, state, division) VALUES ('DEN', 'Denver Broncos', 'Denver', 'Colorado', 'AFC West')
    INTO teams (teamid, name, city, state, division) VALUES ('LV', 'Las Vegas Raiders', 'Las Vegas', 'Nevada', 'AFC West')
    
    -- NFC East
    INTO teams (teamid, name, city, state, division) VALUES ('PHI', 'Philadelphia Eagles', 'Philadelphia', 'Pennsylvania', 'NFC East')
    INTO teams (teamid, name, city, state, division) VALUES ('WAS', 'Washington Commanders', 'Washington DC', 'District of Columbia', 'NFC East')
    INTO teams (teamid, name, city, state, division) VALUES ('DAL', 'Dallas Cowboys', 'Dallas', 'Texas', 'NFC East')
    INTO teams (teamid, name, city, state, division) VALUES ('NYG', 'New York Giants', 'New York', 'New York', 'NFC East')
    
    -- NFC North
    INTO teams (teamid, name, city, state, division) VALUES ('DET', 'Detroit Lions', 'Detroit', 'Michigan', 'NFC North')
    INTO teams (teamid, name, city, state, division) VALUES ('MIN', 'Minnesota Vikings', 'Minneapolis', 'Minnesota', 'NFC North')
    INTO teams (teamid, name, city, state, division) VALUES ('GB', 'Green Bay Packers', 'Green Bay', 'Wisconsin', 'NFC North')
    INTO teams (teamid, name, city, state, division) VALUES ('CHI', 'Chicago Bears', 'Chicago', 'Illinois', 'NFC North')
    
    -- NFC South
    INTO teams (teamid, name, city, state, division) VALUES ('ATL', 'Atlanta Falcons', 'Atlanta', 'Georgia', 'NFC South')
    INTO teams (teamid, name, city, state, division) VALUES ('TB', 'Tampa Bay Buccaneers', 'Tampa Bay', 'Florida', 'NFC South')
    INTO teams (teamid, name, city, state, division) VALUES ('NO', 'New Orleans Saints', 'New Orleans', 'Louisiana', 'NFC South')
    INTO teams (teamid, name, city, state, division) VALUES ('CAR', 'Carolina Panthers', 'Charlotte', 'North Carolina', 'NFC South')
    
    -- NFC West
    INTO teams (teamid, name, city, state, division) VALUES ('SEA', 'Seattle Seahawks', 'Seattle', 'Washington', 'NFC West')
    INTO teams (teamid, name, city, state, division) VALUES ('ARI', 'Arizona Cardinals', 'Phoenix', 'Arizona', 'NFC West')
    INTO teams (teamid, name, city, state, division) VALUES ('LAR', 'Los Angeles Rams', 'Los Angeles', 'California', 'NFC West')
    INTO teams (teamid, name, city, state, division) VALUES ('SF', 'San Francisco 49ers', 'San Francisco', 'California', 'NFC West')
SELECT * FROM dual;

---------------------------------------------------------------
-------------------- Seasons ----------------------------------
---------------------------------------------------------------

INSERT ALL
    -- 2023 Season
    INTO seasons (year, week) VALUES (2023, 'Week 1') INTO seasons (year, week) VALUES (2023, 'Week 2') INTO seasons (year, week) VALUES (2023, 'Week 3')
    INTO seasons (year, week) VALUES (2023, 'Week 4') INTO seasons (year, week) VALUES (2023, 'Week 5') INTO seasons (year, week) VALUES (2023, 'Week 6')
    INTO seasons (year, week) VALUES (2023, 'Week 7') INTO seasons (year, week) VALUES (2023, 'Week 8') INTO seasons (year, week) VALUES (2023, 'Week 9')
    INTO seasons (year, week) VALUES (2023, 'Week 10') INTO seasons (year, week) VALUES (2023, 'Week 11') INTO seasons (year, week) VALUES (2023, 'Week 12')
    INTO seasons (year, week) VALUES (2023, 'Week 13') INTO seasons (year, week) VALUES (2023, 'Week 14') INTO seasons (year, week) VALUES (2023, 'Week 15')
    INTO seasons (year, week) VALUES (2023, 'Week 16') INTO seasons (year, week) VALUES (2023, 'Week 17') INTO seasons (year, week) VALUES (2023, 'Week 18')
    
    -- 2022 Season
    INTO seasons (year, week) VALUES (2022, 'Week 1') INTO seasons (year, week) VALUES (2022, 'Week 2') INTO seasons (year, week) VALUES (2022, 'Week 3')
    INTO seasons (year, week) VALUES (2022, 'Week 4') INTO seasons (year, week) VALUES (2022, 'Week 5') INTO seasons (year, week) VALUES (2022, 'Week 6')
    INTO seasons (year, week) VALUES (2022, 'Week 7') INTO seasons (year, week) VALUES (2022, 'Week 8') INTO seasons (year, week) VALUES (2022, 'Week 9')
    INTO seasons (year, week) VALUES (2022, 'Week 10') INTO seasons (year, week) VALUES (2022, 'Week 11') INTO seasons (year, week) VALUES (2022, 'Week 12')
    INTO seasons (year, week) VALUES (2022, 'Week 13') INTO seasons (year, week) VALUES (2022, 'Week 14') INTO seasons (year, week) VALUES (2022, 'Week 15')
    INTO seasons (year, week) VALUES (2022, 'Week 16') INTO seasons (year, week) VALUES (2022, 'Week 17') INTO seasons (year, week) VALUES (2022, 'Week 18')
    
    -- 2021 Season
    INTO seasons (year, week) VALUES (2021, 'Week 1') INTO seasons (year, week) VALUES (2021, 'Week 2') INTO seasons (year, week) VALUES (2021, 'Week 3')
    INTO seasons (year, week) VALUES (2021, 'Week 4') INTO seasons (year, week) VALUES (2021, 'Week 5') INTO seasons (year, week) VALUES (2021, 'Week 6')
    INTO seasons (year, week) VALUES (2021, 'Week 7') INTO seasons (year, week) VALUES (2021, 'Week 8') INTO seasons (year, week) VALUES (2021, 'Week 9')
    INTO seasons (year, week) VALUES (2021, 'Week 10') INTO seasons (year, week) VALUES (2021, 'Week 11') INTO seasons (year, week) VALUES (2021, 'Week 12')
    INTO seasons (year, week) VALUES (2021, 'Week 13') INTO seasons (year, week) VALUES (2021, 'Week 14') INTO seasons (year, week) VALUES (2021, 'Week 15')
    INTO seasons (year, week) VALUES (2021, 'Week 16') INTO seasons (year, week) VALUES (2021, 'Week 17') INTO seasons (year, week) VALUES (2021, 'Week 18')
SELECT * FROM dual;

    
--------------------------------------------------------------------------------------------------------
-------------------- Populate PlayerID in Player Stats Staging Table -----------------------------------
--------------------------------------------------------------------------------------------------------

UPDATE playerStatsStagingTable stage
SET playerid = (
    SELECT p.playerid
    FROM players p
    WHERE TRIM(UPPER(p.firstname)) = TRIM(UPPER(stage.firstname))
      AND TRIM(UPPER(p.lastname)) = TRIM(UPPER(stage.lastname))
      AND p.seasonyear = stage.seasonyear
      AND ROWNUM = 1
)
WHERE EXISTS (
    SELECT 1
    FROM players p
    WHERE TRIM(UPPER(p.firstname)) = TRIM(UPPER(stage.firstname))
      AND TRIM(UPPER(p.lastname)) = TRIM(UPPER(stage.lastname))
      AND p.seasonyear = stage.seasonyear
);

--------------------------------------------------------------------------------------------------------
-------------------- Populate GameID in Player Stats Staging Table -------------------------------------
--------------------------------------------------------------------------------------------------------

UPDATE playerStatsStagingTable sp
SET gameid = (
    SELECT g.gameid
    FROM games g
    WHERE g.seasonyear = sp.seasonyear
      AND g.week = sp.week
      AND g.hometeam = sp.hometeam
      AND g.awayteam = sp.awayteam
      AND ROWNUM = 1
);

--------------------------------------------------------------------------------------------------------------------
-------------------- Insert Player Stats Staging Table into Player Stats Table ------------------------------------
--------------------------------------------------------------------------------------------------------------------

INSERT INTO playerstats (
    gameid, playerid, passcmp, passatt, passyds, passtd, passint, 
    rushatt, rushyds, rushtd, rectgt, rec, recyds, rectd, fumbleslost, kickpuntreturn, "2ptconversion"
)
SELECT 
    gameid, playerid, passcmp, passatt, passyds, passtd, passint, 
    rushatt, rushyds, rushtd, rectgt, rec, recyds, rectd, fumbleslost, kickpuntreturn, "2ptconversion"
FROM playerStatsStagingTable
WHERE seasonyear = 2023;

------------------------------------------------------------------------------------------------------
-------------------- Insert Scoring rules into ScoringRules Table ------------------------------------
------------------------------------------------------------------------------------------------------

-- Insert Non-PPR scoring rules (0 points per reception)
INSERT INTO scoringrules (
    scoringruleid, receptionpts
) VALUES (
    'NON', 0.0
);

-- Insert Half-PPR scoring rules (0.5 points per reception)
INSERT INTO scoringrules (
    scoringruleid, receptionpts
) VALUES (
    'HALF', 0.5
);

-- Insert Full-PPR scoring rules (1 point per reception)
INSERT INTO scoringrules (
    scoringruleid, receptionpts
) VALUES (
    'PPR', 1.0
);

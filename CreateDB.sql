-- Odin Lee
-- Fantasy Football Final Project

-----------------------------------------------
-------------------- Games --------------------
-----------------------------------------------

CREATE TABLE games (
    gameid         INTEGER NOT NULL,
    seasonyear     INTEGER NOT NULL,
    week           VARCHAR2(8) NOT NULL,
    hometeam       VARCHAR2(3) NOT NULL,
    awayteam       VARCHAR2(3) NOT NULL,
    homefinalscore INTEGER,
    awayfinalscore INTEGER
)
LOGGING;

COMMENT ON COLUMN games.gameid IS
    'A unique identifier for each NFL game';

COMMENT ON COLUMN games.seasonyear IS
    'The year of the season in which the game was played, linking to the Seasons table';

COMMENT ON COLUMN games.week IS
    'The week number in which the game was played, linking to the Seasons table';

COMMENT ON COLUMN games.hometeam IS
    'The ID of the home team, linking to the Teams table';

COMMENT ON COLUMN games.awayteam IS
    'The ID of the away team, linking to the Teams table';

COMMENT ON COLUMN games.homefinalscore IS
    'The final score of the home team';

COMMENT ON COLUMN games.awayfinalscore IS
    'The final score of the away team';

ALTER TABLE games ADD CONSTRAINT games_pk PRIMARY KEY ( gameid );

---------------------------------------------------------------
-------------------- PlayerHistoricalStats --------------------
---------------------------------------------------------------

CREATE TABLE playerhistoricalstats (
    playerid      INTEGER NOT NULL,
    seasonyear    INTEGER NOT NULL,
    gamesplayed   INTEGER,
    totalpassyds  INTEGER,
    totalrushyds  INTEGER,
    totalrecyds   INTEGER,
    totaltds      INTEGER,
    fantasypoints FLOAT
)
LOGGING;

COMMENT ON COLUMN playerhistoricalstats.playerid IS
    'A unique identifier for each player';

COMMENT ON COLUMN playerhistoricalstats.seasonyear IS
    'The year of the season for the aggregated stats';

COMMENT ON COLUMN playerhistoricalstats.gamesplayed IS
    'The total number of games the player played during the season';

COMMENT ON COLUMN playerhistoricalstats.totalpassyds IS
    'The total passing yards accumulated by the player during the season';

COMMENT ON COLUMN playerhistoricalstats.totalrushyds IS
    'The total rushing yards accumulated by the player during the season';

COMMENT ON COLUMN playerhistoricalstats.totalrecyds IS
    'The total receiving yards accumulated by the player during the season';

COMMENT ON COLUMN playerhistoricalstats.totaltds IS
    'The total touchdowns (passing, rushing, receiving) scored by the player during the season';

COMMENT ON COLUMN playerhistoricalstats.fantasypoints IS
    'The total fantasy points accumulated by the player during the season';

ALTER TABLE playerhistoricalstats ADD CONSTRAINT playerhistoricalstats_pk PRIMARY KEY ( playerid,
                                                                                        seasonyear );
ALTER TABLE playerHistoricalStats MODIFY gamesplayed INTEGER DEFAULT 0;
ALTER TABLE playerHistoricalStats MODIFY totalpassyds INTEGER DEFAULT 0;
ALTER TABLE playerHistoricalStats MODIFY totalrushyds INTEGER DEFAULT 0;
ALTER TABLE playerHistoricalStats MODIFY totalrecyds INTEGER DEFAULT 0;
ALTER TABLE playerHistoricalStats MODIFY totaltds INTEGER DEFAULT 0;
ALTER TABLE playerHistoricalStats MODIFY fantasypoints FLOAT DEFAULT 0;

-------------------------------------------------
-------------------- Players --------------------
-------------------------------------------------

CREATE TABLE players (
    playerid  INTEGER NOT NULL,
    seasonyear   INTEGER NOT NULL,
    firstname VARCHAR2(30),
    lastname  VARCHAR2(30),
    position  VARCHAR2(3),
    teamid    VARCHAR2(3) NOT NULL,
    college   VARCHAR2(30),
    birthdate   DATE,
    height    FLOAT,
    weight    FLOAT,
    yearspro  INTEGER
)
LOGGING;

COMMENT ON COLUMN players.playerid IS
    'A unique identifier for each NFL player';

COMMENT ON COLUMN players.firstname IS
    'The first name of the player (e.g., "Jordan")';

COMMENT ON COLUMN players.lastname IS
    'The last name of the player (e.g., "Love")';

COMMENT ON COLUMN players.position IS
    'The player''s position on the field (e.g., "QB", "RB")';

COMMENT ON COLUMN players.teamid IS
    'The ID of the team the player currently plays for, linking to the Teams table';

COMMENT ON COLUMN players.college IS
    'The college the player attended (e.g., "Utah State")';

COMMENT ON COLUMN players.birthdate IS
    'The player''s birthdate';

COMMENT ON COLUMN players.height IS
    'The player''s height, typically in feet and inches';

COMMENT ON COLUMN players.weight IS
    'The player''s weight, typically in pounds';

COMMENT ON COLUMN players.yearspro IS
    'The number of years the player has been in the NFL';

ALTER TABLE players ADD CONSTRAINT players_pk PRIMARY KEY ( playerid );

ALTER TABLE players ADD CONSTRAINT chk_player_position
CHECK (position IN ('QB', 'RB', 'WR', 'TE', 'K', 'DEF'));

ALTER TABLE players MODIFY birthdate DATE DEFAULT NULL;
ALTER TABLE players MODIFY yearspro INTEGER DEFAULT NULL;
ALTER TABLE players MODIFY position VARCHAR2(3) DEFAULT NULL;
ALTER TABLE players MODIFY college VARCHAR2(30) DEFAULT 'Unknown';

---------------------------------------------------------------
-------------------- PlayerStats ------------------------------
---------------------------------------------------------------

CREATE TABLE playerstats (
    gameid          INTEGER NOT NULL,
    playerid        INTEGER NOT NULL,
    passcmp         INTEGER,
    passatt         INTEGER,
    passyds         INTEGER,
    "passComp%"     FLOAT,
    passtd          INTEGER,
    passint         INTEGER,
    rushatt         INTEGER,
    rushyds         INTEGER,
    "yds/Rush"      FLOAT,
    rushtd          INTEGER,
    rectgt          INTEGER,
    rec             INTEGER,
    recyds          INTEGER,
    "yds/Rec"       FLOAT,
    rectd           INTEGER,
    fumbleslost     INTEGER,
    kickPuntReturn  INTEGER,
    "2PtConversion" INTEGER,
    fantasypoints   FLOAT
)
LOGGING;

COMMENT ON COLUMN playerstats.gameid IS
    'The ID of the game in which the player recorded stats, linking to the Games table';

COMMENT ON COLUMN playerstats.playerid IS
    'The ID of the player whose stats are recorded, linking to the Players table';

COMMENT ON COLUMN playerstats.passcmp IS
    'The number of completed passes by the player';

COMMENT ON COLUMN playerstats.passatt IS
    'The number of attempted passes by the player';

COMMENT ON COLUMN playerstats.passyds IS
    'The total passing yards by the player';

COMMENT ON COLUMN playerstats."passComp%" IS
    'The pass completion precentage';

COMMENT ON COLUMN playerstats.passtd IS
    'The number of passing touchdowns thrown by the player';

COMMENT ON COLUMN playerstats.passint IS
    'The number of interceptions thrown by the player';

COMMENT ON COLUMN playerstats.rushatt IS
    'The number of rushing attempts by the player';

COMMENT ON COLUMN playerstats.rushyds IS
    'The total rushing yards by the player';

COMMENT ON COLUMN playerstats."yds/Rush" IS
    'Yards per rushing attempt';

COMMENT ON COLUMN playerstats.rushtd IS
    'The number of rushing touchdowns by the player';

COMMENT ON COLUMN playerstats.rectgt IS
    'The number of targets (passes thrown to) for the player';

COMMENT ON COLUMN playerstats.rec IS
    'The number of receptions by the player';

COMMENT ON COLUMN playerstats.recyds IS
    'The total receiving yards by the player';

COMMENT ON COLUMN playerstats."yds/Rec" IS
    'Yards per reception';

COMMENT ON COLUMN playerstats.rectd IS
    'The number of receiving touchdowns by the player';

COMMENT ON COLUMN playerstats.fumbleslost IS
    'The total number of fumbles by the player that resulted in a change in possession';

COMMENT ON COLUMN playerstats.kickPuntReturn IS
    'The total number of kick or punt returns for a touchdown';

COMMENT ON COLUMN playerstats."2PtConversion" IS
    'The total number of succesfull 2-Pt converstion the player either, Threw, Caught, or Ran for';

COMMENT ON COLUMN playerstats.fantasypoints IS
    'The player''s calculated fantasy points for the game';

CREATE INDEX idx_playerstats_player ON
    playerstats (
        playerid
    ASC );

CREATE INDEX idx_playerstats_game ON
    playerstats (
        gameid
    ASC );

ALTER TABLE playerstats ADD CONSTRAINT playerstats_pk PRIMARY KEY ( gameid,
                                                                    playerid );

ALTER TABLE playerStats MODIFY fantasyPoints FLOAT NOT NULL;

ALTER TABLE playerStats MODIFY fantasyPoints FLOAT DEFAULT 0.0;
ALTER TABLE playerStats MODIFY passcmp INTEGER DEFAULT 0;
ALTER TABLE playerStats MODIFY passatt INTEGER DEFAULT 0;
ALTER TABLE playerStats MODIFY passyds INTEGER DEFAULT 0;
ALTER TABLE playerStats MODIFY passtd INTEGER DEFAULT 0;
ALTER TABLE playerStats MODIFY passint INTEGER DEFAULT 0;
ALTER TABLE playerStats MODIFY rushatt INTEGER DEFAULT 0;
ALTER TABLE playerStats MODIFY rushyds INTEGER DEFAULT 0;
ALTER TABLE playerStats MODIFY rushtd INTEGER DEFAULT 0;
ALTER TABLE playerStats MODIFY rectgt INTEGER DEFAULT 0;
ALTER TABLE playerStats MODIFY rec INTEGER DEFAULT 0;
ALTER TABLE playerStats MODIFY recyds INTEGER DEFAULT 0;
ALTER TABLE playerStats MODIFY rectd INTEGER DEFAULT 0;
ALTER TABLE playerStats MODIFY fumbleslost INTEGER DEFAULT 0;
ALTER TABLE playerStats MODIFY kickPuntReturn INTEGER DEFAULT NULL;
ALTER TABLE playerStats MODIFY "2PtConversion" INTEGER DEFAULT NULL;
    
---------------------------------------------------------------
-------------------- ScoringRules -----------------------------
---------------------------------------------------------------

CREATE TABLE scoringrules (
    scoringruleid      VARCHAR2(5) NOT NULL,
    passyardpoints     FLOAT,
    passtdpts          FLOAT,
    intpts             FLOAT,
    rushyardpts        FLOAT,
    rushtdpts          FLOAT,
    receptionpts       FLOAT,
    recyardpts         FLOAT,
    rectdpts           FLOAT,
    returntdpts        FLOAT,
    "2PtConversionPts" FLOAT,
    funblepts          FLOAT
)
LOGGING;

COMMENT ON COLUMN scoringrules.scoringruleid IS
    'A unique identifier for the set of scoring rules';

COMMENT ON COLUMN scoringrules.passyardpoints IS
    'The number of fantasy points awarded per passing yard (0.04 pts per passing yard)';

COMMENT ON COLUMN scoringrules.passtdpts IS
    'The number of fantasy points awarded per passing touchdown (4 pts per passing TD)';

COMMENT ON COLUMN scoringrules.intpts IS
    'The number of fantasy points subtracted for a thrown interception (-1 pts per INT)';

COMMENT ON COLUMN scoringrules.rushyardpts IS
    'The number of fantasy points awarded per rushing yard (0.1 pts per rushing yard)';

COMMENT ON COLUMN scoringrules.rushtdpts IS
    'The number of fantasy points awarded per rushing touchdown (6 pts per rushing TD)';

COMMENT ON COLUMN scoringrules.receptionpts IS
    'The number of fantasy points awarded for each reception (non-PPR = 0 pts per reception, half-PPR = 0.5 pts per reception, full-PPR = 1 pt per reception)'
    ;

COMMENT ON COLUMN scoringrules.recyardpts IS
    'The number of fantasy points awarded per receiving yard (0.1 pts per receiving yard)';

COMMENT ON COLUMN scoringrules.rectdpts IS
    'The number of fantasy points awarded per receiving touchdown (6 pts per receiving TD)';

COMMENT ON COLUMN scoringrules.returntdpts IS
    'The number of fantasy points awarded per kick or punt return (6 pts per return TD)';

COMMENT ON COLUMN scoringrules."2PtConversionPts" IS
    'The number of fantasy points awarded per passing, receiving, or rushing 2 pt conversion (2 pts per 2-pt conversion)';

COMMENT ON COLUMN scoringrules.funblepts IS
    'The number of fantasy points awarded per fumble lost (-2 pts per fumble lost)';

ALTER TABLE scoringrules ADD CONSTRAINT scoringrules_pk PRIMARY KEY ( scoringruleid );

ALTER TABLE scoringRules ADD CONSTRAINT chk_positive_2PtConversionPts
CHECK ("2PtConversionPts" >= 0);

ALTER TABLE scoringRules MODIFY passyardpoints FLOAT DEFAULT 0.04;
ALTER TABLE scoringRules MODIFY passtdpts FLOAT DEFAULT 4.0;
ALTER TABLE scoringRules MODIFY intpts FLOAT DEFAULT -1.0;
ALTER TABLE scoringRules MODIFY rushyardpts FLOAT DEFAULT 0.1;
ALTER TABLE scoringRules MODIFY rushtdpts FLOAT DEFAULT 6.0;
ALTER TABLE scoringRules MODIFY recyardpts FLOAT DEFAULT 0.1;
ALTER TABLE scoringRules MODIFY rectdpts FLOAT DEFAULT 6.0;
ALTER TABLE scoringRules MODIFY returntdpts FLOAT DEFAULT 6.0;
ALTER TABLE scoringRules MODIFY "2PtConversionPts" FLOAT DEFAULT 2.0;
ALTER TABLE scoringRules MODIFY funblepts FLOAT DEFAULT -2.0;

---------------------------------------------------------------
-------------------- Seasons ----------------------------------
---------------------------------------------------------------

CREATE TABLE seasons (
    year INTEGER NOT NULL,
    week VARCHAR2(8) NOT NULL
)
LOGGING;

COMMENT ON COLUMN seasons.year IS
    'The year of the NFL season (e.g., 2023)';

COMMENT ON COLUMN seasons.week IS
    'The specific week within the season (e.g., Week 1, Week 2)';

ALTER TABLE seasons ADD CONSTRAINT seasons_pk PRIMARY KEY ( year,
                                                            week );

---------------------------------------------------------------
-------------------- Teams ------------------------------------
---------------------------------------------------------------

CREATE TABLE teams (
    teamid   VARCHAR2(3) NOT NULL,
    name     VARCHAR2(30),
    city     VARCHAR2(30),
    state    VARCHAR2(30),
    division VARCHAR2(10)
)
LOGGING;

COMMENT ON COLUMN teams.teamid IS
    'A unique identifier for an NFL team (e.g., "GB" for Green Bay)';

COMMENT ON COLUMN teams.name IS
    'The full name of the team (e.g., "Green Bay Packers")';

COMMENT ON COLUMN teams.city IS
    'The city where the team is based (e.g., "Green Bay")';

COMMENT ON COLUMN teams.state IS
    'The state where the team is located (e.g., "Wisconsin")';

COMMENT ON COLUMN teams.division IS
    'The NFL division the team belongs to (e.g., "NFC North")';

ALTER TABLE teams ADD CONSTRAINT teams_pk PRIMARY KEY ( teamid );

ALTER TABLE teams ADD CONSTRAINT team_name_unique UNIQUE (name);

ALTER TABLE teams ADD CONSTRAINT chk_team_division
CHECK (division IN ('NFC North', 'NFC South', 'NFC East', 'NFC West', 
                    'AFC North', 'AFC South', 'AFC East', 'AFC West'));
                    
ALTER TABLE teams MODIFY division VARCHAR2(10) DEFAULT NULL;

----------------------------------------------------------------------
-------------------- Foreign Keys ------------------------------------
----------------------------------------------------------------------

ALTER TABLE games
    ADD CONSTRAINT fk_games_seasons FOREIGN KEY ( seasonyear,
                                                  week )
        REFERENCES seasons ( year,
                             week )
    NOT DEFERRABLE;
    
ALTER TABLE players
    ADD CONSTRAINT fk_players_teams FOREIGN KEY ( teamid )
        REFERENCES teams ( teamid )
    NOT DEFERRABLE;
    
ALTER TABLE playerstats
    ADD CONSTRAINT fk_playerstats_games FOREIGN KEY ( gameid )
        REFERENCES games ( gameid )
    NOT DEFERRABLE;

ALTER TABLE playerstats
    ADD CONSTRAINT fk_playerstats_players FOREIGN KEY ( playerid )
        REFERENCES players ( playerid )
    NOT DEFERRABLE;

--------------------------------------------------------------------------------
-------------------- Sequences and Triggers ------------------------------------
--------------------------------------------------------------------------------

CREATE SEQUENCE game_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE OR REPLACE TRIGGER assign_game_id
BEFORE INSERT ON games
FOR EACH ROW
BEGIN
    IF :NEW.gameID IS NULL THEN
        :NEW.gameID := game_id_seq.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER sync_historical_stats
AFTER INSERT OR UPDATE ON playerStats
FOR EACH ROW
BEGIN
    UPDATE playerHistoricalStats
    SET totalPassYds = totalPassYds + :NEW.passYds,
        totalRushYds = totalRushYds + :NEW.rushYds,
        totalRecYds = totalRecYds + :NEW.recYds,
        totalTDs = totalTDs + (:NEW.passTD + :NEW.rushTD + :NEW.recTD)
    WHERE playerID = :NEW.playerID AND seasonYear = (SELECT seasonYear FROM games WHERE gameID = :NEW.gameID);
END;
/

CREATE OR REPLACE TRIGGER sync_historical_stats
AFTER INSERT OR UPDATE OR DELETE ON playerStats
FOR EACH ROW
DECLARE
    v_seasonYear INTEGER; -- Variable to hold the seasonYear from the games table
BEGIN
    -- Retrieve the seasonYear for the game associated with the playerStat
    SELECT seasonYear
    INTO v_seasonYear
    FROM games
    WHERE gameID = NVL(:NEW.gameID, :OLD.gameID);

    IF INSERTING THEN
        MERGE INTO playerHistoricalStats p
        USING (SELECT :NEW.playerID AS playerID, v_seasonYear AS seasonYear FROM DUAL) d
        ON (p.playerID = d.playerID AND p.seasonYear = d.seasonYear)
        WHEN MATCHED THEN
            UPDATE SET
                totalPassYds = p.totalPassYds + :NEW.passYds,
                totalRushYds = p.totalRushYds + :NEW.rushYds,
                totalRecYds = p.totalRecYds + :NEW.recYds,
                totalTDs = p.totalTDs + (:NEW.passTD + :NEW.rushTD + :NEW.recTD),
                fantasyPoints = p.fantasyPoints + :NEW.fantasyPoints,
                gamesPlayed = p.gamesPlayed + 1
        WHEN NOT MATCHED THEN
            INSERT (playerID, seasonYear, totalPassYds, totalRushYds, totalRecYds, totalTDs, fantasyPoints, gamesPlayed)
            VALUES (:NEW.playerID, v_seasonYear, :NEW.passYds, :NEW.rushYds, :NEW.recYds, :NEW.passTD + :NEW.rushTD + :NEW.recTD, :NEW.fantasyPoints, 1);

    ELSIF UPDATING THEN
        UPDATE playerHistoricalStats
        SET totalPassYds = totalPassYds - :OLD.passYds + :NEW.passYds,
            totalRushYds = totalRushYds - :OLD.rushYds + :NEW.rushYds,
            totalRecYds = totalRecYds - :OLD.recYds + :NEW.recYds,
            totalTDs = totalTDs - (:OLD.passTD + :OLD.rushTD + :OLD.recTD) + (:NEW.passTD + :NEW.rushTD + :NEW.recTD),
            fantasyPoints = fantasyPoints - :OLD.fantasyPoints + :NEW.fantasyPoints
        WHERE playerID = :OLD.playerID AND seasonYear = v_seasonYear;

    ELSIF DELETING THEN
        UPDATE playerHistoricalStats
        SET totalPassYds = totalPassYds - :OLD.passYds,
            totalRushYds = totalRushYds - :OLD.rushYds,
            totalRecYds = totalRecYds - :OLD.recYds,
            totalTDs = totalTDs - (:OLD.passTD + :OLD.rushTD + :OLD.recTD),
            fantasyPoints = fantasyPoints - :OLD.fantasyPoints,
            gamesPlayed = gamesPlayed - 1
        WHERE playerID = :OLD.playerID AND seasonYear = v_seasonYear;
    END IF;
END;
/

CREATE SEQUENCE player_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE OR REPLACE TRIGGER assign_player_id
BEFORE INSERT ON players
FOR EACH ROW
BEGIN
    IF :NEW.playerID IS NULL THEN
        :NEW.playerID := player_id_seq.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_calculate_pass_completion
BEFORE INSERT OR UPDATE ON playerStats
FOR EACH ROW
BEGIN
    IF :NEW.passatt IS NOT NULL AND :NEW.passatt > 0 THEN
        :NEW."passComp%" := ROUND((:NEW.passcmp / :NEW.passatt) * 100, 3);
    ELSE
        :NEW."passComp%" := 0;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_calculate_yards_per_rush
BEFORE INSERT OR UPDATE ON playerStats
FOR EACH ROW
BEGIN
    IF :NEW.rushatt IS NOT NULL AND :NEW.rushatt > 0 THEN
        :NEW."yds/Rush" := ROUND(:NEW.rushyds / :NEW.rushatt, 3);
    ELSE
        :NEW."yds/Rush" := 0;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_calculate_yards_per_reception
BEFORE INSERT OR UPDATE ON playerStats
FOR EACH ROW
BEGIN
    IF :NEW.rec IS NOT NULL AND :NEW.rec > 0 THEN
        :NEW."yds/Rec" := ROUND(:NEW.recyds / :NEW.rec, 3);
    ELSE
        :NEW."yds/Rec" := 0;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER calculate_fantasy_points
BEFORE INSERT OR UPDATE ON playerStats
FOR EACH ROW
BEGIN
    :NEW.fantasyPoints := (COALESCE(:NEW.passYds, 0) * 0.04) +
                      (COALESCE(:NEW.passTD, 0) * 4) -
                      (COALESCE(:NEW.passINT, 0) * 1) +
                      (COALESCE(:NEW.rushYds, 0) * 0.1) +
                      (COALESCE(:NEW.rushTD, 0) * 6) +
                      (COALESCE(:NEW.rec, 0) * 0.5) +
                      (COALESCE(:NEW.recYds, 0) * 0.1) +
                      (COALESCE(:NEW.recTD, 0) * 6) -
                      (COALESCE(:NEW.fumblesLost, 0) * 2) +
                      (COALESCE(:NEW.kickpuntreturn, 0) * 6) +
                      (COALESCE(:NEW."2PtConversion", 0) * 2);
END;
/

--------------------------------------------------------------------
-------------------- Player Stats Staging Table --------------------
--------------------------------------------------------------------

CREATE TABLE playerStatsStagingTable (
    firstname       VARCHAR2(30),
    lastname        VARCHAR2(30),
    seasonyear      INTEGER,
    week            VARCHAR2(8),
    hometeam        VARCHAR2(3),
    awayteam        VARCHAR2(3),
    passcmp         INTEGER,
    passatt         INTEGER,
    passyds         INTEGER,
    "passComp%"     FLOAT,
    passtd          INTEGER,
    passint         INTEGER,
    rushatt         INTEGER,
    rushyds         INTEGER,
    "yds/Rush"      FLOAT,
    rushtd          INTEGER,
    rectgt          INTEGER,
    rec             INTEGER,
    recyds          INTEGER,
    "yds/Rec"       FLOAT,
    rectd           INTEGER,
    fumbleslost     INTEGER,
    kickPuntReturn  INTEGER,
    "2PtConversion" INTEGER,
    fantasypoints   FLOAT,
    playerid        INTEGER, -- To be populated
    gameid          INTEGER -- To be populated
);


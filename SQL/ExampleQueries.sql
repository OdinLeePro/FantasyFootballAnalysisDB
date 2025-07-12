-- Odin Lee
-- Fantasy Football Project Example Queries

--------------------------------------------------------------------------------------------
-------------------- 1. Retrieve Player Performance for a Specific Game --------------------
--------------------------------------------------------------------------------------------

SELECT ps.gameid, p.firstname, p.lastname, ps.passyds, ps.rushyds, ps.recyds, ps.passtd, ps.rushtd, ps.rectd, ps.fantasypoints FROM playerstats ps
    JOIN players p ON ps.playerid = p.playerid
    WHERE ps.gameid = 101; -- Replace with a specific game ID

------------------------------------------------------------------------
-------------------- 2. List All Games for a Season --------------------
------------------------------------------------------------------------

SELECT gameid, seasonyear, week, hometeam, awayteam, homefinalscore, awayfinalscore FROM games
    WHERE seasonyear = 2023 -- Replace with desired season year
    ORDER BY gameid;

------------------------------------------------------------------------------------------------
-------------------- 3. Calculate Total Fantasy Points by Team for a Season --------------------
------------------------------------------------------------------------------------------------

SELECT p.teamid,t.name AS team_name, SUM(ps.fantasypoints) AS total_fantasy_points FROM playerstats ps
    JOIN players p ON ps.playerid = p.playerid
    JOIN teams t ON p.teamid = t.teamid
    JOIN games g ON ps.gameid = g.gameid
    WHERE g.seasonyear = 2023
    GROUP BY p.teamid, t.name
    ORDER BY total_fantasy_points DESC;

----------------------------------------------------------------------------------------------------    
-------------------- 4. Find Top 5 Players by Fantasy Points in a Specific Week --------------------    
----------------------------------------------------------------------------------------------------    

SELECT p.firstname, p.lastname, p.position, ps.fantasypoints FROM playerstats ps
    JOIN players p ON ps.playerid = p.playerid
    JOIN games g ON ps.gameid = g.gameid
    WHERE g.seasonyear = 2023 AND g.week = 'Week 5'
    ORDER BY ps.fantasypoints DESC 
    FETCH FIRST 5 ROWS ONLY;

---------------------------------------------------------------------------------------
-------------------- 5. Get Historical Stats for a Specific Player --------------------
---------------------------------------------------------------------------------------

SELECT phs.seasonyear, phs.gamesplayed, phs.totalpassyds, phs.totalrushyds, phs.totalrecyds, phs.totaltds, phs.fantasypoints FROM playerhistoricalstats phs
    JOIN players p ON phs.playerid = p.playerid
    WHERE p.firstname = 'Patrick' AND p.lastname = 'Mahomes'; -- Replace with player name

----------------------------------------------------------------------------------------------------------
-------------------- 6. List All Fantasy Players on a Specific Team in a Certain Year --------------------
----------------------------------------------------------------------------------------------------------

SELECT firstname, lastname, position, birthdate, college, seasonyear FROM players
    WHERE teamid = 'KC' AND seasonyear = 2021; -- Replace with team ID and year

---------------------------------------------------------------------------------------------------
-------------------- 7. Find the Most Common Division Winner by Fantasy Points --------------------
---------------------------------------------------------------------------------------------------

SELECT t.division, SUM(ps.fantasypoints) AS total_fantasy_points FROM playerstats ps
    JOIN players p ON ps.playerid = p.playerid
    JOIN teams t ON p.teamid = t.teamid
    JOIN games g ON ps.gameid = g.gameid
    WHERE g.seasonyear = 2023
    GROUP BY t.division
    ORDER BY total_fantasy_points DESC;

-------------------------------------------------------------------------------------------------
-------------------- 8. Rank Players by Yards per Rush per Game for a Season --------------------
-------------------------------------------------------------------------------------------------

SELECT  p.firstname, p.lastname, ps.rushatt, ps.rushyds, ROUND(ps."yds/Rush", 2) AS yards_per_rush FROM playerstats ps
    JOIN players p ON ps.playerid = p.playerid
    JOIN games g ON ps.gameid = g.gameid
    WHERE g.seasonyear = 2023 AND ps.rushatt > 10
    ORDER BY yards_per_rush DESC;

--------------------------------------------------------------------------------------------------
-------------------- 9. Identify Players with Zero Fantasy Points in a Season --------------------
--------------------------------------------------------------------------------------------------

SELECT p.firstname, p.lastname, g.seasonyear, COUNT(ps.gameid) AS games_played FROM  playerstats ps
    JOIN players p ON ps.playerid = p.playerid
    JOIN games g ON ps.gameid = g.gameid
    WHERE g.seasonyear = 2023 AND ps.fantasypoints = 0
    GROUP BY p.firstname, p.lastname, g.seasonyear;

--------------------------------------------------------------------------------------
-------------------- 10. List Scoring Rules for Different Leagues --------------------
--------------------------------------------------------------------------------------

SELECT *
    FROM scoringrules;

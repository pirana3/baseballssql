-- 1) Looking for a correlation between height and home runs hit ()
-- Select the average height and total number of home runs for each team in 2023
SELECT
t.TEAM_ID,
t.TEAM_NAME,
ROUND(AVG(p.HEIGHT), 2) AS AVG_HEIGHT,
SUM(os.HOMERUNS) AS TOTAL_HOME_RUNS
FROM
TEAM t
JOIN
PLAYER p ON t.TEAM_ID = p.TEAM_ID
JOIN
OFFENSIVE_STATS os ON p.PLAYER_ID = os.PLAYER_ID
GROUP BY
t.TEAM_ID, t.TEAM_NAME;
-- 2 ()
-- Selects distinct combinations of player names and their team cities
SELECT DISTINCT CONCAT(p.PLAYER_NAME, ' plays for ', t.TEAM_NAME, ' in ', t.CITY)
AS PlayerTeamCity
FROM PLAYER p
JOIN TEAM t ON p.TEAM_ID = t.TEAM_ID;
-- 3 ()
-- Teams sorted by the number of players caught stealing
SELECT TEAM_NAME
FROM TEAM
WHERE TEAM_ID IN (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_ID IN (SELECT PLAYER_ID
FROM PITCHING_STATS WHERE STRIKEOUTS_P > 100));
--  --
-- Query 4: Select Statement with Order By Clause --
-- This query retrieves players and their offensive statistics ordered by the total
runs scored in descending order. --
SELECT
P.PLAYER_ID,
P.PLAYER_NAME,
O.RUNS AS TotalRuns
FROM
PLAYER P
INNER JOIN (
SELECT
PLAYER_ID,
SUM(RUNS) AS RUNS
FROM
OFFENSIVE_STATS
GROUP BY
PLAYER_ID
) O ON P.PLAYER_ID = O.PLAYER_ID
ORDER BY
O.RUNS DESC;
-- 5) ()
-- Create a trigger to update the total home runs for a player when a new offensive
stat is inserted
DELIMITER //
CREATE TRIGGER update_total_home_runs
AFTER INSERT ON OFFENSIVE_STATS
FOR EACH ROW
BEGIN
DECLARE team_total INT;
-- Get the current total home runs for the player's team
SELECT SUM(HOMERUNS) INTO team_total
FROM OFFENSIVE_STATS os
JOIN PLAYER p ON os.PLAYER_ID = p.PLAYER_ID
WHERE p.TEAM_ID = TEAM_ID;
-- Update the total home runs for the player's team in the TEAM table
UPDATE TEAM
SET TOTAL_HOME_RUNS = team_total
WHERE TEAM_ID = TEAM_ID;
END;
//
DELIMITER ;
-- 6 ()
-- Assuming a trigger 'delete_offensive_stats' is created on the PLAYER table.
-- When a player is deleted, their corresponding offensive stats are also deleted.
DELIMITER //
CREATE TRIGGER delete_offensive_stats
BEFORE DELETE ON PLAYER
FOR EACH ROW
BEGIN
DELETE FROM OFFENSIVE_STATS WHERE PLAYER_ID = OLD.PLAYER_ID;
END //
DELIMITER ;
-- 7 ()
-- Team with the least number of players caught stealing
SELECT t.TEAMNAME, SUM(o.CAUGHT_STEALING) AS Total_Caught_Stealing
FROM TEAM t
JOIN PLAYER p ON t.TEAM_ID = p.TEAM_ID
JOIN OFFENSIVE_STATS o ON p.PLAYER_ID = o.PLAYER_ID
GROUP BY t.TEAMNAME
ORDER BY Total_Caught_Stealing ASC
LIMIT 1;
-- ()
-- Teams with the highest number of wins in pitching
SELECT t.TEAMNAME, SUM(ps.WINS) AS Total_Wins
FROM TEAM t
JOIN PLAYER p ON t.TEAM_ID = p.TEAM_ID
JOIN PITCHING_STATS ps ON p.PLAYER_ID = ps.PLAYER_ID
GROUP BY t.TEAMNAME
ORDER BY Total_Wins DESC;
-- \ --
-- Custom Query: Total Putouts and Assists per Player
SELECT
P.PLAYER_NAME,
SUM(DS.PUTOUTS) AS TotalPutouts,
SUM(DS.ASSISTS) AS TotalAssists
FROM
PLAYER P
LEFT JOIN
DEFENSIVE_STATS DS ON P.PLAYER_ID = DS.PLAYER_ID
GROUP BY
P.PLAYER_NAME;
PSTAT_ID INT AUTO_INCREMENT PRIMARY KEY,
YEAR_ID INT NOT NULL,
PLAYER_ID INT,
GAMES INT NOT NULL,
GAMES_STARTED INT NOT NULL,
EARNED_RUNS INT NOT NULL,
HITS_ALLOWED INT NOT NULL,
WINS INT NOT NULL,
LOSSES INT NOT NULL,
SAVES INT NOT NULL,
HR_ALLOWED INT NOT NULL,
WALKS_ALLOWED INT NOT NULL,
STRIKEOUTS_P INT NOT NULL,
INNINGS_P DECIMAL(5,2) NOT NULL,
BATTERS_HIT INT NOT NULL,
FOREIGN KEY (PLAYER_ID) REFERENCES PLAYER(PLAYER_ID) ON DELETE SET NULL ON
UPDATE CASCADE
);
INSERT INTO PITCHING_STATS (YEAR_ID, PLAYER_ID, GAMES, GAMES_STARTED, EARNED_RUNS,
HITS_ALLOWED, WINS, LOSSES, SAVES, HR_ALLOWED, WALKS_ALLOWED, STRIKEOUTS_P,
INNINGS_P, BATTERS_HIT) VALUES
(2023, 6, 23, 23, 3.14, 85, 10, 5, 0, 18, 55, 167, 132.0, 1), -- Shohei Ohtani
(2023, 6, 33, 33, 61, 157, 15, 4, 0, 20, 48, 222, 209.0, 7), -- Gerrit Cole
(2023, 7, 6, 6, 9, 19, 2, 0, 0, 2, 4, 45, 30.1, 0), -- Jacob deGrom
(2023, 16, 31, 31, 71, 179, 13, 10, 0, 22, 19, 172, 190.2, 6), -- George Kirby
(2023, 15, 17, 17, 33, 90, 10, 3, 0, 10, 21, 97, 97.1, 9); -- Joe Musgrove
-- DDL for DEFENSIVE_STATS table
CREATE TABLE IF NOT EXISTS DEFENSIVE_STATS (
DSTAT_ID INT AUTO_INCREMENT PRIMARY KEY,
YEAR_ID INT NOT NULL,
PLAYER_ID INT,
PUTOUTS INT NOT NULL,
ASSISTS INT NOT NULL,
ERRORS INT NOT NULL,
DOUBLE_PLAY INT NOT NULL,
FOREIGN KEY (PLAYER_ID) REFERENCES PLAYER(PLAYER_ID) ON DELETE SET NULL ON
UPDATE CASCADE
);
INSERT INTO DEFENSIVE_STATS (YEAR_ID, PLAYER_ID, PUTOUTS, ASSISTS, ERRORS,
DOUBLE_PLAY) VALUES
(2023, 1, 183, 2, 0, 1), -- For Mike Trout
(2023, 2, 120, 9, 3, 5), -- For Mookie Betts
(2023, 3, 160, 20, 6, 8), -- For Fernando Tatis Jr.
(2023, 4, 110, 8, 4, 3), -- For Juan Soto
(2023, 5, 130, 10, 2, 6), -- For Ronald Acuña Jr.
(2023, 6, 90, 30, 5, 0), -- For Gerrit Cole (as a pitcher, more assists and fewer
putouts)
(2023, 7, 85, 35, 4, 0), -- For Jacob deGrom (similarly, as a pitcher)
(2023, 8, 105, 7, 5, 4), -- For Bryce Harper
(2023, 9, 150, 25, 7, 10), -- For José Ramírez
(2023, 10, 145, 22, 8, 9), -- For Xander Bogaerts
(2023, 11, 140, 18, 6, 12), -- For Vladimir Guerrero Jr.
(2023, 12, 100, 40, 3, 0), -- For George Kirby (pitcher stats)
(2023, 13, 135, 15, 4, 7), -- For Manny Machado
(2023, 14, 125, 13, 5, 5), -- For Freddie Freeman
(2023, 15, 110, 12, 3, 6); -- For Joe Musgrove (pitcher stats)
-- DDL for OFFENSIVE_STATS table
CREATE TABLE IF NOT EXISTS OFFENSIVE_STATS (
OSTAT_ID INT AUTO_INCREMENT PRIMARY KEY,
YEAR_ID INT NOT NULL,
PLAYER_ID INT,
HITS INT NOT NULL,
AB INT NOT NULL,
RUNS INT NOT NULL,
WALKS INT NOT NULL,
HOMERUNS INT NOT NULL,
RBIS INT NOT NULL,
XBHS INT NOT NULL,
STRIKEOUTS_O INT NOT NULL,
STOLEN_BASES INT NOT NULL,
CAUGHT_STEALING INT NOT NULL,
FOREIGN KEY (PLAYER_ID) REFERENCES PLAYER(PLAYER_ID) ON DELETE SET NULL ON
UPDATE CASCADE
);
INSERT INTO OFFENSIVE_STATS (YEAR_ID, PLAYER_ID, HITS, AB, RUNS, WALKS, HOMERUNS,
RBIS, XBHS, STRIKEOUTS_O, STOLEN_BASES, CAUGHT_STEALING) VALUES
(2023, 5, 217, 643, 149, 80, 41, 106, 83, 84, 73, 14), -- Ronald Acuna Jr.
(2023, 2, 179, 584, 126, 96, 39, 107, 80, 107, 14, 3), -- Mookie Betts
(2023, 9, 211, 637, 131, 72, 29, 102, 90, 121, 23, 1), -- Freddie Freeman
(2023, 10, 134, 457, 84, 80, 21, 72, 51, 119, 11, 3), -- Bryce Harper
(2023, 14, 140, 543, 75, 50, 30, 91, 51, 109, 3, 2), -- Manny Machado
(2023, 12, 172, 611, 87, 73, 24, 80, 65, 73, 28, 6), -- José Ramírez
(2023, 4, 156, 568, 97, 132, 35, 109, 68, 129, 12, 5), -- Juan Soto
(2023, 3, 148, 575, 91, 53, 25, 78, 59, 141, 29, 4), -- Fernando Tatis Jr.
(2023, 1, 81, 308, 54, 45, 18, 44, 33, 104, 2, 0); -- Mike Trout

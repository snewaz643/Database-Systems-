SELECT DISTINCT FirstName, LastName
FROM player
NATURAL JOIN playerteam
NATURAL JOIN game
NATURAL JOIN season
NATURAL JOIN competition
WHERE sex = 'M' AND CompetitionID = 3
AND playerID NOT IN
(
  SELECT playerID
  FROM player
  NATURAL JOIN playerteam
  NATURAL JOIN game
  NATURAL JOIN season
  NATURAL JOIN competition
  WHERE CompetitionID = 1
);

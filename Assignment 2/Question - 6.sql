SELECT DISTINCT CONCAT(FirstName, LastName) AS FullName,
ClubName
FROM player
NATURAL JOIN clubplayer
NATURAL JOIN club
WHERE playerID NOT IN
(
 SELECT playerID
 FROM player
 NATURAL JOIN playerteam
 NATURAL JOIN game
 WHERE Year(MatchDate) = 2017
);

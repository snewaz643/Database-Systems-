SELECT FirstName, LastName
FROM
(
SELECT FirstName,LastName, COUNT(*) AS MatchesPlayed
FROM game
INNER JOIN playerteam
ON game.GameID = playerteam.GameID
INNER JOIN player
ON playerteam.PlayerID = player.PlayerID
GROUP BY FirstName, LastName
) AS NewTable
WHERE MatchesPlayed > 20;
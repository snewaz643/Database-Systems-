SELECT FirstName, LastName, MatchesPlayed 
FROM
(
	SELECT FirstName, LastName, ClubName , COUNT(*) AS
	MatchesPlayed
	FROM game
	INNER JOIN playerteam
	ON game.GameID = playerteam.GameID
	INNER JOIN player
	ON playerteam.PlayerID = player.PlayerID
	INNER JOIN clubplayer
	ON player.PlayerID = clubplayer.PlayerID
	INNER JOIN club
	ON clubplayer.ClubID = club.ClubID
	WHERE ToDate IS NULL
	GROUP BY FirstName, LastName, ClubName
) AS NEW_TABLE
WHERE ClubName = 'Melbourne City' AND MatchesPlayed < 12
ORDER BY MatchesPlayed DESC;
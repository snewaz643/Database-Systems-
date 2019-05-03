SELECT GameID, SeasonYear, firstTEAM.TeamName AS FirstTeam,secondTEAM.TeamName AS SecondTeam
FROM game
INNER JOIN season
ON game.SeasonID = season.SeasonID
INNER JOIN team AS firstTEAM
ON game.Team1 = firstTEAM.TeamID
INNER JOIN team AS secondTEAM
ON game.Team2 = secondTEAM.TeamID
WHERE game.T1Score IS NULL OR game.T2Score IS NULL;

SELECT DISTINCT FirstName, LastName
FROM player
WHERE playerid IN
( SELECT DISTINCT SubQuery2.playerID 
  FROM
  ( SELECT GameID, PlayerID, OpponentTeam, TeamID AS OpponentTeamID,    TeamName AS  OpponentName, ClubID AS OpponentTeamClubID  
	FROM
    (  SELECT GameID, PlayerID, ClubID AS PresentClubID, ClubName as  PresentClubName, 
	   CASE  WHEN Team2 = TeamID THEN Team1
			 WHEN Team1 = TeamID THEN Team2
			 END AS OpponentTeam
			 FROM game 
			 NATURAL JOIN playerteam 
			 NATURAL JOIN team 
			 NATURAL JOIN club 
			 WHERE  PlayerID IN
			 ( SELECT DISTINCT PlayerID
			   FROM player 
			   NATURAL JOIN clubplayer 
			   NATURAL JOIN club
			   WHERE ToDate IS NOT NULL
			)
	) AS  SubQuery1
	LEFT OUTER JOIN team ON SubQuery1.OpponentTeam = team.TeamID
) AS SubQuery2
RIGHT OUTER JOIN
( SELECT PlayerID, ClubID as PreviousClubID 
  FROM
  (	SELECT DISTINCT PlayerID
	FROM game 
	NATURAL JOIN playerteam 
	NATURAL JOIN team 
	NATURAL JOIN club 
	WHERE PlayerID IN
	( SELECT DISTINCT PlayerID
	  FROM player 
	  NATURAL JOIN clubplayer 
	  NATURAL JOIN club
	  WHERE ToDate IS NOT NULL
	)
  ) AS SubQuery1 
  NATURAL JOIN clubplayer 
  NATURAL JOIN club 
  WHERE todate IS NOT NULL
) AS SubQuery3
ON SubQuery2.OpponentTeamClubID = SubQuery3.PreviousClubID );

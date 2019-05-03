SELECT TeamName, SeasonYear
FROM ( SELECT FirstTeam.SeasonYear,FirstTeam.Team1, SUM(FirstTeamVictory+ IFNULL(SecondTeamVictory, 0)) AS VICTORIES
	 FROM ( SELECT SeasonYear, Team1, SUM(T1Victory) AS FirstTeamVictory
            FROM ( SELECT SeasonYear, Team1, (T1Score > T2Score) AS T1Victory
                   FROM game NATURAL JOIN season
            ) FirstTeamVictories
			GROUP BY SeasonYear, Team1
		  ) AS FirstTeam	
     LEFT OUTER JOIN
     ( SELECT SeasonYear, Team2, SUM(T2Victory) AS SecondTeamVictory
	 FROM ( SELECT SeasonYear, Team2, (T1Score < T2Score) As T2Victory
		    FROM game NATURAL JOIN season
		   ) FirstTeamVictories
           GROUP BY SeasonYear, Team2) AS SecondTeam
     ON FirstTeam.SeasonYear = SecondTeam.SeasonYear AND FirstTeam.Team1 = SecondTeam.Team2
     GROUP BY FirstTeam.SeasonYear, FirstTeam.Team1
HAVING VICTORIES = 0) WINLESS 
INNER JOIN team 
ON Team1 = TeamID
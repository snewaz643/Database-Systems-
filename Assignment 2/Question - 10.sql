SELECT SUM(T1Score)  AS POINTS_IN_2017
FROM 
( SELECT * FROM
  ( SELECT Team1, T1Score 
    FROM game
    WHERE YEAR(MatchDate) = 2017
    AND Team1 IN
    ( SELECT TeamID 
      FROM team
      WHERE TeamType = 'Women 6-a-side'
      AND ClubID IN
      ( SELECT ClubID 
        FROM club
        WHERE ClubName = 'Melbourne City'
      )
    )
  ) AS FirstTeamStatistics

 UNION ALL

  ( SELECT Team2, T2Score 
     FROM game
     WHERE YEAR(MatchDate) = 2017 
     AND Team2 IN
     ( SELECT TeamID
        FROM team
        WHERE TeamType = 'Women 6-a-side'
        AND ClubID IN 
        ( SELECT ClubID 
          FROM club
          WHERE ClubName = 'Melbourne City'
         )
     )
  )
) AS SecondTeamStatistics;
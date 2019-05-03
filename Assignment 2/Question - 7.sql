SELECT ClubName , COUNT(*) AS FemaleCounts
FROM club
NATURAL JOIN clubplayer
NATURAL JOIN player
WHERE Sex = 'F'
GROUP BY ClubName
ORDER BY FemaleCounts
LIMIT 1;

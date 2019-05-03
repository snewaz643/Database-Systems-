SELECT LEFT(lastname,1) AS Surnames, COUNT(*) AS Counts
FROM player GROUP BY LEFT(lastname,1) ORDER BY LEFT(lastname,1)
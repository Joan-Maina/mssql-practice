SELECT * FROM 
(
SELECT con.contest_id CONID, con.hacker_id HACKID, con.name NM, 
    (SELECT SUM(total_submissions) FROM Submission_Stats SS INNER JOIN [Challenges] Chal 
        ON SS.challenge_id = Chal.challenge_id INNER JOIN [Colleges] Col ON Col.college_id = 
        Chal.college_id INNER JOIN [Contests] ON Contests.contest_id = Col.contest_id 
        WHERE Col.contest_id = con.contest_id)  TotalSub, 
    (SELECT SUM(total_accepted_submissions) FROM Submission_Stats SS INNER JOIN [Challenges] Chal 
        ON SS.challenge_id = Chal.challenge_id INNER JOIN [Colleges] Col ON Col.college_id = 
        Chal.college_id INNER JOIN [Contests] ON Contests.contest_id = Col.contest_id 
        WHERE Col.contest_id = con.contest_id)  TotalAccepted, 
    (SELECT SUM(total_views) FROM View_Stats SS INNER JOIN [Challenges] Chal 
        ON SS.challenge_id = Chal.challenge_id INNER JOIN [Colleges] Col ON Col.college_id = 
        Chal.college_id INNER JOIN [Contests] ON Contests.contest_id = Col.contest_id 
        WHERE Col.contest_id = con.contest_id)  TotalViews, 
    (SELECT SUM(total_unique_views) FROM View_Stats SS INNER JOIN [Challenges] Chal 
        ON SS.challenge_id = Chal.challenge_id INNER JOIN [Colleges] Col ON Col.college_id = 
        Chal.college_id INNER JOIN [Contests] ON Contests.contest_id = Col.contest_id 
        WHERE Col.contest_id = con.contest_id)  TotalUniqueViews
    
FROM [Contests] con 
    ) dt 

WHERE  (TotalSub <> 0 AND TotalAccepted <> 0 AND TotalViews <> 0 AND TotalUniqueViews <> 0)
ORDER BY CONID;
USE GenZ;
SELECT * FROM dbo.Data

/* SELECT 
    influences,
    SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) AS 'Count_F',
    ROUND((SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS 'Percentage_F',
    SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) AS 'Count_M',
    ROUND((SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS 'Percentage_M',
    SUM(CASE WHEN Gender = 'Other' THEN 1 ELSE 0 END) AS 'Count_Other',
    ROUND((SUM(CASE WHEN Gender = 'Other' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS 'Percentage_Other'
FROM 
    table_name
GROUP BY 
    influences;
-------------------------------------------------------------------------------------	
	percentage formula: 
	ROUND(COUNT(*) *100.0/ (SELECT COUNT(*) from dbo.Data),2) As 'Percentage of total' 
	
	
	*/
--Q1.What is the gender distribution of respondents from India?--
Select Gender, Count(*) as Count
from dbo.Data 
where Country='India'
Group by Gender

--Q2.What percentage of respondents from India are interested in education abroad and sponsorship?--
Select 
[Higher_Education_Aspiration],
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dbo.Data), 2) AS 'Percentage of Higher education'
from dbo.Data 
where Country='India' and Higher_Education_Aspiration IN('Yes','Need a sponsor')
group by Higher_Education_Aspiration


--Q3.What are the 6 top influences on career aspirations for respondents in India?--
Select top 6 Influence_factors,
count(Influence_factors) as count 
from dbo.Data
where Country='India'
group by Influence_factors
order by count desc

--Q4.How do career aspiration influences vary by gender in India?--
Select Influence_factors,
SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) AS 'Count_F',
SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) AS 'Count_M',
SUM(CASE WHEN Gender = 'Other' THEN 1 ELSE 0 END) AS 'Count_O',
SUM(CASE WHEN Gender = 'Transgender' THEN 1 ELSE 0 END) AS 'Count_Transgender'
from dbo.Data
where Country='India' 
group by Influence_factors

--Q5.What percentage of respondents are willing to work for a company for at least 3 years?--
Select _3_years_Tenurity,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dbo.Data), 2) AS 'Percentage of 3 years tenurity'
from dbo.Data
where Country='India' and _3_years_Tenurity='Yes' 
group by _3_years_Tenurity


--Q6. How many respondents prefer to work for socially impactful companies?--
Select Company_with_mislaigned_mission,
count(*) as count
from dbo.Data
where country='India' and Company_with_mislaigned_mission='No'
group by Company_with_mislaigned_mission

--Q7.. How does the preference for socially impactful companies vary by gender?--
Select Company_with_mislaigned_mission,
SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) AS 'Count_F',
SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) AS 'Count_M',
SUM(CASE WHEN Gender = 'Other' THEN 1 ELSE 0 END) AS 'Count_O',
SUM(CASE WHEN Gender = 'Transgender' THEN 1 ELSE 0 END) AS 'Count_Transgender'
from dbo.Data
where Country='India' and Company_with_mislaigned_mission='No' 
group by Company_with_mislaigned_mission

--Q8. What is the distribution of minimum expected salary in the first three years among respondents?
Select Minimum_expected_monthly_salary_in_Hand_for_first_3_years, 
Count(*) as Count
from dbo.Data 
where Country='India'
Group by Minimum_expected_monthly_salary_in_Hand_for_first_3_years

--Q9. What is the expected minimum monthly salary in hand?--
Select Minimum_expected_salary_as_fresher, 
Count(*) as Count
from dbo.Data 
where Country='India'
Group by Minimum_expected_salary_as_fresher
Order by Count Desc

--Q10. What percentage of respondents prefer remote working?--
Select Preferred_working_environment,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dbo.Data), 2) AS 'Percentage of remote working'
from dbo.Data
where Country='India' and Preferred_working_environment IN('Fully Remote','Remote with travel options')
group by Preferred_working_environment

--Q11. What is the preferred number of daily work hours?--
Select Daily_expected_working_hours, 
Count(*) as Count
from dbo.Data 
where Country='India'
Group by Daily_expected_working_hours
Order by Count Desc

--Q12. What are the common work frustrations among respondents?--
Select What_would_frustrate_you_at_work, 
Count(*) as Count
from dbo.Data 
where Country='India'
Group by What_would_frustrate_you_at_work
Order by Count Desc


--Q13. How does the need for work-life balance interventions vary by gender?--
Select What_would_make_you_happier_and_productive_at_work,
SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) AS 'Count_F',
SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) AS 'Count_M',
SUM(CASE WHEN Gender = 'Other' THEN 1 ELSE 0 END) AS 'Count_O',
SUM(CASE WHEN Gender = 'Transgender' THEN 1 ELSE 0 END) AS 'Count_Transgender'
from dbo.Data
where Country='India' 
group by What_would_make_you_happier_and_productive_at_work

--Q14. How many respondents are willing to work under an abusive manager?--
Select Working_with_verbal_abuse_manager, 
Count(*) as Count
from dbo.Data 
where Country='India' and Working_with_verbal_abuse_manager='Yes'
Group by Working_with_verbal_abuse_manager 
Order by Count Desc

--Q15. What is the distribution of minimum expected salary after five years?--
Select Minimum_expected_monthly_salary_in_Hand_for_first_5_years, 
Count(*) as Count
from dbo.Data 
where Country='India'
Group by Minimum_expected_monthly_salary_in_Hand_for_first_5_years
Order by Count DESC

--Q16. What are the remote working preferences by gender?----
Select Preferred_working_environment,
SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) AS 'Count_F',
SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) AS 'Count_M',
SUM(CASE WHEN Gender = 'Other' THEN 1 ELSE 0 END) AS 'Count_O',
SUM(CASE WHEN Gender = 'Transgender' THEN 1 ELSE 0 END) AS 'Count_Transgender'
from dbo.Data
where Country='India' and Preferred_working_environment IN('Fully Remote','Remote with travel options')
group by Preferred_working_environment

--Q17. What are the top work frustrations for each gender?--
SELECT 
Gender,
What_would_frustrate_you_at_work AS "Top Work Frustration"
FROM (
    SELECT 
	    Gender,
        What_would_frustrate_you_at_work,
        ROW_NUMBER() OVER (PARTITION BY Gender ORDER BY COUNT(*) DESC) AS rn
    FROM dbo.Data
	WHERE What_would_frustrate_you_at_work IS NOT NULL
    GROUP BY Gender, What_would_frustrate_you_at_work
) AS Ranked
WHERE rn = 1;


--Q18. What factors boost work happiness and productivity for respondents?--
Select What_would_make_you_happier_and_productive_at_work, 
Count(*) as Count
from dbo.Data 
where Country='India'
Group by What_would_make_you_happier_and_productive_at_work
Order by Count DESC

--Q19. What percentage of respondents need sponsorship for education abroad?- - 
Select Higher_Education_Aspiration,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dbo.Data), 2) AS 'Percentage of Higher education'
from dbo.Data 
where Country='India' and Higher_Education_Aspiration='Need a sponsor'
group by Higher_Education_Aspiration



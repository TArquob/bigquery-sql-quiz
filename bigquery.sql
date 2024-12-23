-- This query shows a list of the daily top Google Search terms.
SELECT
 refresh_date AS week,
 term  AS Top_Term,
 rank
FROM `bigquery-public-data.google_trends.top_terms`
WHERE
 rank = 1 OR
 rank= 3 
 -- Choose only the top term each day.
 AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
AND dma_name= "UK"
 -- Filter to the last 2 weeks.
GROUP BY week,Top_Term, rank 
ORDER BY week DESC 
 -- Show the days in reverse chronological order.
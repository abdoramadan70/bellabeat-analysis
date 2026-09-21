-- Bellabeat Smart Device Usage Analysis
-- Analyze Stage


-- 1. Summary Statistics
SELECT
  AVG(TotalSteps) AS avg_steps,
  AVG(TotalDistance) AS avg_distance,
  AVG(Calories) AS avg_calories,
  MIN(TotalSteps) AS min_steps,
  MIN(TotalDistance) AS min_distance,
  MIN(Calories) AS min_calories,
  MAX(TotalSteps) AS max_steps,
  MAX(TotalDistance) AS max_distance,
  MAX(Calories) AS max_calories
FROM `project-e48f5d78-a5e7-45de-a67.Bellabeat.dailyActivity`;


-- 2. Average Steps by Day of Week
SELECT
  FORMAT_DATE('%A', ActivityDate) AS day_of_week,
  AVG(TotalSteps) AS avg_steps
FROM `project-e48f5d78-a5e7-45de-a67.Bellabeat.dailyActivity`
GROUP BY day_of_week
ORDER BY avg_steps DESC;


-- 3. Average Steps and Calories by Day of Week
SELECT
  FORMAT_DATE('%A', ActivityDate) AS day_of_week,
  AVG(TotalSteps) AS avg_steps,
  AVG(Calories) AS avg_calories
FROM `project-e48f5d78-a5e7-45de-a67.Bellabeat.dailyActivity`
GROUP BY day_of_week
ORDER BY avg_steps DESC;


-- 4. Relationship Between Steps and Calories
SELECT
  CORR(TotalSteps, Calories) AS correlation
FROM `project-e48f5d78-a5e7-45de-a67.Bellabeat.dailyActivity`;


-- 5. Activity Minutes by Day of Week
SELECT
  FORMAT_DATE('%A', ActivityDate) AS day_of_week,
  AVG(VeryActiveMinutes) AS avg_very_active_minutes,
  AVG(FairlyActiveMinutes) AS avg_fairly_active_minutes,
  AVG(LightlyActiveMinutes) AS avg_lightly_active_minutes
FROM `project-e48f5d78-a5e7-45de-a67.Bellabeat.dailyActivity`
GROUP BY day_of_week
ORDER BY day_of_week DESC;


-- 6. Save Weekday Summary for Visualization
CREATE OR REPLACE TABLE
`project-e48f5d78-a5e7-45de-a67.Bellabeat.daily_summary` AS
SELECT
  FORMAT_DATE('%A', ActivityDate) AS day_of_week,
  AVG(TotalSteps) AS avg_steps,
  AVG(Calories) AS avg_calories
FROM `project-e48f5d78-a5e7-45de-a67.Bellabeat.dailyActivity`
GROUP BY day_of_week
ORDER BY avg_steps DESC;

-- Summary statistics
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

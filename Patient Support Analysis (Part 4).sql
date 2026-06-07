WITH monthly_counts AS (
  SELECT 
    EXTRACT('year' FROM call_date) AS yr,
    EXTRACT('month' FROM call_date) AS mth,
    COUNT(*) AS mth_call
  FROM callers
  WHERE call_duration_secs > 300
  GROUP BY 
    EXTRACT('year' FROM call_date),
    EXTRACT('month' FROM call_date)
),
lagged_counts AS (
  SELECT 
    yr, 
    mth, 
    mth_call, 
    LAG(mth_call) OVER(ORDER BY yr, mth) AS prev_mth_call 
  FROM monthly_counts
)
SELECT 
  yr, 
  mth, 
  ROUND((mth_call - prev_mth_call) * 100.0 / prev_mth_call, 1) AS long_calls_growth_pct 
FROM lagged_counts
ORDER BY yr, mth;

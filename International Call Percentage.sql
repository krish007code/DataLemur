SELECT
  ROUND(SUM(case when caller_country = receiver_country then 0 else 1 end) * 100.0/ count(*), 1) as international_calls_pct
FROM(
SELECT
  pc.caller_id as caller_id,
  pi1.country_id as caller_country,
  pi2.caller_id as reciever_id,
  pi2.country_id as receiver_country
FROM phone_calls as pc JOIN phone_info as pi1
ON pc.caller_id = pi1.caller_id
JOIN phone_info as pi2
ON pc.receiver_id = pi2.caller_id
) as subq

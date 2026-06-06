WITH CTE AS(
SELECT
  contact_id,
  event_type,
  extract(week from event_date) as week,
  lead(extract(week from event_date), 1) over(partition by contact_id order by event_date) as next_event,
  lead(extract(week from event_date), 2) over(partition by contact_id order by event_date) as next_next_event,
  SUM(case when event_type = 'trial_request' then 1 else 0 end) OVER(PARTITION BY contact_id)as s
FROM marketing_touches
order by contact_id
)
SELECT email from CTE join crm_contacts on CTE.contact_id = crm_contacts.contact_id WHERE next_next_event - next_event = 1 and next_event - week = 1 and s > 0

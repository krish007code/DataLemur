SELECT 
  sq1.laptop_views, sq2.mobile_views from
    (SELECT count(*) as laptop_views from viewership where device_type = 'laptop') as sq1,
    (SELECT count(*) as mobile_views from viewership where device_type in ('tablet', 'phone')) as sq2;

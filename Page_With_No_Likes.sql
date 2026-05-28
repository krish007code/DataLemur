select p.page_id from pages as p
left outer join page_likes as pl
on p.page_id = pl.page_id
where pl.page_id is NULL;

select * from trip where owner_id = 504;

update trip set date = DATE_TRUNC('day', date) where owner_id = 504;
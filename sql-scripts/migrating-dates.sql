-- migrating date format
update trip set date = '2014-05-01' where date = '2014-06-01' or date = '3914-06-01';
update trip set date = '2014-05-02' where date = '2014-06-02' or date = '3914-06-02';
update trip set date = '2014-05-03' where date = '2014-06-03' or date = '3914-06-03';
update trip set date = '2014-05-04' where date = '2014-06-04' or date = '3914-06-04';
update trip set date = '2014-05-05' where date = '2014-06-05' or date = '3914-06-05';
update trip set date = '2014-05-06' where date = '2014-06-06' or date = '3914-06-06';

-- Find trips registered on saturday/sunday
select * from trip where date = '2014-05-03';
select * from trip where date = '2014-05-04';

delete from profile_base as p where p.owner_id = 273;
delete from _group_users as g where g.user_base_id = 273;
delete from _user_passwd_history as h where h.user_base_id = 273;
delete from login_record as l where l.owner_id = 273;
delete from permission as p where p.user_id = 273;
delete from _user as u where u.id = 273;
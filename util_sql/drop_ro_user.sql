REVOKE ALL ON ALL TABLES IN SCHEMA public FROM ro_user;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA public FROM ro_user;
REVOKE ALL ON ALL FUNCTIONS IN SCHEMA public FROM ro_user;
REASSIGN OWNED BY ro_user TO {{admin_user}};
DROP OWNED BY ro_user;
DROP USER ro_user;

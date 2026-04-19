CREATE USER seafile WITH ENCRYPTED PASSWORD 'password';
CREATE USER seahub WITH ENCRYPTED PASSWORD 'password';

CREATE DATABASE ccnet OWNER seafile;
CREATE DATABASE seafile OWNER seafile;
CREATE DATABASE seahub OWNER seahub;

\c ccnet
GRANT ALL ON SCHEMA public TO seafile;

\c seafile
GRANT ALL ON SCHEMA public TO seafile;

\c seahub
GRANT ALL ON SCHEMA public TO seahub;

CREATE USER 'seafile'@'%' IDENTIFIED BY 'password';
CREATE USER 'seahub'@'%' IDENTIFIED BY 'password';

CREATE DATABASE ccnet;
CREATE DATABASE seafile;
CREATE DATABASE seahub;

GRANT ALL PRIVILEGES ON ccnet.* TO 'seafile'@'%';
GRANT ALL PRIVILEGES ON seafile.* TO 'seafile'@'%';
GRANT ALL PRIVILEGES ON seahub.* TO 'seahub'@'%';

drop schema if EXISTS`jenkins_asia`;
CREATE SCHEMA `jenkins_asia` DEFAULT CHARACTER SET utf8 ;
create user 'db_jenkins_asia'@'localhost' identified by 'db_jenkins_asia';
grant all on jenkins_asia.* to 'db_jenkins_asia'@'%';
grant all on jenkins_asia.* to 'db_jenkins_asia'@'localhost';
flush privileges;
commit;
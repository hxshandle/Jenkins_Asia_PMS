drop schema `collabtive07`;
CREATE SCHEMA `collabtive07` DEFAULT CHARACTER SET utf8 ;
grant all on collabtive07.* to 'db_collabtive07'@'%';
flush privileges;
commit;
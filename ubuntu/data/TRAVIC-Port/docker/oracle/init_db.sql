
CREATE TABLESPACE tbs_travic_port_def
  DATAFILE 'tbs_travic_port_def.dat'
    SIZE 2G
  ONLINE;

CREATE TEMPORARY TABLESPACE tbs_travic_port_tmp
  TEMPFILE 'tbs_travic_port_tmp.dbf'
    SIZE 100M
    AUTOEXTEND ON;

CREATE USER travic_port
  IDENTIFIED BY travic_port
  DEFAULT TABLESPACE tbs_travic_port_def
  TEMPORARY TABLESPACE tbs_travic_port_tmp
  QUOTA 2G on tbs_travic_port_def;


GRANT CONNECT TO travic_port;
GRANT CREATE SESSION, GRANT ANY PRIVILEGE TO travic_port;
GRANT UNLIMITED TABLESPACE TO travic_port;
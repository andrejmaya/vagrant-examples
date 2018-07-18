* tar `TRAVIC-Port-4.1.0_db-install-oracle.tar.gz` into `docker/oracle` dir
* `docker-compose up -d`
* `docker-compose exec -d oracle bash -c 'sqlplus system/oracle@//127.0.0.1:1521/xe @/opt/docker/init_db.sql'`
* `docker-compose exec -d oracle bash -c 'cd /opt/docker/database/oracle && sqlplus system/oracle@//127.0.0.1:1521/xe @install.sql tbs_travic_port_def travic_port'`
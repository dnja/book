## mysql5.7
***
    wget http://repo.mysql.com/mysql57-community-release-el7-8.noarch.rpm
    rpm -ivh mysql57-community-release-el7-8.noarch.rpm
    yum -y install mysql-server
    systemctl restart mysqld.service
    grep "password" /var/log/mysqld.log
    (A temporary password is generated for root@localhost: piK<*VKn,0sQ)
    mysql -uroot -p
    alter user 'root'@'localhost' identified by '1qaz@WSX';
    flush privileges;
    create user 'root'@'%' identified by '1qaz@WSX';
    flush privileges;
    GRANT ALL PRIVILEGES ON  *.* TO 'root'@'%';
    flush privileges;

## 安装nginx
    wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
    rpm -ivh epel-release-6-8.noarch.rpm
    yum -y install nginx

## 安装MYSQL
    yum -y install mysql-devel mysql-server
    Centos7中用MariaDB代替了mysql数据库
    yum -y install mariadb mariadb-server 

## 安装PHP
    yum -y install php-devel php-fpm
    yum -y install php-mysql php-gd php-mbstring php-mcrypt
    yum -y install php-pecl-oauth

## 启动MYSQL与Httpd服务
    service nginx restart
    service mysqld restart (这块第一次启动会初始化，要稍等一段时间)
    chkconfig nginx on (自动启动)
    chkconfig mysqld on

## Centos7 操作
    systemctl start mariadb.service #启动MariaDB
    systemctl stop mariadb.service #停止MariaDB
    systemctl restart mariadb.service #重启MariaDB
    systemctl enable mariadb.service #设置开机启动

## 设置mysql密码
    mysqladmin -u root password 123456

## 检查开机自启动 systemctl list-unit-files | grep enabled

## CentOS 安全机制 SELinux 和 IPTables
- SELinux 关闭方式： 

      vim /etc/selinux/config
    
- 修改SELINUX： disabled （关闭） enforcing （启动） permissive （不阻止只提示） 

      setenforce 0

      service iptables stop
      chkconfig iptables off

- CentOS 7.0默认使用的是firewall作为防火墙

      systemctl stop firewalld.service #停止firewall
      systemctl disable firewalld.service #禁止firewall开机启动

- systemctl 命令的基本操作格式
- systemctl   动作   服务名.service
- start,stop,restart,status,enable,disable,is-enabled

- 使某服务自动启动  systemctl enable httpd.service
- 使某服务不自动启动 systemctl disable httpd.service
- 查看服务是否开机启动：systemctl is-enabled postfix.service;echo $?
- 检查服务状态 systemctl status httpd.service （服务详细信息） systemctl is-active httpd.service （仅显示是否 Active）
- 加入自定义服务 chkconfig --add test systemctl load test.service
- 删除服务 chkconfig --del xxx 停掉应用，删除相应的配置文件
- 显示所有已启动的服务 chkconfig --list systemctl list-units --type=service
- 查看已启动的服务列表：systemctl list-unit-files|grep enabled
- 启动某服务 service httpd start systemctl start httpd.service
- 停止某服务 service httpd stop systemctl stop httpd.service
- 重启某服务 service httpd restart systemctl restart httpd.service

- WorkerMan 需要的扩展

      yum install php-process 即可安装pcntl和posix扩展

- 为了能支持更大的并发连接数，建议安装event扩展或者libevent扩展
- PHP>=5.4

      yum install libevent-devel -y
      pecl install event   （前提 需要已经安装 php-pear）

- 注意提示：Include libevent OpenSSL support [yes] : 时输入no回车，其它直接敲回车就行
- 命令行运行（如果ini文件位置不对，可以通过运行php --ini找到实际加载的ini文件路径）

      echo extension=event.so > /etc/php.d/event.ini

- ibevent扩展不支持php7

      yum install libevent-devel
      pecl install channel://pecl.php.net/libevent-0.1.0 //提示libevent installation [autodetect]: 时按回车
      echo extension=libevent.so > /etc/php.d/libevent.ini

- linux 上传下载

      yum -y install lrzsz 
      sz filename   //send（发送）
      sz filename1 filename2
      sz dir/*
      rz     //received（接收）

      yum -y install epel-release
      rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

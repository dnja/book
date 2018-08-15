1.  桌面系统

-   [CentOS6] GNOME 2.x
-   [CentOS7] GNOME 3.x（GNOME Shell）

2.  文件系统
[CentOS6] ext4
[CentOS7] xfs

3.  内核版本
[CentOS6] 2.6.x-x
[CentOS7] 3.10.x-x

4.  启动加载器
[CentOS6] GRUB Legacy (+efibootmgr)
[CentOS7] GRUB2

5.  防火墙
[CentOS6] iptables
[CentOS7] firewalld

6.  默认数据库
[CentOS6] MySQL
[CentOS7] MariaDB

7.  文件结构
[CentOS6] /bin, /sbin, /lib, and /lib64在/下
[CentOS7] /bin, /sbin, /lib, and /lib64移到/usr下

8.  主机名
[CentOS6] /etc/sysconfig/network
[CentOS7] /etc/hostname

9.  时间同步
[CentOS6]
$ ntp
$ ntpq -p

[CentOS7]
$ chrony
$ chronyc sources

10.  修改时间
[CentOS6]
$ vim /etc/sysconfig/clock
   ZONE="Asia/Tokyo"
   UTC=fales
$ sudo ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

[CentOS7]
$ timedatectl set-timezone Asia/Tokyo
$ timedatectl status

11.  修改地区
[CentOS6]
$ vim /etc/sysconfig/i18n
   LANG="ja_JP.utf8"
$ /etc/sysconfig/i18n
$ locale

[CentOS7]
$ localectl set-locale LANG=ja_JP.utf8
$ localectl status

12.  服务相关

1）启动停止
[CentOS6]
$ service service_name start
$ service service_name stop
$ service sshd restart/status/reload

[CentOS7]
$ systemctl start service_name
$ systemctl stop service_name
$ systemctl restart/status/reload sshd

自启动
[CentOS6]
$ chkconfig service_name on/off

[CentOS7]
$ systemctl enable service_name
$ systemctl disable service_name

服务一览
[CentOS6]
$ chkconfig --list

[CentOS7]
$ systemctl list-unit-files
$ systemctl --type service

强制停止
[CentOS6]
$ kill -9 <PID>

[CentOS7]
$ systemctl kill --signal=9 sshd

13.  网络

1）网络信息
[CentOS6]
$ netstat
$ netstat -I
$ netstat -n

[CentOS7]
$ ip n
$ ip -s l
$ ss

2）IP地址MAC地址
[CentOS6]
$ ifconfig -a

[CentOS7]
$ ip address show

3）路由
[CentOS6]
$ route -n
$ route -A inet6 -n

[CentOS7]
$ ip route show
$ ip -6 route show

14.  重启关闭

1）关闭
[CentOS6]
$ shutdown -h now 

[CentOS7]
$ poweroff
$ systemctl poweroff

2）重启
[CentOS6]
$ reboot
$ shutdown -r now

[CentOS7]
$ reboot
$ systemctl reboot

3）单用户模式
[CentOS6]
$ init S

[CentOS7]
$ systemctl rescue

4）启动模式
[CentOS6]
[GUICUI]
$ vim /etc/inittab
  id:3:initdefault:
[CUIGUI]
$ startx

[CentOS7]
[GUICUI]
$ systemctl isolate multi-user.target
[CUIGUI]
$systemctl isolate graphical.target
默认
$ systemctl set-default graphical.target
$ systemctl set-default multi-user.target
当前
$ systemctl get-default

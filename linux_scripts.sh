# rpm -prefix

rpm -qpi redhat-lsb-1.3-3.1.EL3.i386.rpm
rpm -ivh --prefix=/opt rsync-2.5.7-5.3E.i386.rpm
----  error: package mysql-community-client is not relocatable
rpm -ql rsync

rpm -qa | grep namexx


yum install -y flex


# user group
groupadd postgres
useradd –g postgres –d /postgres –s /bin/bash –m postgres

Usage: useradd [options] LOGIN

Options:
  -b, --base-dir BASE_DIR       base directory for the home directory of the
                                new account
  -c, --comment COMMENT         GECOS field of the new account
  -d, --home-dir HOME_DIR       home directory of the new account
  -D, --defaults                print or change default useradd configuration
  -e, --expiredate EXPIRE_DATE  expiration date of the new account
  -f, --inactive INACTIVE       password inactivity period of the new account
  -g, --gid GROUP               name or ID of the primary group of the new
                                account
  -G, --groups GROUPS           list of supplementary groups of the new
                                account
  -h, --help                    display this help message and exit
  -k, --skel SKEL_DIR           use this alternative skeleton directory
  -K, --key KEY=VALUE           override /etc/login.defs defaults
  -l, --no-log-init             do not add the user to the lastlog and
                                faillog databases
  -m, --create-home             create the user's home directory
  -M, --no-create-home          do not create the user's home directory
  -N, --no-user-group           do not create a group with the same name as
                                the user
  -o, --non-unique              allow to create users with duplicate
                                (non-unique) UID
  -p, --password PASSWORD       encrypted password of the new account
  -r, --system                  create a system account
  -s, --shell SHELL             login shell of the new account
  -u, --uid UID                 user ID of the new account
  -U, --user-group              create a group with the same name as the user
  -Z, --selinux-user SEUSER     use a specific SEUSER for the SELinux user mapping

groupdel postgres
userdel [-f] postgres 

# disk
mount /dev/sdb1 /postgres
umount /dev/sdb1

# vi
0  行首
$ 行尾
G 文档尾部
gg 文档首部
I 在光标的行首
A 在光标的行尾
d0 删除至行首
yy 复制整行
p 粘贴至游标后
P 粘贴至光标前
nu 显示行号

set fileencoding


# 目录下的最新文件名
ls -lrt | grep csv| tail -n 1 | awk '{print $9}'

ls -lrt | grep csv| head -1


# date
date "+%Y-%m-%d %H:%M:%S" 
# date minus
ftp_start=`date "+%s"`
ftp_end=`date "+%s"`
ftp_time=$(expr  $ftp_end - $ftp_start)


1.CPU占用最多的前10个进程： 
ps auxw|head -1;ps auxw|sort -rn -k3|head -10 
2.内存消耗最多的前10个进程 
ps auxw|head -1;ps auxw|sort -rn -k4|head -10 
3.虚拟内存使用最多的前10个进程 
ps auxw|head -1;ps auxw|sort -rn -k5|head -10


lscpu
hdparm  -i /dev/sda1  
hdparm -tT /dev/sdb1
dd if=/dev/zero of=toto bs=8k count=244140


scp -r pgsql_xc danghb@10.1.239.18:/home/danghb/adb21
scp datanodeExtraConfig danghb@10.1.239.18:/home/danghb/pgxc_ctl


## for
value=$1
count=$2
for k in $( seq 1 $count  )
do
  psql -p 5432 -d postgres -U zjcmc -c "insert into test_kpi values ($value)"
done


cat > iplist <<EOF
root password 192.168.1.1 dang dang
root password 192.168.1.1 dang dang
root password 192.168.1.1 dang dang
root password 192.168.1.1 dang dang
EOF


cat $1|while read line; do
rootuser=`awk 'BEGIN {split("'"$line"'",arr);print arr[1]}'`
rootpasswd=`awk 'BEGIN {split("'"$line"'",arr);print arr[2]}'`
ipaddr=`awk 'BEGIN {split("'"$line"'",arr);print arr[3]}'`
newusername=`awk 'BEGIN {split("'"$line"'",arr);print arr[4]}'`
newuserpasswd=`awk 'BEGIN {split("'"$line"'",arr);print arr[5]}'`
# execute add user
echo "---------------add user $newusername on host $ipaddr-------------"
expect exp_adduser.exp $rootuser $rootpasswd $ipaddr $newusername $newuserpasswd
done


## version
cat /etc/redhat-release 

## ssh
ssh-keygen
ssh-copy-id -i .ssh/id_rsa.pub localhost2
ssh-copy-id -i .ssh/id_rsa.pub localhost3


## perl module
perldoc -t perllocal | grep "Module" |grep CSV

## kill
ps -ef | grep pgbadger |awk '{if($3!="1") print "kill -9 "$2}'|sh


## crontab
每五分钟执行  */5 * * * *
每小时执行     0 * * * *
每天执行        0 0 * * *
每周执行       0 0 * * 0
每月执行        0 0 1 * *
每年执行       0 0 1 1 *


## strings

tmp_dir=/home/dang/tmp/
echo ${#tmp_dir}
echo ${tmp_dir:0:${#tmp_dir}-1}

tmp_dir=${tmp_dir:0:${#tmp_dir}-1}
copysql_name=${copysql_name:0:${#copysql_name}-1}

sh gene_copysql.sh   /home/dang/tmp/ copy_test


## mon
nmon
nmon -h
nmon -f -t -s 60 -f 43200
nmon -f -T -s 30 -f 180




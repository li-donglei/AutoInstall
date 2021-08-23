##===========  Auto Install Script v1.0 =========
##===========  linux 软件自动安装脚本  ===========
##===========    Ubuntu Centos
##===========    Ububtu apt-get install xxx
##===========    Centos yum install

##=== Programming Language
###  Java jdk8
###    Go
###    c++ gcc make g++
###    python38
###    PHP nodejs 
###    git
###    MySQL   
###    docker

print_info()
{
	# echo -e -n "\033[41;37m 请输入要安装的软件名称:  \033[0m" 红底白字
	# \033[31m 红色字 \033[0m 红色字
	echo "#################################################"
	echo "请选择一下软件: "
	echo -e "\033[31m jdk8 tomcat docker \n go python3.8 gcc g++ \n git \033[0m"
	echo "#################################################"
}


## ============ Ubuntu ========  init -> function
## 判断是否安装 whereis git

u_init()
{
	echo "更新 apt apt-get"
	sudo apt update
	sudo apt-get update
}

## gcc
u_gcc()
{
	echo "安装 gcc"
	sudo apt-get install gcc
}
## g ++
u_gplusplus()
{
	echo "安装 g++"
	sudo apt-get install g++
}

## make
u_make()
{
	echo "安装 make"
	sudo apt-get install make
}

## jdk8
u_jdk8()
{
	echo "安装 jdk1.8"
	sudo apt-get install openjdk-8-jdk
}

u_python38()
{
	echo "安装 python3.8 ... "
	sudo apt-get install python3.8
}

##  MySQL Install 
u_mysql()
{
	## sudo systemctl status mysql
	## sudo cat /etc/mysql/debian.cnf
	## mysql -u debian-sys-maint -p
	echo "ubuntu 安装 mysql...."
	sudo apt install mysql-server
	# \033[41;37m 红底白字  \033[0m
	echo -e "\033[41;37m 安装完成，后续步骤：\033[0m"
	echo "sudo systemctl status mysql"
	echo "sudo cat /etc/mysql/debian.cnf"
	echo "mysql -u debian-sys-maint -p"
	echo "use mysql;"
	echo "update user set authentication_string=password('新密码') where user='root';"
	echo "flush privileges;"
	echo "quit;"
}

## Ubuntu docker 
u_docker()
{
	echo "安装 docker..."
	sudo apt-get install -y docker.io
	echo -e "\033[41;37m 安装完成，后续步骤：\033[0m"
	echo "启动docker: systemctl start docker"
	echo "设置开机启动: systemctl enable docker"
	echo "查看docker版本: docker version"
}

u_git()
{
	echo "安装 git..."
	sudo apt-get install git
	echo -e "\033[41;37m Git安装完成，后续步骤(配置账号信息)：\033[0m"
	echo "git config --global user.name 'yourname'"
	echo "git config --global user.email 'youremail'"
}


## ========  Centos ======
c_mysql()
{
	echo "centos install mysql"
}


## ========== main ========
u_main()
{
	echo "your system is Ubuntu"
	print_info
	echo -e -n "\033[41;37m 请输入要安装的软件名称:  \033[0m"
	read -p "  " name
	if [ $name = "jdk8" ]
	then
		u_jdk8
	elif [ $name = "python3.8" ]
	then
		u_python38
	elif [ $name = "gcc" ]
	then 
		u_gcc
	elif [ $name = "make" ]
	then 
		u_make
	elif [ $name = "g++" ]
	then 
		u_gcc
		u_make
		u_gplusplus
	elif [ $name = "docker" ]
	then 
		u_docker
	elif [ $name = "git" ]
	then 
		u_git
	else
		echo -e "\033[41;37m 输入错误,请重新输入 \033[0m"
	fi
}

c_main()
{
	echo "your system is Centos"
	print_info
}
## main program
## sys_type : Ubuntu Centos
sys_type=$(cat /etc/issue)
sys_type=${sys_type:0:6}
if [ $sys_type = "Ubuntu" ]
then
	# u_init
	u_main
else
	echo "Centos"
fi


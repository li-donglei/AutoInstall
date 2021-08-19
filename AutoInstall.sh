##=========== Auto Install Script v1.0 =========
##===========  linux 软件自动安装脚本  ===========
##===========   Ubuntu Centos
##===========    Ububtu apt-get install xxx
##===========    Centos yum install

##=== Programming Language
###  Java jdk8
###    Go
###    c++ gcc make g++
###    python38
###    PHP
###    git
###    MySQL   
###    docker

print_info()
{
	echo "#################################################"
	echo "please choose software: "
	echo "jdk1.8 tomcat docker go python3.8 gcc g++"
	echo "#################################################"
}


## ============ Ubuntu ========  init -> function

u_init()
{
	echo "updating apt"
	sudo apt update
}

## gcc
u_gcc()
{
	echo "install gcc"
	sudo apt-get install gcc
}
## g ++
u_gplusplus()
{
	echo "install g++"
	sudo apt-get install g++
}

## make
u_make()
{
	echo "install make"
	sudo apt-get install make
}

## jdk8
u_jdk8()
{
	echo "install jdk1.8"
	sudo apt-get install openjdk-8-jdk
}

u_python38()
{
	echo "install python3.8 ... "
	sudo apt-get install python3.8
}

##  MySQL Install 
u_mysql()
{
	## sudo systemctl status mysql
	## sudo cat /etc/mysql/debian.cnf
	## mysql -u debian-sys-maint -p
	echo "ubuntu install mysql...."
	sudo apt install mysql-server
	echo "finished........."
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
	read -p "please input the name: " name
	if [ $name = "jdk1.8" ]
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
	u_init
	u_main
else
	echo "Centos"
fi


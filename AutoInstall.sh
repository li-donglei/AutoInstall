



print_info()
{
	echo "#################################################"
	echo "please choose software: "
	echo "jdk1.8 tomcat docker go python3.8 gcc g++"
	echo "#################################################"
}

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
	u_main
else
	echo "Centos"
fi


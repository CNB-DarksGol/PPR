#bin/bash
clear
USER="root"
PASS="123"
START=0
ERROR=0
COMMAN=Ok

erro (){
	echo
	sleep 3
	echo
	echo Login Incorrect
}

welcome (){ 
echo
echo Debian GNU/Linux 8 jessie tty1
echo
}
welcome;

while [ $START == 0 ]; do

echo -n "jessie login: "
read LOG
echo -n "Password: "
read -s PASS

if (( $ERROR == 5 )); then
	clear
fi

if [ $LOG == "vagrant" ]; then
	if [ $PASS == "vagrant" ]; then
		echo
		echo -n "vagrant@jessie:~$ "
		read COMMAN
		
		START=1 
	else
		erro;
		let ERROR=($ERROR + 1)
	fi
else
	let ERROR=($ERROR + 1)
	erro;
fi

if (( $ERROR == 5 )); then
	ERROR=0
	clear
	welcome;
fi
done

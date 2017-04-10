#!/bin/bash
clear

sistema(){
echo -n "Digite o SISTEMA: "
read SYS
}

distribuicao(){
echo -n "Digite a DISTRIBUICAO: "
read OPE
}

linux(){
if [ $SYS == "Linux" ] || [ $SYS == "linux" ]; then

	echo -n "Digite o IP: "
	read IP

		if [ $IP != "0.0.0.0" ]; then
			sed -i 's/dhcp/static/g' /etc/network/interfaces
		fi 

	echo -n "Digite a NETMASK: "
	read MASK
	echo -n "Digite o GATEWAY: "
	read GATE


	#Deixando bonitinho :3
	echo >> endereco-linux.txt
	echo "#.=.=.=.=.=.=.=.=.=.=.=.=#" >> endereco-linux.txt
	echo "#     Ultima alteracao   #" >> endereco-linux.txt
	echo "#.=.=.=.=.=.=.=.=.=.=.=.=#" >> endereco-linux.txt
	echo >> endereco-linux.txt

	#Data de ultima alteracao:
		date >> endereco-linux.txt
	echo >> endereco-linux.txt

	#Backup do endereco:
	echo IP: $IP >> endereco-linux.txt
	echo "	address" $IP >> /etc/network/interfaces
	echo NETMASK: $MASK >> endereco-linux.txt
	echo "	netmask" $MASK >> /etc/network/interfaces
	echo GATEWAY: $GATE >> endereco-linux.txt
	echo "	gateway" $GATE >> /etc/network/interfaces

fi
}

roteador(){
if [ $SYS == "Roteador" ] || [ $SYS == "roteador" ]; then
	distribuicao;
	if [ $OPE == "Cisco" ] || [ $OPE == "cisco" ]; then
	
		echo -n "Digite a INTERFACE: "
		read INT
		echo -n "Digite o IP: "
		read IP
		echo -n "Digite a NETMASK: "
		read MASK

		sshpass -p "senai132" ssh ssh@192.168.1.1 << EOF
	
		enable		
		senai123
		configure terminal
		
EOF

		#Deixando bonitinho :3
		echo >> endereco-cisco.txt
		echo "#.=.=.=.=.=.=.=.=.=.=.=.=#" >> endereco-cisco.txt
		echo "#     Ultima alteracao   #" >> endereco-cisco.txt
		echo "#.=.=.=.=.=.=.=.=.=.=.=.=#" >> endereco-cisco.txt
		echo >> endereco-cisco.txt

		#Data de ultima alteracao:
			date >> endereco-cisco.txt
		echo >> endereco-cisco.txt

		#Backup do endereco:
		echo INTERFACE: $INT >> endereco-cisco.txt
		echo IP: $IP >> endereco-cisco.txt
		echo NETMASK: $MASK >> endereco-cisco.txt

	fi
fi
}

sistema;
linux;
roteador;

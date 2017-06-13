#!/bin/bash
ENC_WALLET=~/path/to/my/wallet.enc # where is your encrypted wallet?
DEC_WALLET=~/where/to/decrypt/to/wallet.dec # where do you want it decrypted to?
MODE='TIMED' # this can be TIMED or WAIT
WAIT='20' # how long should we wait?
CIPHER='des' # openssl cipher to use. Only change this if you know what you're doing

openssl $CIPHER -d -in $ENC_WALLET -out $DEC_WALLET 2> /tmp/err
# clear

if [ -s /tmp/err ]
then
	clear
	echo ''
	echo 'Wrong password, or something else is broken /shrug'
	echo ''
	exit
else 

	
	echo $MODE
	if [ "$MODE" == "TIMED" ]
	then
		while [ "$WAIT" -gt "0" ]
		do
			clear
			echo "--------------------"
			echo "| Wallet Decrypted |"
			echo "--------------------"
			echo ""
			echo "Deleting in $WAIT second(s)"
			sleep 1
			WAIT=$[$WAIT-1]
			clear
		done
	else
		clear
		echo "--------------------"
		echo "| Wallet Decrypted |"
		echo "--------------------"
		echo ""
		read -p "Hit enter when done to delete decrypted wallet"
	fi
fi

rm -P $DEC_WALLET

echo "Decrypted wallet deleted from $DEC_WALLET"


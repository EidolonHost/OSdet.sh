#!/bin/bash
# Pretty Colors
OK='\033[92m'
WARNING='\033[93m'
FAIL='\033[91m'
ENDC='\033[0m'

echo -e " $OK Beginning OS detection. $ENDC ";

# Determine Distribution
if [ -f /etc/lsb-release ]
then
ver=`cat /etc/lsb-release | awk /'ID=*/{print $1}' | cut -d "=" -f 2`
if [ $ver == "Ubuntu" ]
  then OS="Ubuntu"
elif [ $ver == "Debian" ]
  then OS="Debian"
else
  echo -e " $FAIL Your System is Not Supported $ENDC "
  exit 1
fi
elif [ -f /etc/redhat-release ]
then OS="CentOS"
else
echo -e " $FAIL Your System is Not Supported $ENDC "
exit 1
fi
echo -e " $OK We've determined the OS. Let's move on."
echo -e "$OK You're running on `arch` with $OS $ENDC"

if [ "$OS" == "CentOS" ]
then yum update
else [ "$OS" = "Debian" ]
then apt-get update
else
echo -e "$FAIL We could not update! $ENDC"
fi
elif [ "$OS" = "Ubuntu" ]
then apt-get update
else
echo -e "$OK OS update completed... moving on!"
fi

exit ) exit
showMenu
;;

*) echo -e " $FAIL ERROR! $ENDC ";
echo "Press Enter to continue..." ;
read
;;
esac

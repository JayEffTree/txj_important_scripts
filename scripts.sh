#!/bin/bash

run_install()
{
        read -p "Do you want to install missing packages? [Y/n]: " answer
        answer=${answer:Y}
        [[ $answer =~ [Yy] ]] && apt-get install ${boostlibnames[@]}
}

boostlibnames=("dialog")
dpkg -s "${boostlibnames[@]}" >/dev/null 2>&1 || run_install


HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Scripts."
TITLE="TXJ's Tools"
MENU="Choose one of the following:"

OPTIONS=(1 "Install netdata."
         2 "Run Seedtest."
         3 "Exit.")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "$(apt install netdata -y)"
            ;;
        2)
            echo "$(speedtest --share)"
            ;;
        3)
            echo "Exiting."
            ;;
esac

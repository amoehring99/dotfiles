#! /bin/bash
isTransparent="false"
scriptpath=/home/amoehring99/.config/picom
script=switch_transparency.sh
config=$scriptpath/picom.conf
transparentConfig=$scriptpath/picom_transparent.conf

if [[ "$1" == "true" ]]; then
    isTransparent="false"
elif [[ "$1" == "false" ]]; then
    isTransparent="true"
fi

killall picom
sleep 0.01

if [ "$isTransparent" == "true" ]
then
  sed -i '2s/.*/isTransparent="false"/' "$scriptpath/$script"
  picom -b --config "$config"
else
  sed -i '2s/.*/isTransparent="true"/' "$scriptpath/$script"
  picom -b --config "$transparentConfig" 
fi

 #!/bin/sh
percentage=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E 'percentage:' | cut -d':' -f2 | xargs | awk '{$0=int($0)}1'`
energyrate=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E 'energy-rate:' | cut -d':' -f2 | xargs | awk '{$0=int($0)}1'`
status=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E 'state:' | cut -d':' -f2 | xargs`

# Define the number of blocks to represent battery status
half_blocks=8
# Calculate color based on battery percentage

# RGB color fade: from 0-100 percent from red to green
# starting red 250 0 0 to yellow 250 250 0 to green 0 250 0
if [ "$percentage" -le 50 ]; then
	r=250
	g=$((percentage * 250 / 50))
	b=0
else
	r=$(((100 - percentage) * 250 / 50))
	g=250
	b=0
fi
    color="<fc=#$(printf '%02x%02x%02x' "$r" "$g" "$b")>"

# Calculate the number of blocks to fill based on battery percentage
half_filled_blocks=$(((percentage * half_blocks) / 100))

# Draw the blocks
bar="$color╭"
for ((i=0; i<half_filled_blocks / 2; i++)); do
    bar+="●─"
done

if [ $percentage -ne 100 ]; then
	[ $((half_filled_blocks % 2)) -eq 1 ] && bar+="◐─" || bar+="○─"
fi

for ((i=half_filled_blocks / 2 + 1; i< half_blocks / 2; i++)); do
    bar+="○─"
done
bar+="</fc>"


if [ $status = "charging" ]; then
echo "${bar}[${energyrate}W] "
else
echo "${bar}[${percentage}%] "
fi
exit 0

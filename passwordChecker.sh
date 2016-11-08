#./bin/bash
length=0
number=0
symbol=0

read -p "enter your password, hit return to end:" -s pass
echo

#test length
if (( "${#pass}" >= "8" )); then
	length=1
fi

#test numbers
for (( i = 0; i < ${#pass}; i++ )); do
	char=${pass:$i:1}
	if [[ "$char" == "0" || "$char" == "1" || "$char" == "2" || "$char" == "3" || "$char" == "4" || "$char" == "5" || "$char" == "6" || "$char" == "7" || "$char" == "8" || $"$char" == "9" ]]; then
		number=1
	elif [[ "$char" == "@" || "$char" == "#" || "$char" == "$" || "$char" == "%" || "$char" == "&" || "$char" == "*" || "$char" == "+" || "$char" == "-" || "$char" == "=" ]]; then
		symbol=1
	fi
done

security=$(($number+$length+$symbol))

if [[ "$security" == "3" ]]; then
	echo "Strong"
elif [[ "$security" == "2" ]]; then
	echo "Moderate"
elif [[ "$security" == "1" ]]; then
	echo "Weak"
else
	echo "Password meets no conditions"
fi
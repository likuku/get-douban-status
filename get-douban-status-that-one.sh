#!/usr/bin/env zsh

DIRNAME=$(echo $1 | sed -e "s/\//_/g" | sed -e "s/\:/_/g")
DIRNAME="${DIRNAME%_}"

echo $DIRNAME
mkdir $DIRNAME
cd $DIRNAME

if [[ ${1} != */ ]]; then
    echo "${1} tail is not /"
    wget $1/;
    wait;
fi
wget $1;
wait;

for i in $(curl -s $1/ | grep "raw" | awk -F "\"" '{print $2}' | xargs);
do
	wget $i;
	wait;
done;

echo "";
echo $DIRNAME

#!/usr/bin/env bash
# set -euxo pipefail

if [ ! -d ./output ]
then 
	echo "mkdir output"
	mkdir ./output
fi

for file in `ls ./tests`
do
	if [ -f ./tests/$file ]
	then
		echo "java -Xmx500M -cp "/usr/local/lib/antlr-4.9.3-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig SafeCLexer tokens -tokens ../tests/$file > ../output/$file.output"
		cd ./grammar 
		java -Xmx500M -cp "/usr/local/lib/antlr-4.9.3-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig SafeCLexer tokens -tokens ../tests/$file > ../output/$file.output
		cd ..
	fi
done

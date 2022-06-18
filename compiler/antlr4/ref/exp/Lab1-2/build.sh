#!/usr/bin/env bash
# set -euxo pipefail

if [ ! -d "build" ]; then
	echo "mkdir ./build"
    mkdir build
fi

cd build

if [ -d "antlr4_runtime" ]; then
	echo "save ./build/antlr4_runtime and clean ./build"
	if [ -d "/tmp/antlr4_runtime" ]
	then 
		rm -rf /tmp/antlr4_runtime 
	fi
    mv ./antlr4_runtime /tmp
    rm -rf ./*
    mv /tmp/antlr4_runtime ./    
	rm -rf /tmp/antlr4_runtime 
else
    rm -rf ./*
fi

echo "cmake .."
cmake ..

echo "make -j4"
make -j4

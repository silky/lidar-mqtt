#!/bin/bash
echo "Backing lib"
rm -rf lib_bk
rm -rf build
mkdir build
mv lib lib_bk
mkdir tmp
mkdir lib
cd tmp
echo "Downloading Paho mqtt cpp ...."
curl -LO https://github.com/eclipse/paho.mqtt.cpp/archive/v1.0.0.zip
unzip v1.0.0.zip
echo "Downloading Paho mqtt c..."
curl -LO https://github.com/eclipse/paho.mqtt.c/archive/v1.2.1.tar.gz
tar -xvf v1.2.1.tar.gz
echo "Downloading jsoncpp...."
curl -LO https://github.com/open-source-parsers/jsoncpp/archive/1.8.4.tar.gz
tar -xvf 1.8.4.tar.gz
echo "Copying the necessary files to lib"
cp paho.mqtt.cpp-1.0.0/src/*.cpp ../lib/
cp -r paho.mqtt.cpp-1.0.0/src/mqtt ../lib/
cp paho.mqtt.c-1.2.1/src/*.c ../lib/
cp paho.mqtt.c-1.2.1/src/*.h ../lib/
cd jsoncpp-1.8.4
python amalgamate.py
cp dist/jsoncpp.cpp ../../lib/
cp -R dist/json ../../lib/
cd ../../
cp ./lib_bk/CMakeLists.txt ./lib/
cp ./lib_bk/VersionInfo.h ./lib/
echo "Removing the temporary files"
rm -rf ./tmp/
rm -rf ./lib_bk/
echo "Finished setup"


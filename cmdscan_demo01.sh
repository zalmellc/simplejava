#!/bin/sh -x
echo "Clean Environment"
echo "================="
echo " "
rm -rf simplejava 
rm -rf mylib 
rm -rf mylibclassonly
rm t2.scan

echo "Check Out Code"
echo "=============="
echo " "
git clone --depth 1 git@github.com:zalmellc/simplejava.git

echo "Get Dependencies"
echo "================"
echo " "
#
# Get only compiled libs only .  Comment this line and uncomment below to get source.
#
#git clone --depth 1  git@github.com:zalmellc/mylibclassonly.git
#mv mylibclassonly mylib

# Uncomment line below to get 
git clone git@github.com:zalmellc/mylib.git

echo "SCA Translate"
echo "=============="
echo " "
sourceanalyzer -b t2 -clean
sourceanalyzer -b t2 -verbose . -cp mylib


echo "SCA Scan Code"
echo "=============="
echo " "
sourceanalyzer -b t2 -verbose -scan > t2.scan

echo "Show Scan Results"
echo "================="
echo " "
cat t2.scan

echo "Finish Cleanup"
echo "=============="
echo " "


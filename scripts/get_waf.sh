#! /bin/sh

set -e
set -x

WAFVER=waf-1.9.13
WAFURL=https://waf.io/waf-1.9.13.tar.bz2

mkdir -p waf-tmp
chmod 755 waf-tmp
cd waf-tmp > /dev/null 2>&1
( which wget > /dev/null && wget -qO $WAFVER.tar.bz2 $WAFURL ) || ( which curl > /dev/null && curl -o $WAFVER.tar.bz2 $WAFURL )
tar jxf ./$WAFVER.tar.bz2 > /dev/null 2>&1
cd $WAFVER
python ./waf-light configure build --tools=syms
cp -fv waf ../../waf > /dev/null 2>&1
cd ..
cd ..
rm -rfv waf-tmp > /dev/null 2>&1

chmod +x waf

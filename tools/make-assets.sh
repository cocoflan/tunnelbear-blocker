#!/usr/bin/env bash
#
# This script assumes a linux environment

DES=$1/assets

printf "*** Packaging assets in $DES... "

pushd .. > /dev/null
rm -rf uAssets
git clone https://github.com/uBlockOrigin/uAssets.git
popd > /dev/null

rm -rf $DES
mkdir $DES
cp    ./assets/assets.json                                       $DES/

mkdir $DES/thirdparties
cp -R ../uAssets/thirdparties/easylist-downloads.adblockplus.org $DES/thirdparties/
cp -R ../uAssets/thirdparties/mirror1.malwaredomains.com         $DES/thirdparties/
cp -R ../uAssets/thirdparties/pgl.yoyo.org                       $DES/thirdparties/
cp -R ../uAssets/thirdparties/publicsuffix.org                   $DES/thirdparties/
cp -R ../uAssets/thirdparties/www.malwaredomainlist.com          $DES/thirdparties/

mkdir $DES/ublock
cp -R ../uAssets/filters/*                                       $DES/ublock/

echo "done."

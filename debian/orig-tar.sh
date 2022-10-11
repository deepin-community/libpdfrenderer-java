#!/bin/sh -e

VERSION=$2
TAR=../libpdfrenderer-java_$VERSION.orig.tar.gz
DIR=pdfrenderer-$VERSION
TAG=$(echo "release-$VERSION")

svn export https://svn.java.net/svn/pdf-renderer~svn/tags/${TAG}/ $DIR
tar -c -z --exclude '*/javadoc/*' --exclude '*.zip' --exclude '*.jar' -f $TAR $DIR
rm -rf $DIR ../$TAG

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir && echo "moved $TAR to $origDir"
fi

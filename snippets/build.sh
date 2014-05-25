#!/bin/sh

cd assets
./build.sh
cd ..

SRC="assets manifest.json *.js *.html"

rm -r build
mkdir -p build
cp -a $SRC build
cd build

read -p 'Snippets URL? ' SNIPPETS_URL
for f in *.js *.html; do
  sed -i '' "s/\$(SNIPPETS_URL)/$SNIPPETS_URL/g" $f
done

zip snippets.zip -r $SRC
mv snippets.zip ..

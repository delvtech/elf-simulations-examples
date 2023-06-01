rm -rf public docs/source/autoapi
mkdir public
./scripts/notebook_docs.sh
cp -r build/* ../public/
cp index.html ../public/
rm -rf build

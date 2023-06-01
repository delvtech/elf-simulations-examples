rm -rf public docs/source/autoapi
mkdir public
./notebook_docs.sh
cp -r build/* ../public/
rm -rf build

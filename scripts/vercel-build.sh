source ~/.bashrc
source .venv/bin/activate
rm -rf public
mkdir public
./scripts/notebook_docs.sh
cp -r build/* ../public/
cp index.html ../public/
rm -rf build

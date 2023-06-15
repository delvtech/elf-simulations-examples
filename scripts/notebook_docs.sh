#!/bin/bash

# Paths set to be relative to the location of this script
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo $SCRIPTPATH

outdir=$SCRIPTPATH/../build/
indir=$SCRIPTPATH/../examples/

mkdir -p $outdir
# Clean up notebook_build direcotry
rm $outdir/* > /dev/null

index_file=$outdir/index.html
touch $index_file

cd $indir
fail=0
declare -a failed_files=()
# Only do this for files ending in _notebook.py
for f in *.py
do
    # Strip filename of ext
    outfn=(${f//./ });
    echo "$f to $outfn.html";
    # Use Jupytext to convert python to notebook 
    # Pipe through stdin to jupyter
    # Use jupyter nbconvert to execute and convert to html
    # jupytext outputs final html file to stdout, but we don't need it
    # since jupyter has already made the file, so send to /dev/null
    jupytext --to ipynb --pipe-fmt ipynb -o '-' --check \
        "jupyter nbconvert --to html --execute --stdin --output $outdir/$outfn.html" $f > /dev/null;
    
    # Check output of jupytext, if it fails, keep running but store the fail flag for later
    if [[ $? -ne 0 ]]; then
      fail=1;
      failed_files+=("$f")
    else
      # Add this file and the link to index.html
      echo "<a href=\"$outfn.html\">$outfn</a>" >> $index_file
    fi
done

if [[ $fail == 1 ]]; then
    echo "Files ${failed_files[@]} failed";
    exit 1
fi

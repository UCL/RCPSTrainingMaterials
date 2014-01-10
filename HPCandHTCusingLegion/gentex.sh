#!/bin/bash

# Massive hack to work around issues with scons/pandoc/cygwin/pdflatex
# If you are on a "real" Unix-like system, you don't need this.
#
# Owain Kenway
# 7/January/2014
#
# 8/January/2014 - added day 2

# Get the template from our rsdpandoc directory
cp -R /usr/lib/python2.7/site-packages/rsdpandoc/assets .

# Get our assets
cp -R src/assets/* assets

for a in 1_intro_to_hpc  2_intro_to_shell  3_legion_overview  4_legion_batch  5_policies
do
# Pandoc it
pandoc --template=assets/report -V documentclass=scrartcl -V links-as-notes --filter pandoc-citeproc --default-image-extension=png -V linkcolor=uclmidgreen --number-sections src/$a.md -o $a.tex


# PDFlatex it (twice to deal with labels).
pdflatex $a.tex
pdflatex $a.tex

mkdir -p handouts
mv $a.pdf handouts

# Tidy up
rm $a.* 

done

rm -rf assets

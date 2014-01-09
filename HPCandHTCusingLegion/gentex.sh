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

# Pandoc it
pandoc --template=assets/report -V documentclass=scrartcl -V links-as-notes --filter pandoc-citeproc --default-image-extension=png -V linkcolor=uclmidgreen --number-sections src/day1.md -o day1.tex

pandoc --template=assets/report -V documentclass=scrartcl -V links-as-notes --filter pandoc-citeproc --default-image-extension=png -V linkcolor=uclmidgreen --number-sections src/day1.md -o day2.tex

# PDFlatex it (twice to deal with labels).
pdflatex day1.tex
pdflatex day1.tex
pdflatex day2.tex
pdflatex day2.tex

mkdir -p slides/day1
mkdir -p slides/day2
mv day1.pdf slides/day1/slides.pdf
mv day2.pdf slides/day2

# Tidy up
rm day1.* day2.*
rm -rf assets

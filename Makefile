PANDOC=pandoc

ROOT=""

PANDOCARGS=-t revealjs -s -V theme=night --css=http://lab.hakim.se/reveal-js/css/theme/night.css \
					 --css=$(ROOT)/css/ucl_reveal.css --css=$(ROOT)/site-styles/reveal.css \
           --default-image-extension=png --highlight-style=zenburn --mathjax -V revealjs-url=http://lab.hakim.se/reveal-js

default: _site

%-reveal.html: %.md Makefile
	cat $< | sed 's/\\\\\[/$$/g' | sed 's/\\\\\]/$$/g' | $(PANDOC) $(PANDOCARGS) -o $@

%.png: %.py Makefile
	python $< $@

%.png: %.nto Makefile
	neato $< -T png -o $@

%.png: %.dot Makefile
	dot $< -T png -o $@

%.png: %.uml Makefile
	plantuml -p < $< > $@

remaster.zip: Makefile
	rm -f remaster.zip
	wget https://github.com/UCL-RITS/indigo-jekyll/archive/remaster.zip

indigo-jekyll-remaster: Makefile remaster.zip
	rm -rf indigo-jekyll-remaster
	unzip remaster.zip
	touch indigo-jekyll-remaster

indigo: indigo-jekyll-remaster Makefile
	cp -r indigo-jekyll-remaster/indigo/images .
	cp -r indigo-jekyll-remaster/indigo/js .
	cp -r indigo-jekyll-remaster/indigo/css .
	cp -r indigo-jekyll-remaster/indigo/_includes .
	cp -r indigo-jekyll-remaster/indigo/_layouts .
	cp -r indigo-jekyll-remaster/indigo/favicon* .
	touch indigo

_site: indigo HPCandHTCusingLegion/1_intro_to_hpc-reveal.html \
	HPCandHTCusingLegion/3_legion_overview-reveal.html \
	HPCandHTCusingLegion/5_policies_and_misc-reveal.html \
	HPCandHTCusingLegion/7_exercise_solutions-reveal.html \
	HPCandHTCusingLegion/2_intro_to_shell-reveal.html \
	HPCandHTCusingLegion/4_legion_batch-reveal.html \
	HPCandHTCusingLegion/6_extras-reveal.html \
	SWCShell/intro_to_shell-reveal.html
	jekyll build	

clean:
	rm -f HPCandHTCusingLegion/*.html
	rm -f SWCShell/*.html
	rm -f index.html
	rm -rf _site
	rm -rf images js css _includes _layouts favicon* remaster.zip indigo-jekyll-remaster


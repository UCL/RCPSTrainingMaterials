PANDOC=pandoc

ROOT="/RCPSTrainingMaterials"

PANDOCARGS=-t revealjs -s -V theme=night --css=http://lab.hakim.se/reveal-js/css/theme/white.css \
					 --css=$(ROOT)/site-styles/local_reveal.css --css=$(ROOT)/site-styles/reveal.css \
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

master.zip: Makefile
	rm -f master.zip
	wget https://github.com/UCL-RITS/indigo-jekyll/archive/master.zip

indigo-jekyll-master: Makefile master.zip
	rm -rf indigo-jekyll-master
	unzip master.zip
	touch indigo-jekyll-master

indigo: indigo-jekyll-master Makefile
	cp -r indigo-jekyll-master/indigo/images .
	cp -r indigo-jekyll-master/indigo/js .
	cp -r indigo-jekyll-master/indigo/css .
	cp -r indigo-jekyll-master/indigo/_includes .
	cp -r indigo-jekyll-master/indigo/_layouts .
	cp -r indigo-jekyll-master/indigo/favicon* .
	touch indigo

_site: indigo HPCandHTCusingLegion/1_intro_to_hpc-reveal.html \
	HPCandHTCusingLegion/3_legion_overview-reveal.html \
	HPCandHTCusingLegion/5_policies_and_misc-reveal.html \
	HPCandHTCusingLegion/7_exercise_solutions-reveal.html \
	HPCandHTCusingLegion/2_intro_to_shell-reveal.html \
	HPCandHTCusingLegion/4_legion_batch-reveal.html \
	HPCandHTCusingLegion/6_extras-reveal.html
	jekyll build

clean:
	rm -f HPCandHTCusingLegion/*.html
	rm -f SWCShell/*.html
	rm -f index.html
	rm -rf _site
	rm -rf images js css _includes _layouts favicon* master.zip indigo-jekyll-master

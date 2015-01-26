Research Computing Platform Services Training Materials
=====================

This repository holds slides etc. for Research Computing Platform Services at
UCL training courses.  We run a variety of courses at UCL for researchers who
are interested in using our HPC services, and courses for researchers who wish
to develop software.

Please see
http://www.ucl.ac.uk/isd/staff/research_services/research-computing/services/training
for a list of courses and availability.

Build Instructions
------------------

You need:

The Dexy-ready version of UCL Indigo.

git clone https://github.com/UCL-RITS/indigo-dexy.git

A patched version of Dexy

sudo pip install git+git://github.com/UCL-RITS/dexy.git

Then, from this repo, edit dexyplugin.yaml with the path to the 
clone of indigo-dexy.

Finally, build with
dexy setup
dexy

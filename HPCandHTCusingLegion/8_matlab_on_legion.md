---
title: Running Matlab on Legion
slidelink: true
---

Running Matlab on Legion
========================

Matlab on Legion Overview
-------------------------

* Only works within one node so no MPI on Legion.
  - Largest nodes on Legion have 32 cores, but typically 12 or 16 cores.
* Matlab requires exclusive access to the node (use `#$ -ac exclusive` to request this in your submission script.
* Multi-threading is built in to some Matlab functions
  - Parallel Computing Toolbox is available on Legion for more control of threading
* Speed-up relative to desktop will not always be that great...
  - ...but, array jobs can increase throughput


Headless Matlab
---------------

Matlab tries by default to open a GUI when you start it, but we don't want this when a job is running on a compute node.

So, instead of typing `matlab`, we need to supress the GUI like this:

```
matlab -nodesktop -nodisplay -nojvm -nosplash
```

Headless Matlab
---------------

We also need to pass a Matlab script file to matlab since we can't use it interactively

Either:

```
matlab < my_script.m
```

Or:

```
matlab -r "run('my_script.m');quit;"
```

Headless Matlab
---------------

So altogether:

```
matlab -nodesktop -nodisplay -nojvm -nosplash < my_script.m
```

Or

```
matlab -nodesktop -nodisplay -nojvm -nosplash -r "run('my_script.m');quit;"
```

Exercise
--------

```
wget https://raw.githubusercontent.com/UCL-RITS/pi_examples/master/matlab_pi_dir/calcpi.m
```
1. Download the matlab pi example using the above command and try running it from the command line without the GUI
2. Have a look at the script to see how it works. Can you set an alternative value for n to change the number of slices?

Simple Matlab Submission Script
-------------------------------

Job Script:
```
#!/bin/bash -l
#$ -l h_rt=0:01:00
#$ -l mem=1G
#$ -pe smp 12
#$ -l matlab=1
#$ -ac exclusive
#$ -N My_Job_Name
#$ -wd /home/<your_UCL_id>/Scratch/<job_directory>

module load matlab/full/r2015a/8.5
matlab -nodisplay -nodesktop -nosplash -nojvm -r "run('my_script.m');quit;"
```

Important settings for Matlab
-----------------------------

| `#$ -l matlab=1` | Reserves one Matlab licence for your job. |
| `#$ -ac exclusive` | Request exclusive use of the node. |
| module load matlab... | Load the matlab module before running Matlab |

Exercise
--------

1. Write a submission script and submit a job to run the calcpi.m script
2. Edit your script to submit an array of four jobs. Use $SGE_TASK_ID to change the number of slices run by calcpi.m

Single thread mode
------------------

An alternative to requesting exclusive access to a whole node is to run Matlab in single thread mode:

```
matlab -nodisplay -nodesktop -nosplash -nojvm -singleCompThread
```


Interactive Matlab on Legion
----------------------------

** Do not use login nodes for production work **

It is actually possible to view the GUI from Matlab running on a login node, but you need an X server.

An X server runs on your local PC and takes care of displaying the GUI, handling mouse and keyboard interaction, and communicating these to the remote server.

We'll be using Exceed because UCL have a licence, but Xming (windows) or XQuartz (Mac) are alternatives.

Setup
-----

We need to set up the X server before logging in to Legion.

1. Find Exceed under programs and start it.
2. Open PuTTY and enter the Legion host name as usual, but also...
3. Go to Connection>SSH>X11 and enable X11 forwarding
4. Click Open, and login to Legion as normal

Interactive Matlab on Legion
----------------------------

On a login node, load a Matlab module and run Matlab without any options.

The Matlab GUI should launch.

Useful for visualising results.

** Do not use login nodes for production work **

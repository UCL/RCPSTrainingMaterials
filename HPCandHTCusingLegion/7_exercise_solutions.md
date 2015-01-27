---
title: Exercise Solutions
---

First Day
=========

### Exercise
 
> Create and copy a directory tree. Use the command "man cp" for more information

Okay, so, to create the directories:

```
mkdir -p one_dir/two_dir/three_dir
```

Then if you try to copy them, you'll see:
```
$ cp one_dir one_dir_copy
cp: omitting directory `one_dir'
```

If you check the `man` page, you'll see:

```
       -R, -r, --recursive
              copy directories recursively
```


Which means you should use:

```
$ cp -r one_dir one_dir_copy
```



### Exercise

> Write a script that creates five directories named `calculation_?`, where ? is a number.

`mk_dirs.sh`

```bash
#!/bin/bash

# Dumb method without loop
mkdir calculation_1 calculation_2 calculation_3 calculation_4 calculation_5

# Method using loop with all terms written out
for i in 1 2 3 4 5
do
  mkdir calculation_$i
done

# Method using loop running seq to get terms
for i in $(seq 1 5)
do
  mkdir calculation_$i
done

# Method using loop with C syntax
for (( i=1; i<=5; i++ ))
do
  mkdir calculation_$i
done

```


### Exercise

> write a `parent_script.sh` that creates and executes the `child_script.sh`
>
> write a `parent_script.sh` that creates and executes 10 different `child_script.sh` that print out their individual number

Okay, so first:

`parent_script.sh`


```bash
#!/bin/bash

echo "Parent script running."

echo "Making child script..."
cat <<EOF >child_script.sh
#!/bin/bash
echo "Child script running."
EOF

chmod +x child_script.sh

echo "Going to run child script."
./child_script.sh
echo "Child script finished."
```


Second:

`parent_script.sh`

```bash
#!/bin/bash

echo "Parent script running."


for i in $(seq 10)
do
echo "Making child script number $i in child_script_$i.sh ..."
cat <<EOF >child_script_$i.sh
#!/bin/bash
echo "Child script $i running."
EOF

chmod +x child_script_$i.sh
./child_script_$i.sh

done
```



### Exercise

> In `~/Scratch`...
>
> * Create the following directory tree:
>
>    `work`
>    `work/input_data`
>    `work/results`
>    `work/program`


```
mkdir work work/input_data work/results work/program
```

> * Create the file "`input.txt`" with some random lines in it.


```
echo "random line 1" >input.txt
echo "random line 2" >>input.txt
```

> * Move the file to `input_data` and rename it in the same command to `control01.txt`

```
mv input.txt work/input_data/control01.txt
```

> * Create the directory tree in one line only: `work/experiment/results/report`

```
mkdir -p work/experiment/results/report
```

> * Delete all directory trees created in one single command without explicit reference to any of the directory and file names except "`work`".

```
rm -r work
```


### Exercise

> Change the permission of a full directory tree with one single chmod command (look in the man pages for more information).

Because `chmod -r` would change the permissions of a file, `chmod` only uses `-R` for recursive action, so this is:

```
chmod -R g+w a_dir
```

for example, to give group write permissions to every file in a directory and that directory itself.

> When typing the command "`ls /sh`", press the tab key after typing "`/sh`". What happens?

It should auto-complete as far as it can without being ambiguous. On Legion and Aristotle, this should expand to `/shared`.


### Exercise

> Create a "Hello world"-like script using command line tools and execute it.
>
> Copy and alter your script to redirect output to a file using `>`.
>
> Alter your script to use `>>` instead of `>`. What effect does this have on its behaviour?


So, one file:

`hello_world.sh`


```bash
#!/bin/bash
echo "Hello World!"
```

Then:

`hello_world_redirect_1.sh`

```bash
#!/bin/bash
echo "Hello world!" > output.txt
```

Then:

`hello_world_redirect_2.sh`

```bash
#!/bin/bash
echo "Hello world!" >> output_append.txt
```

`output.txt` will be overwritten each time, while `output_append.txt` will be appended to because of the difference between `>` and `>>`.


### Exercise

> Use `seq 1 75 > numbers.txt` to generate a file containing a list of numbers. Use the `head`, `tail`, and `less` commands to look at it, then use `grep` to search it for a number.
>
> Use a combination of `head` and `tail` to get an exact line number

```
$ seq 1 75 > numbers.txt
$ less numbers.txt
$ head numbers.txt
1
2
3
4
5
6
7
8
9
10
$ tail numbers.txt
66
67
68
69
70
71
72
73
74
75
$ head -n 5 numbers.txt
1
2
3
4
5
$ head -n 5 numbers.txt | tail -n 1
5
$ grep 0 numbers.txt
10
20
30
40
50
60
70
```


### Exercise

> Using two nested scripts, show that the value of an exported variable in the environment where you launch the scripts, propagates all the way down to the second script.

So, two files:

`parent.sh`

```bash
#!/bin/bash

echo Setting variables in parent script:

variable_1=ham
variable_2=eggs

export variable_1

echo "variable_1: $variable_1"
echo "variable_2: $variable_2"

echo Running child script...

./child.sh

echo Child script finished, printing out parent script variable values again:
echo "variable_1: $variable_1"
echo "variable_2: $variable_2"
```

`child.sh`

```
#!/bin/bash

echo Child script variable values:
echo "variable_1: $variable_1"
echo "variable_2: $variable_2"
```

If you run these, you should see:

```
$ ./parent.sh
Setting variables in parent script:
variable_1: ham
variable_2: eggs
Running child script...
Child script variable values:
variable_1: ham
variable_2:
Child script finished, printing out parent script variable values again:
variable_1: ham
variable_2: eggs
```


### Exercise 

> Use the command `env` to discover more.

You should see a long list of variables something like this:

```
QTLIB=/usr/lib64/qt-3.3/lib
CVS_RSH=ssh
SSH_CONNECTION=128.41.10.106 61693 144.82.108.231 22
MODULESHOME=/shared/ucl/apps/modules-3.2.10-modlog
LESSOPEN=|/usr/bin/lesspipe.sh %s
CC=gcc
G_BROKEN_FILENAMES=1
```

### Exercise 

> Using `$1` and `$2`, write a script that print both variables to the screen.

So, for bonus points and to show some other related variables, here's a little extra:

`cmd_args.sh`

```bash
#!/bin/bash

echo "This is the first argument:  $1"
echo "This is the second argument: $2"
echo "This is the number of arguments: $#"
echo "And this is all the arguments: $@"
echo "\$* and \$@ do almost the same thing, but you probably always want to use \$@"
echo "\$* gets expanded slightly differently and can break arguments"
```


Second Day
==========


## Environment within a Job

### Exercise

> To see what environment variables are set by the scheduler, try making a job script that runs env and puts the output in a file.

You can take the job script from earlier in the notes as a starting point here, which looks like this:

`calculate_pi.sh`

```bash
#!/bin/bash -l
#$ -l h_rt=0:10:00
#$ -cwd

./calculate_pi
```

Then we just want to change it to run `env` and redirect the standard output (stdout) to a file, using the `>` operator, like this:

`env_to_file.sh`

```bash
#!/bin/bash -l
#$ -l h_rt=0:10:00
#$ -cwd

env >env.output.from_job
```

Submit this using `qsub` and you should have a file `env.output.from_job` containing all the environment variables defined in the shell the job is running as.


### Exercise

> Now `sort` the file, and compare it to your current environment to see what has changed.

The method shown here is only one of a few possible ways to do this.

Let’s first sort the file we got from the last step, by putting the file as an argument to the `sort` command, and redirecting the output into a new file:

```bash
sort env.output.from_job >env.output.from_job.sorted
```

Then get a sorted file containing your current environment:

```bash
env | sort >env.output.current.sorted
```

Now compare the two, side-by-side:

```bash
sdiff env.output.from_job.sorted env.output.current.sorted
```

## Requesting Threads

### Exercise

> Try modifying the script from before to run the new program.
 
### Exercise

> Run versions with 1, 2, 3, and 4 cores, and compare the timings.


As before, we can take the previous script and edit it a bit, adding in the new option to request some threads, getting something like this:

`openmp_pi.sh`

```bash
#!/bin/bash -l
#$ -l h_rt=0:10:00
#$ -l threads=4
#$ -cwd

./openmp_pi
```

At this point you can just use 4 different jobs, setting the `threads` requested value for each.

You should find that the time taken divides roughly as the number of threads you request.


## Multinode jobs
 
### Exercise

> Try modifying the script from before to run the new program, using 8 cores and the `qlc` parallel environment.

Since you’re given the 4 core version, it’s just a matter of changing the 4 to an 8. This should give you:

`mpi_pi.sh`

```bash
#!/bin/bash -l
#$ -l h_rt=0:10:00
#$ -pe qlc 8
#$ -cwd

gerun ./mpi_pi
```

You should find again that increasing this number reduces the time taken, with diminishing returns past a certain point. The output will tell you which nodes your job runs on, so you can tell whether it’s run on more than one actual node or not.


## Requesting an Array Job

### Exercise

> Try modifying the serial job script for `calculate_pi` to run 4 jobs as an array.

So, all we have to do is add in the array job option to the serial job script, to get:

`array_pi.sh`

```bash
#!/bin/bash -l
#$ -t 1-4
#$ -l h_rt=0:10:00
#$ -cwd

./calculate_pi
```


### Exercise

> `calculate_pi` can take an argument to tell it how many steps to use. Try controlling this with `$SGE_TASK_ID`.

We’re only using 4 jobs here, and 4 steps of calculating pi is hardly any calculation, so we can do more steps either by altering the way the array tasks are numbered:

```bash
# Gives 100,200,300,400 in SGE_TASK_ID variable
#$ -t 100-400:100
```

Or by adding some zeroes onto the end of the variable where it's used in the script:

`array_pi-vary_steps.sh`

```bash
#!/bin/bash -l
#$ -t 1-4
#$ -l h_rt=0:10:00
#$ -cwd

./calculate_pi ${SGE_TASK_ID}00
```


## Module Prerequisites

### Exercise

> Successfully load the latest Matlab module (`matlab/full/r2013a/default`).

This is mostly just an exercise in recognising what the modules system is telling you in terms of what requires what. Once you work out all the dependencies, you end up having to have typed:


```bash
module unload compilers
module load compilers/gnu/4.6.3
module load matlab/full/r2013a/default
```




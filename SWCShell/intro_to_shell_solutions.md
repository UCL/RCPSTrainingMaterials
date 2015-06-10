---
title: Introduction to the UNIX shell - Solutions
---

Navigating the filesystem
=========================

Exercise
--------

![](assets/filesystem-exercise1.png)

Exercise
--------
With reference to the directory structure shown above:

1. If ```pwd``` displays ```/home/user/project```, what will ```ls ../data``` display?
	+ ```survey1    backup    vars```
	+ *pwd* tells us we are in the project folder, so ```..``` will take us up to ```~```, and then
	```data``` refers to the directory called data inside ```~``` and not the one inside ```project```.
2. If ```pwd``` displays ```/home/user/data```, what command will display:
	+ ```ls ../project/data```
	+ This time we want a relative path from ```~/data/``` to ```~/project/data/```.
```
2015-01 	2015-02 	2015-03
```
When exploring the filesystem on Aristotle:
		
1. What does typing ```cd``` on its own do? Try typing it from several different locations.
2. What does typing ```cd -``` do? Try typing it from several different locations.

Solution
--------

1. 


File Manipulation
=================

Exercise:
--------

* Create the following directory tree in your home directory (```~```):
```
    work
    work/input_data/
    work/results/
    work/program/
```
* Create the file "input.txt" with a text editor and put some text in it.

* Move the file to work/input_data and rename it in the same command to control01.txt

* Create this directory tree in one line only: work/experiment/results/report

* Delete the work directory and all of its contents with one single command.

Wildcards, Redirection and Piping
=================================

Exercise
--------
```shell-training/data/``` contains 300 data files, each of which *should* contain 100 values.
One of these files is missing some data though...

* Use a series of commands connected by pipes to identify the file with missing data
* **hint** ```wc -w``` will tell you the number of values in a file, ```sort -n``` will sort numerically

Exercise
--------

* In IOM-animals, list all the animals with the word 'common' in their name alphabetically.
* **hint** ```grep -h``` will remove the file names from the output.

Variables and Loops
===================

Exercise
--------
* Use a for loop to create five directories called calculation_?, where ? is a number.
* Use a loop to create five directories, each one the parent of the next.

Exercise
--------

* In the wildcards directory, create a variable called *files* listing all of the text files.
* Loop through this list and print out the first line from each file.

Exercise
--------

* What will this command print to the screen?

```
[user@host wildcards]$ for filename in *.txt
> do
> echo $filename
> cat $filename > new-file.txt
> done
```

* What will the contents of new-file.txt be and why?

File properties and permissions
===============================

Exercise:
---------

* Recreate the a_directory/inside/the_other tree if you deleted it.

* Add write permission for users from your group for the full directory tree with one single **chmod** command (look in the man pages for more information).

* What happens if you can read but not execute a directory?	
	

Shell Scripting
===============

Exercise:
--------

* Create a "Hello world"-like script using a text editor and execute it.

* Redirect the output from your script to a file using &gt;.

Exercise
--------

* Write a script which will create as many numbered directories as you want when you run it.


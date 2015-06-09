---
title: Introduction to the UNIX shell
---


Introduction to the UNIX shell
==============================

Overview
--------

* Navigating the filesystem

* File manipulation

* Wildcards, redirection and piping

* Variables and loops

* File properties and permissions

* Scripts

* Screen


Connecting to a computer: 1970s
-------------------------------

![](assets/terminal-serial.svg)

Connecting to a computer: over the Internet
-------------------------------------------

![](assets/terminal-ssh.svg)

Communication *encrypted!*

Access to Aristotle
-------------------

* To access one of the login nodes (remotely) from a Unix machine:
``` 
ssh username@aristotle.rc.ucl.ac.uk
```

* Log on using UCL username/password

* On Windows (e.g. Desktop@UCL) you can use PuTTY.

Access to Aristotle
-------------------

![](assets/puttylocation.png)

Access to Aristotle
-------------------

![](assets/puttyconfig-aristotle.png)


Navigating the filesystem
=========================

Command Prompt
--------------

```
[user@host ~]$
```

* Has the form **[&lt;username&gt;@&lt;host name&gt; &lt;present directory&gt;]$**

* **&lt;user name&gt;** is the Unix user name (UCL user ID).

* **&lt;host name&gt;** is the name of the computer that you are accessing.

* **&lt;present directory&gt;** is the directory that the user is currently in.

Command Prompt
--------------

* Read evaluate print loop

	+ User types a command and presses enter

	+ The shell *reads* this command, and *executes* it

	+ The shell then *prints* any output to the screen and returns the command prompt to the user

Where am I?
-----------

```
[user@host ~]$ pwd
/home/user
[user@host ~]$

```

* **pwd** (print working directory) - returns the full path to your current working directory
* **~** 'tilde' is the current user's home directory

Unix Directory Basics
---------------------

```
/home/user: directory

/home: directory

/: directory
```

* **/** - the *root* directory

Filesystem structure
--------------------

![](assets/directorystructure.png)


What's in here?
---------------

```
[user@host ~]$ ls
file1.txt	file2.pdf	file3.dat
```

* **ls** - lists the contents of the current directory

Hidden files and directories
----------------------------

```
[user@host ~]$ ls -a
.	  			.cshrc			file1.txt
..				.configure		file2.pdf
.bash_history	.emacs			file3.dat
[user@host ~]$ 
```

* Files starting with "." are hidden

* **.** - Present working directory (in this case ~)
* **..** - Directory above (in this case /home)

Directory Navigation
--------------------

```
[user@host ~]$ pwd
/home/user
[user@host ~]$ cd ..
[user@host home]$ cd ..
[user@host /]$ 
```

* **cd** - change directory
* **pwd** - full path to present working directory
* **/** - the "root" directory


Absolute path
-------------

![](assets/abspath.png)

/home/alice

* absolute paths always begin with '/'

Relative path
-------------

![](assets/relpath.png)

../home/alice

What's over there?
------------------

* Give ls an *argument* to list the contents of another directory

```
[user@host ~]ls /home/user/work
...
[user@host ~]ls work
...
[user@host ~]ls ~/work
...
[user@host ~]ls ../user/work
```

* Always leave a space to separate arguments

Exercise
--------

![](assets/filesystem-exercise1.png)

Exercise
--------
With reference to the directory structure shown above:

1. If ```pwd``` displays ```/home/user/project```, what will ```ls ../data``` display?
2. If ```pwd``` displays ```/home/user/data```, what command will display:
```
2015-01 	2015-02 	2015-03
```
When exploring the filesystem on Aristotle:
		
1. What does typing ```cd``` on its own do? Try typing it from several different locations.
2. What does typing ```cd -``` do? Try typing it from several different locations.


File manipulation
=================

Directory creation
------------------

```
[user@host ~]$ mkdir a_directory
[user@host ~]$ ls
a_directory
[user@host ~]$ mkdir a_directory/inside/the_other
mkdir: cannot create directory `a_directory/inside/the_other': No such file or directory
```

* **mkdir** - create a directory


Directory creation
------------------

```
[user@host ~]$ mkdir -p a_directory/inside/the_other
[user@host ~]$ cd a_directory/inside/the_other
[user@host the_other]$ pwd
/home/user/a_directory/inside/the_other
```

* **mkdir -p** - creates consecutive sub-directories

Command switches
----------------

* The default behaviour of a command can be changed by adding switches, also known as flags or options
* These are arguments beginning with a dash e.g. ```ls -a``` or ```mkdir -p```
* Type *man* and then the name of a command for a list of switches and their behaviours, e.g.:
	+ ```man ls```
	+ ```man mkdir```
* Type 'q' to quit man pages

Touching a file
---------------

```
[user@host ~]$ touch a_file
[user@host ~]$ ls
a_directory	a_file
```

* **touch** - create or update the date of a file
* This is **not** usually how files are created

Editing files
-------------

```
[user@host ~]$ nano a_file
```

![](assets/nano.png)

* **nano** - simple file editor


Nano
----

![](assets/nano2.png)

* **nano** - simple file editor
* Commands are along the botton of editor screen
* ^ - shorthand for control key
* Ctrl-O to save, Ctrl-X to exit

Editors
-------

There are many other (better but more complex) text file editors on the system such as **vim**, **emacs** and **nedit**.

Use the one you feel most comfortable with.

Copying files
-------------

```
[user@host ~]$ cp a_file copy_of_a_file
[user@host ~]$ ls
a_directory	a_file	copy_of_a_file
```

* **cp** copy a file (or a directory tree)

Moving/Renaming files and directories
-------------------------------------

```
[user@host ~]$ mv a_file control.in
[user@host ~]$ ls
a_directory control.in	copy_of_a_file

[user@host ~]$ mv control.in a_directory

[user@host ~]$ ls a_directory
control.in inside
```

* **mv** - rename or move a file/directory
* It is possible to move and rename a file with one command

Deleting files and directories
------------------------------

```
[user@host ~]$ rm a_directory/control.in

[user@host ~]$ rm a_directory
rm: cannot remove `a_directory/': Is a directory

[user@host ~]$ rm -r a_directory
[user@host ~]$ 
```

* **rm** - delete a file
* **rm -r** - delete a directory and all its contents
* **rm operations are irreversible!!!**
* The -i argument is highly recommended

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

Tab completion
--------------

* Go to ```/shared/ucl/apps/examples/openmp_pi_dir```
* What happens if you type ```cd /sh``` and then press the *tab* key?

Inspecting files
----------------
```
[user@host ~]$ cd /shared/ucl/apps/examples/openmp_pi_dir
[user@host examples]$ less openmp_pi.f90
```

* **less** - visualise a text file:
    + use arrow keys
    + page up/page down
    + search by typing "/"
    + quit by typing "q"

Other file inspection tools
---------------------------

|:-------|:----------------------------------------------------------------------|
|head    |- visualise the first 10 lines of a file                               |
|tail    |- visualise the last 10 lines of a file                                |
|cat     |- concatenate files provided as input and dump the result to *stdout*  |
|sdiff   |- visualise and compare two files side-by-side                         |

(Use "man &lt;command&gt;" to see more information)

History repeating
-----------------
* Type ```history``` for a numbered list of your previous commands.
* Type ```!555``` where *555* is the number of a command you want to execute again.


Wildcards, Redirection and Piping
=================================

Some files to play with
-----------------------
```
[user@host ~]git clone https://github.com/tcouch/shell-training.git
...
[user@host ~]cd shell-training
```

Wildcards
---------

```
[user@host shell-training]$ cd wildcards
[user@host wildcards]$ wc *.txt
  13  119  683 abcde.txt
  10   52  168 abc.txt
   8   83  454 ab.txt
  26  206 1332 cake.txt
  11  105  656 cheesecake.txt
   7   61  394 def.txt
  13   85  561 food.txt
  11   99  589 xyz.txt
  99  810 4837 total
```

* `*` is a wildcard that matches zero or more characters.
* ```wc``` counts lines, words and bytes for each file

Wildcards
---------

```
[user@host wildcards]$ ls a*.txt
abcde.txt  abc.txt  ab.txt
```

* `*` is a wildcard that matches zero or more characters.

Wildcards
---------

```
[user@host wildcards]$ ls ???.txt
abc.txt	def.txt	xyz.txt
```

* `?` is also a wildcard. It matches a single character.

Wildcards
---------

```
[user@host wildcards]$ ls [fx]*
food.txt	xyz.txt
```

* Use square brackets to match any one of the characters indicated.

Output redirection and piping
-----------------------------

* Two very important concepts:

    + Standard Output (stdout) - default destination of a program's output. It is generally the terminal screen.

    + Standard Input (stdin) - default source of a program's input. It is generally the command line.


Redirecting output to a file
--------------------------

```
[user@host ~]$ echo hello > hello.txt
[user@host ~]$ echo hello again >> hello.txt
[user@host ~]$ cat hello.txt
hello
hello again
```

* ```>>``` appends the output to the end of an existing file.
* ```>``` will overwrite any existing content.

Redirecting output
------------------

```
[user@host ~]$ ls -R ~ > all-home.txt
```

* **&gt;** - redirect stdout to a file

```
[user@host ~]$ ls -R ~ | less
```

* **|** "pipe" stdout to stdin of another command
* ```ls -R``` recursively list all subdirectories

Output redirection and piping
-----------------------------

![](assets/process1.png)

Output redirection and piping
-----------------------------

![](assets/process2.png)

Redirecting StdErr
------------------

```
[cceatco@host wildcards]$ wc *.txt not_a_file > txt_list 2> txt_list_err
```

* ```2>``` redirects any error messages created by a command

Output redirection and piping
-----------------------------

ls -l

![](assets/process3.png)

Output redirection and piping
-----------------------------

ls -l > list_of_files

![](assets/process4.png)

Redirecting input
-----------------

You can also redirect standard input to a command, using ```<``` 
to send the contents of a file in place of command line input.

```
[user@host shell-training]$ bc -l < some-maths
3.14285714285714285714
9.99
16.66666666666666666666
10.312567
```

* **bc** allows calculations with floating point numbers.

Output redirection and piping
-----------------------------

You can chain any number of programs together to achieve your goal:

![](assets/process6.png)

This allows you to build up fairly complex workflows within one command-line.

Counting the classes
--------------------

I want to list all the animals on the Isle of Mann alphabetically and find the 50th item in that list:

```
[user@host ~]$ cd shell-training/IOM-animals
[cceatco@host IOM-animals]$ cat *.txt | sort | head -50 | tail -1 | animal50.txt
[cceatco@host IOM-animals]$ cat animal50.txt
	coot, fulica atra
```

* **cat** concatenate these files
* **sort** sort a list
* **head -50** show the first 50 lines only

Grep
----

```
[user@host IOM-animals]$ grep brown * > brown-animals.txt
[user@host IOM-animals]$ cat brown-animals.txt
insects.txt:    brown hawker, aeshna grandis
insects.txt:    meadow brown, maniola jurtina
mammals.txt:    brown long-eared bat, plecotus auritus
mammals.txt:    brown rat, rattus norvegicus
```

* **grep** prints lines containing a string.
	+ Can be used for finding strings in text files or filter output from a command

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

A simple variable
-----------------
```
[user@host ~]$ var1='hello'
[user@host ~]$ echo $var1 world!
hello world!
```

* Don't include spaces either side of the '=' sign.
* Variables can be referenced using the '$' sign and their name.

Quoting variables
-----------------
```
[user@host ~]$ myname="John Smith"
[user@host ~]$ echo "Hello my name is $myname. Nice to meet you."
Hello my name is John Smith. Nice to meet you.
[user@host ~]$ echo 'Hello my name is $myname. Nice to meet you.'
Hello my name is $myname. Nice to meet you.
```

* When using double quotes, bash will scan the contents and expand any variables

Quoting variables
-----------------
```
[user@host ~]$ fruit=orange
[user@host ~]$ echo "I love eating $fruits."
I love eating .
```

Quoting variables
-----------------
```
[user@host ~]$ echo "I love eating ${fruit}s."
I love eating oranges.
```

* In some cases you will need to surround a variable name with braces.

Arithmetic with variables
-------------------------
```
[user@host ~]$ two=2 
[user@host ~]$ result=$(( $two + 2 )) 
[user@host ~]$ echo $result  
4 
[user@host ~]$
```

* Integer arithmetic can be done inside $(( ))
    * \+  addition
    * \-   subtraction
    * /   integer division
    * \*   multiplication

Storing output of commands in variables 
---------------------------------------

Run commands inside **$( )** and assign the wrapped command to a variable

```
[user@host ~]$ ls 
a_directory  a_file 
[user@host ~]$ dir_contents=$( ls ) 
[user@host ~]$ echo $dir_contents 
a_directory a_file
```
	
Updated process diagram
-----------------------

![](assets/processenvvars.png)

Special environment variables
-----------------------------

What is the output of this command?

```
[user@host ~]$ echo $PATH
``` 

Note the structure: \<path1\>:\<path2\>:\<path3\>  

PATH is an environmental variable which Bash uses to search for commands typed on the command line without a full path. 

**Exercise:** Use the command **env** to discover more.

The for loop
------------

```
[user@host ~]$ for i in first second third
> do
> echo $i iteration
> done
first iteration
second iteration
third iteration
```

* Defines a loop in which the variable "i" will take the values "first", "second" and "third" in that order.
* **do/done** - start and end the loop iteration definition.

Looping through files
---------------------
```
[user@host IOM-animals]$ mkdir backup
[user@host IOM-animals]$ for i in *.txt
> do
> cp $i $i.backup
> done
[user@host IOM-animals]$ mv *.backup backup
```

The for loop using an iterator
------------------------------

```
[user@host ~]$ for (( i=1 ; i<=5 ; i++ )); do echo iteration$i; done
iteration1
iteration2
iteration3
iteration4
iteration5
```

(Note how it is possible to create number labels)

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

File properties
---------------

```
[user@host ~]$ ls -l
total 8
drwxr-xr-x 2 user rcops 4096 2009-12-08 07:31 a_directory
-rw-r--r-- 1 user rcops    0 2009-12-08 07:31 a_file
drwxr-xr-x 2 user rcops 4096 2009-12-08 06:50 Scratch

```

* **ls -l** - list file properties (details)

File properties
---------------

```
drwxr-xr-x 2 user rcops 4096 2009-12-08 07:31 a_directory

        drwxr-xr-x      - File type and permissions
        2				- Number of links to the file
        user         	- User name of file owner
        rcops           - Group to which the file belongs 
        4096            - size of file in bytes
        2009-12-08      - last change data
        07:31           - last change time
        a_directory     - file name
```


* **ls -l** - list file properties (details)

File permissions
----------------

* There are three user security classifications that apply to the ownership of a file:

    + **user:** the individual user that has ownership of the file

    + **group:** a group of users to which that user belongs

    + **others:** all other users (not owner or in that group)

* Each of these has three file access classifications:

    + **read:** permission to read the file

    + **write:** permission to write the file

    + **execute:** permission to execute (run) the file

File permissions
----------------

**drwxr-xr-x** has four fields:

|:-----|:----------------------------------------------|
| d    | - the file is a directory                     |
| rwx  | - the user has read, write and execute access |
| r-x  | - the group has read and execute access       |
| r-x  | - others have read and execute access         |



| Permissions | read | write | execute |
|:------------|:----:|:-----:|:-------:|
| rwx         | yes  | yes   | yes     |
| rw-         | yes  | yes   | no      |
| r--         | yes  | no    | no      |
| r-x         | yes  | no    | yes     |
| ---         | no   | no    | no      |

File permissions
----------------

```
[user@host ~]$ ls -l 
drwxr-xr-x 2 user rcops 4096 2009-12-08 07:31 a_directory
[user@host ~]$ chmod go-rx a_directory
[user@host ~]$ ls -l 
drwx------ 2 user rcops 4096 2009-12-08 07:31 a_directory
```

* **chmod** - change the permissions of a file

File permissions
----------------

How did the permissions definition go-rx work?

```
chmod [ugoa][+/-][rwx] file
```

* ugoa - user, group, other, all

* +/- - add/remove

* rwx - read, write, execute

If you don't specify u,g,o or a, default is **ALL** (so chmod +x makes file executable for everyone).

* **chmod** - change the permissions of a file

Exercise:
---------

* Recreate the a_directory/inside/the_other tree if you deleted it.

* Add write permission for users from your group for the full directory tree with one single **chmod** command (look in the man pages for more information).

* What happens if you can read but not execute a directory?	
	

Shell Scripting
===============

Shell scripting
---------------

```
#!/bin/bash
# This is a very simple hello world script.
echo "Hello, world!"
```

* \#! - tells the shell that it should use /bin/bash as the interpreter
* \# - a comment (ignored by /bin/bash)
* echo - a command that prints arguments to stdout

Running a script
----------------
Method 1
```
[user@host ~]$ bash hello_world.sh
```

* **bash** is the name of the shell you are using right now
* This starts a new instance of bash to run the commands in the script

Running a script
----------------
Method 2: making it executable

```
[user@host ~]$ chmod u+x hello_world.sh
[user@host ~]$ ls -l hello-world.sh
-rwxr--r-- 1 user ccaas0 30 Mar 31 17:10 hello_world.sh
[user@host ~]$ ./hello_world.sh
hello world!
```

* Why ```./hello_world.sh``` and not just ```hello_world.sh```?

Exercise:
--------

* Create a "Hello world"-like script using a text editor and execute it.

* Redirect the output from your script to a file using &gt;.

Variables in shell scripts
--------------------------

```
#!/bin/bash
# Another hello world script

message='Hello World'
echo $message
echo ${message}!
```

|:---------|:----------------------------------------------------------|
| #!       | tells the shell to use bash as the interpreter (/bin/bash)|
| #        | followed by a blank character is a comment line           |
| message  | variable to which the string 'Hello World' is assigned    |
| echo     | prints to screen the contents of the variable "$message"  |


Command line arguments
----------------------

Variables can also be defined through the command line

```
[user@host ~]$ ./script.sh var1 var2
```

Within the script:
$1 contains "var1"
$2 contains "var2"

Command line arguments
----------------------

```
#!/bin/bash

echo The first argument is $1
echo The second argument is $2
echo And together they make ${1}${2}
```

```
[user@host ~]$ ./var-script green house
The first argument is green
The second argument is house
And together they make greenhouse
```

The for loop revisited
----------------------

```
#!/bin/bash 
for i in $(seq -f %03g 1 4) 
do
   echo creating directory calculation$i
   mkdir calculation$i 
done 
echo finished!
```

You can now create directory trees and files automatically!

Exercise
--------

* Write a script which will create as many numbered directories as you want when you run it.

Process control
===============

Process control
---------------

* A process is in the:

    + **foreground** when it is interacting with the user via an interface (usually the shell).

    + **background** if it is running without interacting with the user. 

    + **suspended** if it is neither interacting nor running.

* To run a process in the background:
add the symbol "&" at the end of the command line.

* To send a foreground process to the backgound:
press Ctrl+z and then execute the command "bg"

* To bring a background process to the foreground:
execute the command "fg"

Which processes are running?
----------------------------

Use the **ps** command

```
[user@host ~]$ ps xjf
  PPID    PID   PGID    SID TTY       TPGID STAT   UID   TIME COMMAND
 67744  67753  67744  67744 ?            -1 S    181641   0:00 sshd: user@pts
 67753  67762  67762  67762 pts/1     75804 Ss   181641   0:00  \_ -bash
 67762  75782  75782  67762 pts/1     75804 S    181641   0:00      \_ sleep 30
 67762  75804  75804  67762 pts/1     75804 R+   181641   0:00      \_ ps -xjf
```


|:--------|:-----------------------------------------------------------|
| PID     | - the process ID                                           |
| TTY     | - the virtual teletype terminal this proces is attached to |
| TIME    | - the time the process has been running                    |
| CMD     | - the command that was called                              |

Killing processes
-----------------

Use the **kill** command with the process ID

```
[user@host ~]$ kill 75782
```

Or force termination with

```
[user@host ~]$ kill -9 75782
```


More information
----------------

* Many topics not covered here:
    + if statements
    + case switches
    + defining functions
    + and many, many more...

* Google and the **man** pages are your friends!


GNU Screen
==========

Intro to GNU Screen
-------------------

**Q: What happens if you want to:**

Log out and turn off your PC?

Go home and continue working?

Freely create and delete shell sessions within one terminal?

**A: Use a terminal multiplexer like GNU screen**

First, log into Aristotle
-------------------------

```
ssh user@aristotle.rc.ucl.ac.uk
```

(or use Putty)

![](assets/terminal-ssh.svg)

* Take a note of which login node you are assigned!

Then, run "screen"
------------------

```
screen
```

The screen will clear and you will be presented with a new prompt.

![](assets/terminal-screen-1.svg)

Do something in that shell (e.g.) "ls".

Creating new shells in Screen
-----------------------------

* Press **Ctrl-a**, then press **c**

* You'll be given another shell (what screen calls a "window")!

![](assets/terminal-screen-2.svg)

* Create new "windows" with **Ctrl-a, c**

* **Ctrl-a, a** switches between this window and your last one.

* Windows are numbered 0->N, **Ctrl-a, number** (e.g. **Ctrl-a, 3**) to switch to a particular one.


Detaching from your session
---------------------------

* **Ctrl-a, d** detaches from your session.

![](assets/terminal-screen-detached.svg)

* **screen -r** re-attaches.

Log out
-------

* You can log out of a machine you have a detached session on and programs will keep running.

![](assets/terminal-screen-logged-out.svg)


Logging back in
---------------

* Then log back in (from anywhere!) and **screen -r** to re-attach.


![](assets/terminal-screen-detached.svg)

Logging back in
---------------

* Then log back in (from anywhere!) and **screen -r** to re-attach.


![](assets/terminal-screen-2.svg)

**NOTE:** make sure you log into the same login node that you started screen on


Other screen commands
---------------------

* **screen -d** - forces detach of a screen that's running (so you can screen -r it).  Handy if your SSH connection drops.

* **screen -ax** - forces attach to a screen that's attached to from somewhere else.

* You can configure screen in lots of useful ways, including changing the keyboard shortcuts.

* For more see man pages, or online documentation: [(http://www.gnu.org/software/screen/)](http://www.gnu.org/software/screen/)


More useful shell commands
==========================

Formatted sequences based on numbers
------------------------------------

```
[user@host ~]$ seq 1 5
1
2
3
4 
5
```

* **seq** - generates sequences based on numbers

Formatted sequences based on numbers
------------------------------------

```
[user@host ~]$ seq 1 2 9
1
3
5
7
9
```

* **seq** - generates sequences based on numbers

Formatted sequences based on numbers
------------------------------------

```
[user@host ~]$ seq -f %03g 1 2 9
001
003
005
007
009
```

* **g** - the number of significant digits is 3 
* **0** - in front of 3 indicates that the number is padded with zeros if smaller than 100.
* **%** - start the format definition for the number (place the number)

Links
-----

* Created with "ln"

* Two types:
    + "Hard" - indistinguishable from files
    + "Soft" (or "Symbolic") - like a shortcut

Hard links
----------

* Inode table keeps track of hard links

* Deleting a file = "unlinking" it

* Can only be used inside a single file system

Soft links
----------

* Shortcut, e.g.

```
[cuser@host ~]$ ln -s ~/some_project/2012/part531 ~/current_project
[cuser@host ~]$ ls -l ~ 
lrwxr-xr-x  1 user  staff  11 10 Oct 17:56
               current_project -> /home/user/some_project_2012/part531
```

* Can use relative or absolute paths!

* Create using absolute paths to make sure they go where you want


Archiving and compression
-------------------------

```
[user@host shell-training]$ tar -czvf work.tgz work
work/
work/program/
work/calculations/
work/calculations/control.in
work/workfile
```

* **tar -zcvf** - archives and compresses directory trees and files 
    + **c** - create archive 
    + **z** - compress
    + **v** - verbose
    + **f** - in the following file

Extracting files from a compressed archive
------------------------------------------

```
[user@host shell-training]$ tar -xzvf work.tgz 
work/
work/program/
work/calculations/
work/calculations/control.in
work/workfile
```

* **tar -z*x*vf** - extracts and uncompresses directory trees and files 
    + **x** - extract archive 
    + **z** - uncompress
    + **v** - verbose
    + **f** - from the following file

Generating scripts with scripts
-------------------------------

```
cat <<EOF > child_script.sh 
#!/bin/bash 
echo The child script says Hi! 
EOF 
```

* **\<\<EOF** - concatenates the text until the string "EOF", redirecting it to cat
* **\> child_script.sh** - redirects the output of cat to child_script.sh.
* It may be tempting to indent things - DON'T!

Exercise:
--------

* write a parent_script.sh that creates and executes 
the child_script.sh

* write a parent_script.sh that creates and executes 
10 different child_script.sh that print out their individual number


Transferring files across a network
-----------------------------------

From Aristotle:

```
[user@host ~]$ scp work.tgz user@socrates.ucl.ac.uk:
...
Password:
work.tgz         100%  340     0.3KB/s   00:00

```

* remember to put the colon at the end

Transferring files across a network
-----------------------------------

To Aristotle:

```
[user@host ~]$ scp user@socrates.ucl.ac.uk:~/work.tgz .
...
Password:
work.tgz         100%  340     0.3KB/s   00:00
```

* . means copy to this directory

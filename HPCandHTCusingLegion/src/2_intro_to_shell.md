% HPC and HTC using Legion
% Research Computing and Facilitating Services

Introduction to the UNIX shell
==============================

Overview
--------

* Basic interaction with files and directories

    + command line execution

    + Unix directory and file basics

    + file properties

* File manipulation

    + inspecting and editing files

    + searching and filtering

    + archiving and transfer over network

* Scripting and workflows

    + scripting techniques for building workflows


Access to Legion
----------------

* Apply for an account: http://www.ucl.ac.uk/isd/staff/research_services/research-computing/account

* Access is provided through the 4 login nodes connected to the external network:
```
legion.rc.ucl.ac.uk
```

* To access one of the login nodes (remotely) from a Unix machine:
``` 
ssh username@legion.rc.ucl.ac.uk
```

* Log on using UCL username/password

* On Windows (e.g. Desktop@UCL) you can use PuTTY.

Access to Legion
----------------

![](assets/puttylocation.png)

Access to Legion
----------------

![](assets/puttyconfig.png)



Basic interaction with files and directories
============================================

Command Prompt
--------------

```
[ccaaxxx@login06 ~]$
```

* Has the form **[&lt;username&gt;@&lt;host name&gt; &lt;present directory&gt;]$**

* **&lt;user name&gt;** is the Unix user name (UCL user ID).

* **&lt;host name&gt;** is the name of the computer that you are accessing.

* **&lt;present directory&gt;** is the directory that the user is currently in.

* Commands are typed after the prompt and executed by pressing return.

Command Line Execution
----------------------

```
[ccaaxxx@login06 ~]$ ls
Scratch
[ccaaxxx@login06 ~]$
```

* **ls** lists the contents of the directory
* **~** is the "home directory"

Unix Directory Basics
---------------------

```
[ccaaxxx@login06 ~]$ file ~
/home/ccaaxx: directory
[ccaaxxx@login06 ~]$
```
* **file** identifies the file type
* **~** = /home/ccaaxxx - your *home directory*

Unix Directory Basics
---------------------

```
/home/ccaaxxx: directory

/home: directory

/: directory
```

* **/home/ccaaxxxx** - the *full path* to the home directory

Hidden files and directories
----------------------------

```
[ccaaxxx@login06 ~]$ ls -a
.  ..  .bash_history  .bash_logout
.bash_profile  .bashrc  .cshrc  .emacs
Scratch  .ssh
[ccaaxxx@login06 ~]$ 
```

* Files starting with "." are hidden

* **.** - Present working directory (in this case ~)
* **..** - Directory above (in this case /home)

Everything is a file
--------------------

```
[ccaaxxx@login02 ~]$ file .* *
.:             directory
..:            directory
.bash_history: ASCII text
.bash_logout:  ASCII English text
.bash_profile: ASCII English text
.bashrc:       Bourne-Again shell script text executable
.cshrc:        C shell script text executable
.emacs:        Lisp/Scheme program text (Emacs editor)
.ssh:          directory (for secure shell)
Scratch:       symbolic link to `/scratch/scratch/ccaaxxx'
```

* "*" - All visible files
* ".*" - All invisible files
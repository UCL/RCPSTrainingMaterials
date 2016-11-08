---
title: Legion Overview
slidelink: True
---

Legion Architecture
===================


Node Types
----------

* Login Nodes
* Transfer Node 
* Test Nodes 
* Compute Nodes 
* *(Infrastructure Nodes)*

Login Nodes
-----------

For:

* Access
* Programming
* File transfers (light)
* Testing (light)
* Visualisation (light)

Accessible via `ssh`, at `legion.rc.ucl.ac.uk`.


Transfer Node
-------------

At `login05.external.legion.ucl.ac.uk`.

Can transfer data around Legion up to 10x faster than normal login nodes.


Compute Nodes
-------------

* only accessible via the scheduler
* intended for all significant non-interactive work
* can also do limited interactive work
* can access external networks


Numbers and Types
-----------------

| Type | Cores | RAM | Network | Number | Total Cores |
|:----:|:-----:|:---:|:-------:|:------:|:-----------:|
| T | 32 | 1.5TB | Ethernet   | 6    | 192    |
| U | 16 | 64GB  | Infiniband | 160  | 2496   |
| V | 12 | 48GB  | Ethernet   | 8    | 96+GPU |
| X | 12 | 24GB  | Infiniband | 144  | 1728   |
| Y | 12 | 24GB  | Ethernet   | 108  | 1296   |
| Z | 12 | 48GB  | Ethernet   | 4    | 48     |


Topology
--------

![](../assets/cluster-topology.png)


Filesystem Access
-----------------

![](../assets/rw-where.png)





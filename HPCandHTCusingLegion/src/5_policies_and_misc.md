% HPC and HTC using Legion
% Research Computing and Facilitating Services

Policies
========

## Legion Scheduler

* Tries to give each user an equal share of the machine at any given moment
* Tries to fill gaps with small, short jobs
* Has a few special sets of nodes to run test (short, small) or interactive jobs


## "Production"

Anything that uses:

* a lot of CPU time
* a lot of RAM
* a lot of disk access 

**Production work should be run as a job.**


What Can Run
------------

We can provide (stable) application centrally, and compile up software to put in the `/shared/ucl/apps` space.

You're free to run almost anything that you can build on Legion, though.

Some departments also provide applications, *e.g.* Chemistry Department: `module load chemistry-modules`.

We reserve the right to ban the use of applications that prevent or harm other users' use of the cluster.


Limits
------

| Time | Cores | Queue Type |
|:-----|:-----:|:----------:|
| ≤ 15 mins  | ≤1 node      | Rapid Test Queue       |
| ≤ 12 hours | ≤ 1024 cores | Large Parallel Queue   |
| ≤ 1 day    | ≤ 512 cores  | Mid Parallel Queue     |
| ≤ 2 days   | ≤ 256 cores  | Smaller Parallel Queue |
| ≤ 3 days   | 1 core       | Serial Queue           |

*(Actually more complex than this, check the website.)*

## Extraordinary Resource Requests

* Grab the [form from the website](http://www.ucl.ac.uk/isd/staff/research_services/research-computing/services/legion-upgrade/resource_allocation/#requests)
* Send it to your Consortium Leader to approve
* Send it to us: [rc-support@ucl.ac.uk](mailto:rc-support@ucl.ac.uk)
* Wait for approval by the CRAG


Data Policies
-------------


Access
------

* Legion is not a long-term data repository
* Do not store the only copy of your data on Legion 


Security
--------

Legion is not suitable for Highly Restricted data and above.

|:--------------|:-----------|
| *Secret:*            | Identifiable patient information            |
|                     | Personal financial details                  |
|                     | Confidential investigations                 |
| *Highly Restricted:* | Student profiles                            |
|                     | Unpublished commercially sensitive material |
| *Restricted:*        | UCL main web page                           |
|                     | Unpublished research data                   |
| *Normal:*            | Email about fridge-cleaning meeting         |
|                     |                                             |

[(*See: UCL's data security policy*)](http://www.ucl.ac.uk/informationsecurity/policy/internal-policy/Guidelines10)

Security
--------

Responsibility for the accuracy of the results of software installed or available on Legion is the sole responsibility of researchers.

So:

* Test your software
* Check your results


Security
--------

* `ssh` is the only recommended method to connect to/from Legion
* UCL is not responsible for security of non-UCL machines
* Ensure your machines are reasonably secure

Quotas
------

* Home directories have a 50 GB quota
* Scratch has a 200 GB quota
    + However you can use as much as you want for up to two weeks
    + After two weeks job submission is disabled until you decrease usage to below quota
* If you need more, apply to the CRAG


Support Queries
===============

A Good Ticket
-------------

Tell us:

 * What you're trying to do (technical)
 * Exact error output
 * Job IDs, scripts, and relevant file paths
 * Whether we can look at your files

Keeping Tickets Sane
--------------------

`Subject: Error When Compiling My_App v0.45 [RC00004925]`

Keeping one ticket ID per problem helps us immensely.


Other Compute Resources
===============

UCL Funded
----------

* Iridis (for large parallel jobs)
* Emerald (for GPU jobs)

Other
-----

* Magellan
* ARCHER
* DIRAC collection
* PRACE
* US National Labs
* EGI
* (Cloud Providers)


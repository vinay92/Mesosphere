<h1>Report on Mesosphere DCOS</h1>

<h3>What is Mesosphere?</h3>
* Mesosphere is an implementation of the platform as a service paradigm. It is a data center operating system, used to manage the entire data center as if it is a single computer.
* It provides a highly elastic, and highly scalable way of deploying applications, services and big data infrastructure on shared resources. 
* It takes care of deploying different applications on different nodes in our data center cluster.The DCOS can be used to launch thousands of containers in seconds, or deploy complex systems like Hadoop with a single command.
* Mesosphere enables a way to easily scale applications by abstracting away many of the challenges associated with scaling.

<h3>Mesosphere architecture</h3>
* Marathon<br/>
The Marathon framework works as an 'init system' for Mesosphere. It starts all the applications and monitors them, while healing any failures it comes across. It has two important advantages from DevOps point of view:
  * Rolling restart: While restarting a service, it is ensured that it is running on at least a few nodes at any instance of time. Dynamic reconfiguration of load balancer is done to handle tasks being run on the nodes which are going to be restarted
  * Rolling upgrade: Done in the similar manner as rolling requests. Health-check is also done by Marathon, the thresholds for various metrics can be specified initially
* Mesos<br/>
Mesos is the distributed systems kernel at the core. It manages the hardware resources such as CPU utilization etc, and provides this information to the frameworks.
* Service discovery<br/>
Multiple applications can be run using Mesosphere and the apps need a way to communicate with each other. Mesos-DNS can be used for service discovery throught the domain name system.
* Zookeeper<br/>


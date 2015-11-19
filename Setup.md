<h1>Deploying a Mesosphere DCOS cluster and deploying a sample application on the cluster </h1>

This file is meant to be a step by step guide to deploy a mesosphere cluster on AWS and deploy a sample web application on the cluster. These instructions have been retrieved from [the original mesosphere docs] (https://docs.mesosphere.com/install/awscluster/) and are meant mainly to aggregate the basic steps needed to deploy the cluster  and application end to end.

<h3>Initializing and deploying the AWS mesosphere cluster </h3>
Mesosphere offers high level of integration with AWS with templates created for cloudformation. A few clicks is all that is needed to deploy a cluster on AWS:

1. Sign up with AWS in order to have an account for provisioning EC2 instances. 
2. Follow the instruction in [this] (https://mesosphere.com/amazon/) link. After creating the key pair, click on the template link provided which takes you to the cloudformation link in the AWS console. Be sure to select the key which you just created in the UI for authentication. 
3. After selecting all the required options, select create stack. The AWS stack takes about 10-15 minutes to be deployed. 

<h3>Installing the DCOS CLI </h3>
1. In order to deploy applications on the mesosphere cluster you just created, mesosphere offers both a CLI and a web interface. We will be mainly looking at the CLI since setting up jobs via scripts is easier in this case. 
2. Follow the instruction in the [link] (https://docs.mesosphere.com/install/cli/) to install the CLI. 
Note: While installing the DCOS CLI, make sure the full path of the installation directory doesn't have any spaces in it as this is a constraint for the CLI. 

<h3>Deploying a sample web application to mesosphere cluster </h3>
1. Clone this repository and copy the scripts in the src directory into your dcos directory created in the previous steps. 
2. Make sure the DCOS CLI is pointed to the right Mesosphere cluster.(If you have installed the CLI correctly this is already done).
3. In the src directory the nginx.json file takes a docker image from the Mesosphere dockerhub. This image deploys an nginx server on the public slave node of the Mesosphere cluster and displays a message on the web page. 
4. In order to deploy this app on the public slave node, execute the following command:

   ``` dcos marathon app add nginx.json ```

5. Wait for 1-2 minutes for the app to deploy. You should be able to view it on the UI accessible through the Public DNS of the master which you can view in the output tab of the stack in your cloudformation stack page on the AWS console. 
6. Now navigate to the public DNS of the public slave node and you should be able to see a web page like this:
7. Congrats!! you have successfully deployed a simple nginx web app to your mesosphere cluster. 

<h3>Stopping a deployed application</h3>
If at any time you want to stop a marathon app, execute the following command:

``` dcos marathon app remove <id-of-the-app>```

The id of the app is the name in the json. It can also be viewed through the web UI of the master. 

<h3>Deploying a cassandra instance and installing an app on it in the cluster<h3>
The next set of instructions are meant to demonstrate how to deploy an instance of cassandra runnning on the private nodes in the cluster and how to deploy a sample web application that stores its information in cassandra database.

1. Cassandra is provided as a package to be installed in the mesosphere universe which is the default repository of libraries and packages for mesosphere. Hence in order to start a cassandra instance execute the following command:

   ``` dcos package install cassandra```

2. This installs Cassandra on the private nodes on the cluster. This takes about 10 minutes. For more information about how to configure cassandra with more granularity, refer to [this](https://docs.mesosphere.com/services/cassandra/) link.
3. Next install the oinker application provided by mesosphere. This is a simple application that takes input from the user and prints on the web page. 
4. Although this app is deployed on the private nodes, there is an edge router in the oinker application which sends the requests to and from the public slave node to the application. 
5. To deploy the oinker application, navigate to the src folder and execute the DeployOinker.sh file which downloads the oinker application and the router application and also deploys these applications to the cluster. Execute the script using the following command:

   ``` sh DeployOinker.sh```

6. Once the application is deployed in the cluster, open the public slave node address in the browser and you can see the application is live and running. 
7. This application can also be scaled up depending upon the requirements. For example, use the following command to scale up the application to 8 instances:

   ``` dcos marathon app update /<id-of-the-app> instances=8```
   
8. Now we can see that the number of tasks and the CPU usage etc. for each node which can viewed in the UI on the master, also increase. Hence we can scale up and scale down instances as and when needed. 

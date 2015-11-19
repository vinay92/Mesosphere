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

<h3>Deploying a sample web application to mesosphere cluster</h3>
1. Clone this repository and copy the scripts in the src directory into your dcos directory created in the previous steps. 
2. Make sure the DCOS CLI is pointed to the right Mesosphere cluster.(If you have installed the CLI correctly this is already done.)
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

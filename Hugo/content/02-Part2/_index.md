+++
title = "Part 2"
date = 2026-01-14T11:59:02-05:00
weight = 20
chapter = true
pre = "<b>2. </b>"
+++

# Chapter 1

##  Leveraging the AI Capabilities in your Database

In the first section of this workshop, we created infrastructure that will allow us to take streaming data into our database. We also pre-loaded our database with some sample data that we can use to train AI models, directly inside of our Autonomous Database.

In this section we are going leverage the power of Oracle's Autonomous AI Database to train models that will determine if a reading indicates a fault in the temperature system in real time as the data is being sent in.


## Activities in this section

### Training AI models
In this section, we will use the built-in functionality of Oracle's Autonomous Database to:
* Train multiple AI models
* Evaluate the models for fit
* Deploy the AI model
* Test the AI model against some sample code.

### OCI Functions
We will build two functions, the first will be used to insert data into the Autonomous Database and the second will be integrated with our streams to call the AI model hosted in our database to enrich the streaming data with the result of rather the vaule indicates a fault or not. 

### Simulation
We will leverage the test client to automatically stream data into the database, and observe the AI functionality in action.



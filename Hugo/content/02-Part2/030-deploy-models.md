+++
date = '2026-01-14T13:37:43-05:00'
draft = false
title = 'Deploy Models'
weight = 300
+++

In the previouse section of the workshop we built and trained several models to predict faults based on the sample data. In this section we will deploy the models so that external processes, such as Oracle Functions will be able to call the model to classify data. 

## Choosing a model
The model trainign displays the results of training and testing based on the data.

![Training Results](/images/02/model-leaderboard.png)

Based on the training resyults you will want to pick a model that indicates the lowest possible error rate. In this training run the modesl that performed the best were **Neural Network** and **Support Vector Machine (Gaussian)** Your results may vary. 

## Deploy your model
In order to deploy your model, select the model that you want to leverage and then click the Deploy option at the top of the results list. 

In order to deploy your model you will need to provide, at a minimum, a portion of a URI and a model deployment version. For this deployment use the values:
* URI **myModel**
* Version 1

![Model Deployment](/images/02/deploy-model.png)

This deployment will take a few moments and then you will have a deployed AI model in your database!

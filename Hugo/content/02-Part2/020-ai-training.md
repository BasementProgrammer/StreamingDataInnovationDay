+++
date = '2026-01-14T13:37:43-05:00'
draft = false
title = 'AI Model Training'
weight = 200
+++

In this section we are going to use the built-in functionality for Oracle Autonomous AI Database to build and train a model that will determine if a temperature vaule represents a failure state or not.

## AI Training
In the development section of the **All Database Actions** section, you can open **Oracle Machine Learning (OML)** and log in with your AI User. This will give you aceess to all of the OML tools.
 
{{% notice note %}}
You can not use the built-in ADMIN user for OML. You should have users created specifically for OML use. 
{{% /notice %}}

{{<hint>}}
**OML** is avaialble from the **All Database Actions** drop down in the **Oracle Autonomous AI Database** drop down by selecting the **Development** heading. Machine Learning is one of the tables along the left hand side.
![Launching OML](/images/02/oml-launch.png) 
{{</hint>}}

{{<answer>}}
* From the OCI Console, open the hamburger menu.
* Select **Oracle AI Database** from the menu
* Select **Autonomous AI Database**
* From the list of databases click on **Innovation Day ATPDB** to open your database.
* Click the **Database Actions** drop down
* Click on **View all database actions**
* Along the top of the **Oracle Database Actions Launchpad** select the **Development** option
* Along the left hand side, select the **Machine Learning** option
* Log into the Oracle Machine Learning application with your AIUser that was created earlier
{{</answer>}}

Inside of the Oracle Machine Learning application click on the **AutoML** application to start training models on your data.

Oracle AutoML works on the idea of running experiments. These experiments can be used to test various ML models on your data in order to determine which model works best in your situation. By using Oracle AutoML you can train models without having to have extensive AI/ML skills. 

Create a new Experiment in the AutoML application. In your experiment, provide a name and a description. The experiment will use the database table ADMIN.SENSOR_DATA to predict the value of the FAULT column. For the experiment we want to select **Regression** and leave the **Case Id** blank. After saving your experiment, select the option to run, with the **Faster Results** option.

{{<hint>}}
Configure your experiment like this:
![Configure Experiment](/images/02/oml-training-3.png) 
{{</hint>}}



{{<answer>}}
* From the AutoML Experiments window click the option to create a new experiment.
![Create Experiment](/images/02/oml-training-1.png) 
* Give your AutoML experiment a name and a description.
![Name and Description](/images/02/oml-training-2.png) 
* Click the magnifying glass next to data source to browse the avaialable tables in your database.
* Select the ADMIN schema and the table SENSOR_DATA. (These names could be different if you used a different table name on import.)
![Configure Experiment](/images/02/oml-training-3.png) 
* For **Predict** select the column **FAULT**
* For **Prediction Type** select the option **Regression**
* Save your experiment definition
![Save Experiment](/images/02/oml-training-4.png) 
* Click the option to **Start** training and choose the option for **Faster Results**
![Start Training](/images/02/oml-training-5.png) 
* Once the training has been completed, you will see the results below.
{{</answer>}}

Once completed you will see the results from your model training:

![Training Results](/images/02/oml-training-6.png) 

{{% notice note %}}
If the training run fails, then wait a minute or two and then try rerunning the experiment again. 
{{% /notice %}}

Once your model training has run through completely, you can rerun the training job using the **Better Accuracy** option. This will take longer to complete than the first run. Once you have completed the second run we can move to deploy your models in the next section.

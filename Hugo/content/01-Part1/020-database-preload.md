+++
date = '2026-01-14T15:31:56-05:00'
draft = false
title = 'Database Preload'
weight = 200
+++

Your account has been pre-configured with a new Oracle Autonomous AI Database. That database does not currently have any data or tables in it. In this section we will use Oracle's Autonomous AI Database's built in tools to create a table in the database, and pre-load that database with a set of sdample data. This sample data will enable us to laverage the AI capeabilities of Oracle Autonomous AI database in later sessions. The sample data in the table is designed to reflect streaming data from multiple sensor data.

## Sample Data Model
|Field          | Format                | Description  |
|---------------|-----------------------|--------------|
|Timestamp	    | yyyy-mm-ddThh:mm:ss	|Timestamp the reading was taken |
|DeviceID       | n	                    |Numerical id for the temperature sensor. (1-5) |
|TemperatureC   | (-)nn                 |Temperature reading in degrees celcius of the device |
|Fault          | 0|1                   | An indication as to rather the device is in a fault state or not.|

For this example readings between 3 degrees cencius and 5 degrees celcius are considered normal, and readings outside of that range are considered faults. 

{{% notice note %}}
This is an overly simple use case, and would not normally be a good candidate for AI because the assessment of rather a device is in a faulted state could be easil;y handled by a simple IF statement. However this use case allows us to quickly explore the capeabilities of the Built in AI functionality in Oracle's Autonomous AI database. 
{{% /notice %}}

## Download Seed data
Download the sample_sensor_data.csv file below and save this to your local computer. You will need this to set up the database tables and prepopulate the database with some sample data.

{{%attachments style="grey" /%}}

## Database Setup

In the Oracle Autonomous AI Database section of the console, you can open your database and use the Data Load tool to import the sample data. The data load will automatically create a table for the data, set up columns and load the records. 
{{% notice note %}}
If you do not see a pre-created database then make sure that the **OCI-Innovation-Day** compartment is selected.
{{% /notice %}}

{{<hint>}}
Oracle Audtonomous AI Database has a data load function on the Database Actions menu after you open the Autonomous Database in the console. That tools can be used to import data directly into the database, including setting up columns.
{{</hint>}}

{{<answer>}}
* From the OCI console, open the hamburger menu.
* Select **Oracle AI Database** from the menu
* Select **Autonomous AI Database**
* You sould have one database pre-created in your account.
![Open Database](/images/01/open-database.png)
* Click on the database name to open the database.
![Data Load](/images/01/data-load-1.png)
* Click the **Load Data** tile.
![Data Load](/images/01/data-load-2.png)
* Drag and drop the sample data file to the data load window.
![Data Load](/images/01/data-load-3.gif)
* Once the load process has been completed, click the start button to complete the data load.
{{</answer>}}

Once you have loaded the test data into the database, we will use the built in SQL Tools to explore the data and validate that the data has been loaded as expected. In the Autonomous AI Database screen, select the Database Actions and then SQL option to launch the SQL Explorer for the database. 

In the SQL Explorer, paste the following command and press the Play botton:

```SQL
SELECT * FROM SENSOR_DATA
```

You should see a results tab that looks like this:
![Data Load](/images/01/data-load-4.png)
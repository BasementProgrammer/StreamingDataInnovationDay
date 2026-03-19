+++
date = '2026-01-14T13:37:43-05:00'
draft = false
title = 'Database User Setup'
weight = 100
+++

In order to leverage the AI capeabilities in Oracle Autonomous Database you will need to create an AI user. You should not try and use AI capabilities as the Admin.

## Create User
In the Autonomous Database section of the console, use the Database User Application to create a new user. Name the user **AIUser** and assign them the **OML** user permissions. Set the user Quota to unlimited. You will need to create a strong password for the user, and record this password for later.

{{<hint>}}
The database user application can be found by opening up the Oracle Autonomous AI Databse in the console, then selecting the drop down menu for **Database Actions** and then clicking on **Database Users.** When adding the user make sure to select the **OML** option to give the user permissions to access to the Oracle Machine Leanrning functionality. Also make sure to assign the user a database quota, for these purposes we will use **Unlimited** for the option. 
{{</hint>}}

{{<answer>}}
* From the OCI Console, open the hamburger menu.
* Select **Oracle AI Database** from the menu
* Select **Autonomous AI Database**
* From the list of databases click on **Innovation Day ATPDB** to open your database.
* Click the **Database Actions** drop down
* Click on **Database Users**
* Click **Create User** on the right side of the screen
* Fill in the form with the following details:
    * Username: **AIUser**
    * Password: **fsmRyCDvd2JQsvV**
    * Confirm Password **fsmRyCDvd2JQsvV**
    * Enable the **OML** option
* Click **Create User** 
![Create User](/images/02/create-user.png)
{{</answer>}}

## Assign user permissions
The new user needs to have permissions to access the tables in order to perform the AI Training. Using the SQL Application built into the Oracle Autonomous AI Database to run the following command:

```SQL
GRANT ALL ON SENSOR_DATA TO AIUser;
```
{{<hint>}}
The built in SQL tool can be found by opening the databsase in the console and selecting **SQL** from the **Database Actions** drop down. This tool will allow you to run SQL command against the database. If you have used a different name for your AI User, or your table you will have to adjust the command as required.
{{</hint>}}

{{<answer>}}
* From the OCI Console, open the hamburger menu.
* Select **Oracle AI Database** from the menu
* Select **Autonomous AI Database**
* From the list of databases click on **Innovation Day ATPDB** to open your database.
* Click the **Database Actions** drop down
* Click on **SQL**
* Type the command above into the query window
* Click the Play button to run the command.
![Grant Rights](/images/02/grant-rights.png)
{{</answer>}}

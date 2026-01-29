+++
date = '2026-01-14T13:37:43-05:00'
draft = false
title = 'Streams'
+++

**Important** All of the resources for this workshop have bbeen created in a compartment cealled **OCI-Innovation-Day**. The OCI Console will often filter resources by the compartment. If the resources mentioned are not initially visible make sure the compartment is set correctly. The compartment sdelector can usually be found on the left hand side as seen here:
![overview](/images/01/compartment.png)

## Connecting the streams
Your account has been preconfigured with two OCI streams. These streams provide durable storage for streaming data waiting to be handled by other services. The first thing that we will do is use the OCI Connector service to connect the two streams. Connecting the two streams will provide us with a point for furure expansion when we leverage the AI capeabilities of Oracle Autonomous Database to automatically determine if records represent anomolous data or not.




![overview](/images/01/connecting-streams.gif)

In the OCI console, create a new connector that will automatically take data from the Incoming stream and push it through to the database stream. This is done with a managed connection service called Connector Hub. Name the connector "Stream Connector" select the Incoming stream as the source and the Database Stream as the desttination. Use the "Trim Horizon" stream possition to ensure you are reading the oldest data first.

{{<hint>}}
Connector hub can be found in the OCI console under Analytics & AI, in the messaging section. Create a new connection and link the two streams using the incoming stream as the source and the database stream as the destination.
{{</hint>}}

{{<answer>}}
* From the OCI console, open the hamburger menu.
* Select **Analytics and AI** from the menu
* Select **Connector hub** from the menu in the **Messaging** section
* Click **Create connector** to create a new connector
* For **Connector name** type *"Stream Connector"*
* For **Description** type *"Connect the two streams together"*
* For **Resource Compartment** select *"OCI-Innovation-Day"*
* For **Source** and **Target** select Streaming
* When configuring the source, select the **compartment** "OCI-Innovation-Day", the **Stream Pool** "Incoming Stream-pool", the **Stream** "Incoming Stream", and the **Read Possition** "Trim Horizon"
* Leave the Task section blank.
* When configuring the destination, select the **compartment** "OCI-Innovation-Day", the **Stream** "Database Stream"
* For each of the two streams click the option to create the default policy.
![create policies](/images/01/create.png)
![create policies](/images/01/created.png)
* Click **Create** at the bottom.
{{</answer>}}

Once you are done with this section you will have a connector that retrieves data from the incoming stream and automatically pushes it to the database stream.

![create policies](/images/01/completed.png)

Once you have completed this, feel free to move on to the next section.
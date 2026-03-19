+++
date = '2026-01-14T15:31:56-05:00'
draft = false
title = 'Security Setup'
weight = 300
+++

Your account has come with a pre-configured test client that we will use later. In order for this to be used we need to set up Resource Principal Authentication for this client to be able to work correctly. Resource Principal Authentication allows resources, in this case the Container Instance to be able to access OCI resources without having to supply user names and passwords.

## Dynamic Group Setup

The first step in setting up Resource Principal Authentication for this solution is to create a Dynamic Group in your Domain for the Container Instance that resides in your compartment. Name the Dynamic Group **Container-Instance-Dynamic-Group**.

{{% notice note %}}
For best results and ease of cleanup, your account has a specific Domain set up for this Innovation Day. The domain set up for the Innovation Day is called **InnovationDayDomain** and resides in the **InnovationsDays-Compartment** compartment in your account. 
{{% /notice %}}

{{<hint>}}
Dynamic Groups for Container Instances use a matching rule **resource.type='computecontainerinstance'**. You should limit the Dynamic Group to the container that your resources are deployed into. That Compartment ID was recorded earlier.
{{</hint>}}

{{<answer>}}
* From the OCI Console, open the hamburger menu.
* Select **Identity and Security** from the menu
* Select **Domains**
* If you do not see **InnovationDayDomain** in the list, make sure you have the **InnovationDays-Compartment** selected.
![Locate Compartment](/images/01/compartment-1.png)
* Click on **InnovationDayDomain**
![Open Compartment](/images/01/compartment-2.png)
* Click on **Dynamic Groups**
![Dynamic Group List](/images/01/dynamicgroup-1.png)
* Create a new Dynamic Group
    * Name: Container-Instance-Dynamic-Group
    * Description: "Dynamic Group for the Container Instance in the Innovation Day"
* Create a Matching rule, replacing {{OCID}} with the compartment_id that you recorded earlier.
```
ALL {resource.type='computecontainerinstance', resource.compartment.id = '{{OCID}}'}
```
* Click Create
![Create Dynamic Group](/images/01/dynamicgroup-2.png)
{{</answer>}}

## Policy setup
The Dynamic Group allows you to enable Resource Principal Authentication on your Container Instance. We now need to create policies that will allow yor Dynamic Group to exert rights within your account.

Once again you should deploy your policies in the "Innovation Day" Container to make cleanup easier.

Crete a new policy allowing your Dynamic Group to push messages to streams deployed in your compartment.

{{<hint>}}
The policy statement that you need to add is:
```
Allow dynamic-group 'InnovationDayDomain'/'Container-Instance-Dynamic-Group' to use stream-push in compartment InnovationDays-Compartment
```
{{</hint>}}

{{<answer>}}
* From the OCI Console, open the hamburger menu.
* Select **Identity and Security** from the menu
* Select **Policies**
* Click **Create Policy**
* Create a new policy with the following details:
    * Name: Container-Instance-Policy
    * Description: Allow container instance to push messages to streams
    * Compartment: InnovationDays-Compartment
* Click the option to **Show manual editor**
* Paste the following policy statement into the editor
```
Allow dynamic-group 'InnovationDayDomain'/'Container-Instance-Dynamic-Group' to use stream-push in compartment InnovationDays-Compartment
```
![Create IAM Policy](/images/01/create-policy.png)
* Click **Create**
{{</answer>}}
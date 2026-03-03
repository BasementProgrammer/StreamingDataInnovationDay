+++
date = '2026-01-14T15:31:56-05:00'
draft = false
title = 'Security Setup'
weight = 300
+++

Your account has come with a pre-configured test client that we will use later. In order for this to be used we need to set up Resource Principal Authentication for this client to be able to work correctly. Resource Principal Authentication allows resources, in this case the Container Instance to be able to access OCI resources without having to supply user names and passwords.

## Dynamic Group Setup

The first stepp in setting up resource principal authentication for this solution is to creat a dynamic group in your domain for the container instance that resides in your compartment. Name the Dynamic Group **Container-Instance-Dynamic-Group**

{{% notice note %}}
For best results, and ease of clean up your account has a specific Dopmain set up for this innovation day. The domain set up fpr the Innovation Day is called **InnovationDayDomain** and resiles in the **InnocationsDays-Compartment** compartment in your account. 
{{% /notice %}}

{{<hint>}}
Dynamic groups for container instances use a matching rule **resource.type='computecontainerinstance'** You should limit the Dynamic Group to the container that your resources are deployed into. That Compartment ID was recorded earlier.
{{</hint>}}

{{<answer>}}
* From the OCI console, open the hamburger menu.
* Select **Identity and Security** from the menu
* Select **Domains**
* If you do not see **InnovationDayDomain** in the list, make sure you have the **InnovationDays-Compartment** selected.
![Locate Compartment](/images/01/compartment-1.png)
* Click on **InnovationDayDOmain**
![Open Compartment](/images/01/compartment-2.png)
* Click on **Dynamic Groups**
![Dynamic Group List](/images/01/dynamicgroup-1.png)
* Create a new Dynamic Group
    * Name: Container-Instance-Dynamic-Group
    * "Dynamic group for the container instance in the Innovation Day"
* Create a Matching rule, replacing {{OCID}} with the compartment_id that you recorded earlier.
```
ALL {resource.type='computecontainerinstance', resource.compartment.id = '{{OCID}}'}
```
* Click Create
![Create Dynamic Group](/images/01/dynamicgroup-2.png)
{{</answer>}}

## Policy setup
The Dynamic group allows you to enable resource principal authentication on your container instance. We now need to create policies that will allow yor Dynamic Group to exert rights within your account.

Once again you should deploy your policies in the Imnnocation Day container to make cleanup easier.

Crete a new policy allowing your dynamic group to push essages to streams deployed in your compartment.

{{<hint>}}
The policy statement that you need to add is:
```
Allow dynamic-group 'InnovationDayDomain'/'Container-Instance-Dynamic-Group' to use stream-push in compartment InnovationDays-Compartment
```
{{</hint>}}

{{<answer>}}
* From the OCI console, open the hamburger menu.
* Select **Identity and Security** from the menu
* Select **Policies**
* Click **Create Policy**
* Create a new policy with the following details:
    * Name: Container-Instance-Policy
    * Description: Allow container instance to push messages to streams
    * Compartment: InnovatioDays-Compartment
* Click the option to **Show manual editor**
* Paste the following policy statement into the editor
```
Allow dynamic-group 'InnovationDayDomain'/'Container-Instance-Dynamic-Group' to use stream-push in compartment InnovationDays-Compartment
```
![Create IAM Policy](/images/01/create-policy.png)
* Click **Create**
{{</answer>}}
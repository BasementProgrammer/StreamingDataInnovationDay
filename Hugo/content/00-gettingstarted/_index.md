+++
title = "Getting Started"
date = 2026-01-06T15:14:37-05:00
weight = 1
chapter = true
pre = "<b>0. </b>"
+++

# Getting started

## Conventions

Throught this session you will encounter activities. The main body of the materials will guide you through what needs to be accomplished in each section. We have left the instructions open ended so that you can learn about OCI as you go. If you get stuck allong th way there will be green hint sections and organge Walkthrough sections. The hint sections will give you directional pointers to help you along your way. If you get stuck the walkthrough sections will provide step by step instructions.

{{<hint>}}
Hint content will give you directional support if needed...
{{</hint>}}

If you get stuck and need more support you can expand the Guided walkthrough sections to get step by step instructions.

{{<answer>}}
Walkthrough content will give you guided instructions.
{{</answer>}}


## Initial Setup

In order to progress through this Innovation Day, you will need to run a script that pre-creates infrastructure in your account. This may or may not have been done for you. If it has not been done you can find the setup script here: 

{{%attachments style="grey" /%}}

You should download the file and apply this via Resource manager.

{{<hint>}}
Resource manager can be found in the OCI console under Developer Services. The ZIP file you downloaded can be used in resourvce manager to create a stack.
{{</hint>}}


{{<answer>}}
* From the OCI console, open the hamburger menu.
* Under Developer Services select Resource Manager
* Once inside of resource manager, select the Stacks option.
![overview](/images/00/launch-resource-manager.gif)
* Choose the option to create a new stack
* Select **zip** 
* Drag and drop the zip file containing the teraform into the upload area.
![drag and drop](/images/00/drag-zip.gif)
* Click **Next**
* Att he configure variables page accept all the defaults and select **Next**
* Click Create
* Once the stack has been created select the **Plan** option to allow Terraform to plan the stack.
![Plan](/images/00/stack-plan.png)
* Click **plan** from the slide out on the right to confirm the plan action.
![Plan](/images/00/stack-apply.png)
* Click Apply to apply the stack to your account.
{{</answer>}}

{{% notice note %}}
If your initial **Apply** fails, you may need to try the **plan** and **apply** again.
{{% /notice %}}

## Retrieve configuration Details

This initial setup will take a few minutes to complete. 

Once your stack has been created you will need to retrieve some configuration details for the steps to follow. Note down the following items for later use:
* Database Admin Password
* Compartment ID

From the Resource Manager page click on the Stack to open it.
![Open Stack](/images/00/password-1.png)

From the Resources menu, click the **View State** option.
![Open Stack](/images/00/password-2.png)

Find the values here:
![Open Stack](/images/00/password-3.png)

{{% notice note %}}
Every password is unique and randomly generated at the point of creation. No two passwords will be the same and your password will be different if you run this workshop multiple times.
{{% /notice %}}

Additionally you will need to note down your Tennancy OCID. You can find that tin the variables section of the stack.
![Open Stack](/images/00/tenancy-ocid.png)

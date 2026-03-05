+++
date = '2026-01-14T13:37:43-05:00'
draft = false
title = 'Testing You Models'
weight = 400
+++

## Initial testing
In the last section we deployed a model. In order to ensure that the model is working correctly we need to test the model for both functionality as well as accuracy.

## OCI Code Editor
OCI provides a Cloud Based IDE that will allow you to edit and test code. We will use this cloud editor to write code for this lab.

Launch the Code Editor from the OCI console:

![Launch Code Editor](/images/02/code-editor.png)

Once the code editor lauches, create a new Python file called model-test.py.

Copy the following code into your file:
``` python
import requests

# Replace these with your actual values
username = "{UserName}"     # The database user that was created in the last article.
                            # this user should have OML permissions
password = "{Password}"     # The password for the database user
omlserver = 'https://adb.us-ashburn-1.oraclecloud.com' 
                            # The OML endpoint for your region. This is for Ashburn.
tenant = "{Tennancy OCID}"  # Your tennancies unique OCID
database = "InnovationDay"
                            # Use the name, not the display name!
token = ""
endpointName = "myModel"     # This is the URL snippet that you used when publighint your endpoing.

testValue = 7

# Prepare the authentication URL by injecting values into the URI
url = f"{omlserver}/omlusers/tenants/{tenant}/databases/{database}/api/oauth2/v1/token"
# Set up necessary headers
headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
}
# Authenticate with a user name and password
data = {
    "grant_type": "password",
    "username": username,
    "password": password
}
# Request an access token
response = requests.post(url, headers=headers, json=data)
#get the token from the response
if response.status_code == 200: 
    token = response.json().get("accessToken")
else:
    print("Failed to retrieve access token")

# Set up the scoring URI
scoring_url = f"{omlserver}/omlmod/v1/deployment/{endpointName}/score"
# provide the autherntication token as a header
scoring_headers = {
    "Authorization": f"Bearer {token}",
    "Content-Type": "application/json"
}
# provide the requested data
scoring_data = {
    "inputRecords": [{"TEMPERATUREC": testValue}]
}
# call tthe model!
score_response = requests.post(scoring_url, headers=scoring_headers, json=scoring_data)
# Interprate the results
if score_response.status_code == 200:
    result = score_response.json()
    print(result)
else:
    print(f"Scoring failed with status code {score_response.status_code}")
    print(score_response.text)


```
You will need to update some of the variabls at the top of the file.
* {UserName} - Replace this with the name of the OML user you created earlier. **AIUSER** 
* {Password} - Replace this with the password that you used when you created the AI User above
* {Tennancy OCID} - Replace this with the OCID for your tenancy that was retrieved earlier.
* Database **InnovationDay** - This will be correct if you are using the Innovation Day Terraform. If your database name is different then you may bneed to update this.
* EndpointName **myModel** - If you used the suggested values when deploying the model, then this value will be correct. If you deployed the model with a different value for URI, then you will need to change this.

The code has a starting value of 7 for testing.
```python
testValue = 7
```
You can change this value in the code when running tests to validate different values are correctly reported.

```bash
python3 model-test.py 
```
You can test the code directly in the cloud code editor by opening a terminal andrunning the commmand line. 

![Manual Testing](/images/02/test-results.png)

By changing the value for **testValue** at the top, you can try different values. 
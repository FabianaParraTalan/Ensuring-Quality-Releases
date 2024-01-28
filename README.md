# Project Starter
This repository contains the starter code for the **Ensuring Quality Releases** project of the cd1807 Ensuring Quality Releases (Quality Assurance) course taught by Nathan Anderson. 


## How to use?
- Fork this repository to your Github account and clone it locally for further development. 
- Follow the classroom instructions, and check the rubric before a submission.

## Dependencies 

These are the following dependencies and softwares that the user must have in order to complete this project:

- Azure CLI
- Terraform
- JMeter
- Postman
- Python
- Selenium
- Chromedriver
- Chrome

## Instructions 
These are the step by step process followed to complete this project: 

1. Log in to your Azure account. This can be achieved through your preferred terminal, such as the Command Prompt (cmd). Utilize the following command to log in:

```
az login 
```

![image](https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/9f6eec9f-3e30-46d6-93d4-adc720120a0a)


2. Within this repository, we are utilizing Azure credentials provided by Udacity. Consequently, the Azure resource group "Azuredevops" is employed. Execute the Packer image for the virtual machine.

To begin, update the variables specified in the "packer-image.json" file. Replace the placeholder values with your actual information for:

- Subscription ID
- Tenant ID
- Client ID
- Client Secret
- Resource Group Name
- Image Name
- VM Size

```
    "subscription_id": "",
    "tenant_id": "",
    "client_id": "",
    "client_secret": "",   
    "resource_group_name": "",
    "image_name": "",
    "vm_size": ""
```

Once this is done, run the following command to create a packer image: 
```
packer build ./packer-image.json
```
![image](https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/cceea77a-02ca-4367-88a3-71549c63c949)


3. Next, configure the storage account and state backend. Initially, run the script named "create-tf-storage.sh" using the following command:

```
bash configure-tfstate-storage-account.sh
```
![image](https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/707e3aa5-4f7b-4eb8-b1ad-6ea7498b0541)


4. Then, replace the values in the "terraform/main.tf" file with the output obtained from running the "create-tf-storage.sh" script. Update the backend configuration in the "terraform.tfvars" file.

![imagen](https://github.com/Fabiana2903/ensuring-repo/assets/149669704/4a0cb48d-019d-4bf3-9f5c-4f33c04f476c)

Generate SSH keys in the Azure command shell using the commands:

```
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub

```
Place the generated keys in "terraform/modules/vm/vm.tf" under the "admin_ssh_key" section.

5. Run Terraform

Use the following commands: 

```
terraform init
terraform validate
terraform apply
```
Your results should look somewhat like this

![image](https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/aa4dc57a-619d-417a-bc52-8454e5e63724)


### Pipeline Development:

1. Create a new project.
2. Generate a Personal Access Token (PAT) and retain it for later use.
3. Establish a new service connection.
4. Create an agent pool with access to all pipelines and add this agent to a virtual machine.
5. Create an environment and assign it to a different virtual machine than the one used in the previous step.
6. Finally, create a new pipeline by selecting the GitHub repository, and for the YAML configuration, choose "azure-pipelines.yaml."

Update the Terraform variables with those created in the preceding steps.
```
variables:
  python.version: ''
  azureServiceConnectionId: ''
  projectRoot: $(System.DefaultWorkingDirectory)
  environmentName: ''
  tfstatenumber: '' 
  tfrg: ''
  application_type: ''  
```
![image](https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/c7400e1f-8e89-41c2-8121-e12ab76dbaef)

![image](https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/243e00a2-9bce-4956-b589-e32000764860)

![image](https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/b93941b7-c3b4-4579-856e-9726ff12bc43)


The pipeline consists of the following steps:

- Build the FakeRestAPI artifact by archiving the entire FakeRestAPI directory into a zip file.
- Deploy the FakeRestAPI to the Azure App Service created by Terraform.
![image](https://github.com/Fabiana2903/ensuring-repo/assets/149669704/dbeda946-f085-4e45-b30d-02ab000b46d9)

## Automated testing

### Automated testing includes:

- Integration testing using Postman with data validation and regression tests.
- Performance testing using JMeter with stress and endurance tests.
- Functional UI testing using Selenium.

#### Postman 
- Data Validation Test

![image](https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/ef83132c-1235-4697-9f30-f746cc99d1f6)


- Regression Test

![image](https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/58d9d523-0dbd-4e86-9252-4a1bbed98c71)


#### JMeter Performance Testing 
- Stress Test

![image](https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/bf10a94b-cd88-4504-8010-bc973cd46a66)


Report 

<img width="959" alt="test1" src="https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/99cfb376-94f2-40b6-b744-f73345837b5b">


![image](https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/6dd8f437-09ce-41ab-a16a-fb88c8e9f6d0)


- Endurance Test

![image](https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/c3c8c42e-9298-44bc-8d35-8cd76d2b3880)


Report 
<img width="960" alt="endurance test dashboard " src="https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/af0253e6-e4d9-497f-9eb9-c6e42b6206f5">

<img width="956" alt="endurance test dashboard 2" src="https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/c70afd81-8cae-42b9-bc88-79f29d9a4084">


#### Functional Testing with Selenium 

![image](https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/4cad48f7-a374-4a0c-a92a-e5dab1bbc368)



Example of the Pipeline execusion 

<img width="680" alt="image" src="https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/e4fa7493-6c53-40ae-b63f-03a7e157645a">

![image](https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/4e4aa379-b9b3-44b5-8352-cb6483448018)


### Monitoring and Observability
- Go to Azure Pipelines and go to the observability monitor, create a new alert. Execute the pipeline to trigger the alert.

#### Picture of the Monitor Chart 

<img width="619" alt="image" src="https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/c62cb442-09c9-4e3c-aba7-4d9373e2244c">


#### Picture of the email alert

<img width="251" alt="image" src="https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/e0edd114-9d43-45cd-8bf4-8a6e2ff06f21">


- Configure azure log analytics by downloading the selenium-test.log artifact from Azure Devops
- Navigate to the Azure Portal and access Azure Log Analytics workspaces.
- Configure an agent on the virtual machine in order to run the Slenium tests. Make sure the VM is connected tp capture the necessary logs. 
- Navigate to the Logs section and initiate the creation of a custom log.
- Specify the path of the selenium-test.log from the VM where the task was executed as the collection path for logs.

#### Custom Logs 
- Go to the logs section in the general group part of your logs analytics and select and run your custom log. 
<img width="677" alt="image" src="https://github.com/FabianaParraTalan/Ensuring-Quality-Releases/assets/156691609/95e314f8-aae1-4896-96ab-10f37271dc7a">


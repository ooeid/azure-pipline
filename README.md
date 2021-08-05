![image](https://www.continuous-data.nl/wp-content/uploads/2020/10/azure-pipelines_logo.png)


# Overview

This is the second project of Udacity Cloud DevOps Engineer for MS Azure Nanodegree Program.

This project builds a Continuous Integration pipeline leveraging  GitHub Actions and a Continuous Delivery pipeline using Azure Pipelines for a Python-based machine learning application.

<br />



## Project Plan

* A link to a Trello board for the project can be found [here](https://trello.com/b/Aenkg7gp/azure)
* A link to a spreadsheet that includes the original and final project plan can be found [here](https://docs.google.com/spreadsheets/d/1NtSdJTcgCgPcB-iph3PCa5BWLOcI32Tu/edit?usp=sharing&ouid=118313514463324119379&rtpof=true&sd=true)
* YouTube Project Video [here](https://www.youtube.com/watch?v=o36CsVL4s4M)

<br />


## Architectural Diagram 

![image](https://github.com/thepembeweb/building-a-ci-cd-pipeline/blob/main/screenshots/8-architecture-diagram.png?raw=true)



## Instructions

The CI/CD pipeline involves multiple accounts working in concert.  Some manual setup is required.

Prerequisites:
- [GitHub](https://github.com/) account
- [Azure](https://portal.azure.com/) account
- [Azure DevOps](https://dev.azure.com/) account


generating an SSH key and add it to your GitHub profile.

```
ssh-keygen -t rsa
```

![image](https://user-images.githubusercontent.com/57246653/127815190-f200d025-abc6-4c4f-8e71-a38617f601f0.png)

## Deploy the app in Azure Cloud Shell

In Azure Cloud Shell, clone the repo:
```
git clone git@github.com:bobfoster1299/building-a-cicd-pipeline2.git
```
Change into the new directory:

Create a virtual environment:
```
python3 -m venv ~/cicd
```

Activate the virtual environment:
```
source  ~/cicd/bin/activate
```

Install dependencies in the virtual environment and run tests:
```
make all
```
![image](https://user-images.githubusercontent.com/57246653/127815968-5bbecb16-8868-4432-a740-4940b120db1a.png)

running the test on hello.py: 

```
python3 -m pytest -vv test_hello.py
```

![image](https://user-images.githubusercontent.com/57246653/127817421-cd65e479-cd85-4aee-893d-77cca024ab5d.png)

Start the application in the local environment:
```
python app.py
```
![image](https://user-images.githubusercontent.com/57246653/127816543-ad8a1956-286c-4fb8-9736-9ecba836ed0e.png)

Open a second console and run `curl localhost:5000`.  The microservice should respond with some HTML.

![image](https://user-images.githubusercontent.com/57246653/127816616-359ee956-ad3c-4974-b4bd-c1ebd433b18f.png)

establish GetHub Actions: 

![image](https://user-images.githubusercontent.com/57246653/127817583-742d8ac2-8d63-42da-b333-b38f560942a4.png)

```
az webapp up --sku F1 -n udacity-flask-ml-service
```

![image](https://user-images.githubusercontent.com/57246653/127817390-0cb268a5-f52e-4e55-8456-dccb734468a0.png)


![image](https://user-images.githubusercontent.com/57246653/127817481-289c2da2-f76f-4b8f-9463-bc2232c2386b.png)


Open up [Azure DevOps](https://dev.azure.com/), create a new project and select set up  new service connection
    ![image](https://user-images.githubusercontent.com/57246653/127818344-105d6046-c0f7-4812-9012-9a4782f20d33.png)


Azure Pipeline : 

![image](https://dl3.pushbulletusercontent.com/XJ7U7WvMf2zBD2UilxBgwzYMr6mRiq9C/image.png)

check to make sure the microservice actually works:

![image](https://user-images.githubusercontent.com/57246653/127818743-1c8e052b-7499-4434-9a91-1fb5ff4e5d28.png)


## Load testing with Locust

#### Step 6: Load testing with Locust
* Install locust:
  ```
  pip install locust
  ```
* Ensure the app is running:
  ```
  python app.py
  ```
* Start locust:
  ```
  locust
  ```
* Open a browser and go to [http://localhost:8089](http://localhost:8089). Enter the total number of users to simulate, spawn rate, set the host to localhost:5000, and click Start Swarming: 



![image](https://dl3.pushbulletusercontent.com/ZC9nymeAOBcbdEdJg0fbLSIs2Q8QvIqN/image.png)
![image](https://dl3.pushbulletusercontent.com/7Mv6KKeZwarbxgNgzrg8q3YfySUuKjHE/image.png)




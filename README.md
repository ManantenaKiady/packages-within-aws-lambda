# Deploying python packages within AWS Lambda 

Deploying serverless applications requires us to constomize the runtime where our applications run. 
AWS Lambda provides us different ways of installing packages within its runtime:
- Packaging our codes and the required packages within a zip file. 
- Using Lambda Layer to install packages so that our code file is more
- Compacting our application into a container image. 


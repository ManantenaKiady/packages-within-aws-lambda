# Deploying python packages within AWS Lambda 

Deploying serverless applications requires us to customize the runtime where our applications run. 
AWS Lambda provides us different ways of installing packages within its runtime:

- Packaging our codes and the required packages within a zip file (under src-fn folder). 

- Using Lambda Layer to install packages (under the layers folder).

- Using container images (under the container folder) 

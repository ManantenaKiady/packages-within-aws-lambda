## Welcome

There are two solutions presented here:

- The first one is based on a local build python packages. Please follow the doc as is if you are interested. 

- The second solution is based on community prebuilt layers. You can jump directly to the **Function creation** section and then the **IMPORTANT** mention.

## Build the layer file

Please follow the following sricpt or run the `build.sh` script under the `layers` folder in the following repository: https://github.com/ManantenaKiady/packages-within-aws-lambda.git

- Create a python virtualenv and choose any version of python you want

`$ virtualenv venv --python=python3.6`

- Activate virtual env

`$ source venv/bin/activate`

- Install the required packages: Spacy in our case

`$ pip install spacy` 

- Create a python directory, since it is required by Lambda layer to specify all additional packages inside a python directory.

`$ mkdir python`

- Copy the installed packages into the python directory ( Make sure to change the python directory for a different version.)

`$ cp -r ./venv/lib/python3.6/site-packages/* ./python/`

- Zip the python folder with all files inside

`$ zip -r ./packages.zip python/`
 
Once the packages are zipped, it is recommended to upload the file to S3 if
it is bigger than 10 Mb otherwise, we can directly upload it using the provided URI within the Lambda function creation tab.
 
Here we have a zip file of size 55 Mb so we need to upload it to S3
We can use the AWS Management console to do so.
 
## Layer creation
 
1) In the AWS Lambda page click on the Layers within the Additional resources.
 
2) Here, we can list all existing layers, to create a new one, choose Create Layer
 
3) Add layer name "eg: spacyLayer"
 
4) Upload the zip file by choosing between Upload a .zip file or a file from S3. Here we choose from S3 since our packages.zip is much bigger.
 
5) Then paste the link of the S3 object, the link under the object UI. Format:
*https://<<bucket>>.s3.amazonaws.com/<<object_s3_key>>*
 
6) Choose the appropriate architecture. Here we can choose x86_64
 
7) Choose all compatible runtimes. (In my case I used python3.6)
 
8) (Optional) you can choose to change default lambda execution role ( For example using an existing role)
 
9) Click the Create button to create the layer.
 
10) Once created, go back to the Functions tab and choose a function to add a layer or create a new one.
 
## Function creation
 
1) In the AWS Lambda page click to *Functions* then *Create Function*.
 
2) Choose the option Author from scratch
 
3) Add function name eg: "spacyFunction"
 
4) Choose a runtime. It has to be compatible with the layer's runtimes.
 
5) Choose the appropriate architecture. here *x86_64*
 
6) (Optional) you can choose to change default lambda execution role ( For example using an existing role)
 
7) (Optional) you can enable code signing or enable network within the menu *Advanced settings*
 
8) Click the button Create function
 
9) Once created, we can add layers by clicking the Layers (0) within the Function overview. (Or scroll down to the Layers menu), then click Add a layer.
 
10) ** We can choose the layers to add within the prebuilt AWS layers or choose the Custom layers and find the one we have created before.
 
11) Choose the layer version and click the Add button.
 
12) Once done, we can start testing our function by creating a new test event within the Test tab.
 
Done!!
 
 
## IMPORTANT: ( A better way )
 
** Another option provided with AWS Lambda is to use ARNs. This is a good solution since
we can directly import the community's prebuilt layers into our functions.
 
 
Here is an example of a community spacy lambda layer maintained by explosion.ai which is publically available.
 
https://github.com/keithrozario/Klayers
 
Thus we can directly add layers by providing ARNs.
 
In the **##Function creation**
 
10) Choose Specify an ARN and paste a layer's ARN:
 
For spacy, from the above mentioned repository, we can use the following ARN for an us-east-1 region:
 
`arn:aws:lambda:us-east-1:770693421928:layer:Klayers-python38-spacy:42`
 
11) To add languages in spacy, we can also use a community's ARN or build our own layer:
   Add another layer and use the following ARN for spacy_model_en_small model:
 
   `arn:aws:lambda:us-east-1:770693421928:layer:Klayers-python38-spacy_model_en_small:1`
 
12) Once done we can test if the spacy library is imported successfully.
 
## Notes:
 
- It is recommended to increase the memory within the Configuration tab when using spacy models.
 
- Edit the General Configuration and increase the Memory value. 512 MB for example.
 
- We can also use EFS to store spacy models and configure any lambda function to mount it to a desired path.
 
- Of course for a complete solution we need a trigger event or add an **API Gateway** to expose our function to some external services.
 
Happy Spacying :)
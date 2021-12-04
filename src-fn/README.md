## Packages building
 
Please run the build.sh script under the `src-fn` folder once you have cloned the following repository: https://github.com/ManantenaKiady/packages-within-aws-lambda.git
 
Once the packages are zipped, it is recommended to upload the file to S3 if it is bigger than 10 Mb. Otherwise, we can directly upload it using the provided URI within the Lambda function creation.
 
Here we have a zip file of size 55 Mb so we need to upload it to S3
We can use the AWS Management console to do so.
 
## Function creation
 
1) In the AWS Lambda page click to Functions then Create Function.
 
2) Choose the option Author from scratch
 
3) Add a function name eg: "spacyFunction" 
 
4) Choose runtime, the same as the one used to build the packages ( In my case I used python3.6)
 
5) Choose the appropriate architecture. here we can choose x86_64
 
6) (Optional) you can choose to change default lambda execution role ( For example using an existing role)
 
7) (Optional) you can enable code signing or enable network within the menu Advanced settings
 
8) Click the the button Create function
 
9) Once the function is created, we can upload our packages using the tab Code and choose Upload from
 
10) We can upload the file from our local machine or provide an S3 link. In our case we choose Amazon S3 location
   since our package is bigger than 10 Mb
 
11) Then paste the link of the S3 object, the link under the Object url
   https://<<bucket>>.s3.amazonaws.com/<<object_s3_key>>
   Then click Save
 
12) Once done, we can start testing our function by creating new test event within the tab Test
 
Done!!
 


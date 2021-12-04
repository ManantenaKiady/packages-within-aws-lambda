# Create virtualenv
virtualenv venv --python=python3
# Activate virtual env
source venv/bin/activate
# Install the required packages: Spacy in our case
pip install spacy
# Create package directory
mkdir packages 
# Copy the installed packages intoo the packages directory
cp -r ./venv/lib/python3.6/site-packages/* ./packages/
# Zip the packages
cd packages && zip -r ../packages.zip .
# Include the python file within the zipped file
zip -g packages.zip lambda_function.py
# Create virtualenv choose any version of python you want
virtualenv venv --python=python3.6
# Activate virtual env
source venv/bin/activate
# Install the required packages: Spacy in our case
pip install spacy 
# Create a python directory, since it is required by Lambda layer to specify all additional packages inside a python directory.
mkdir python
# Copy the installed packages into the python directory ( Make sure to change the python directory for a different version.)
cp -r ./venv/lib/python3.6/site-packages/* ./python/
# Zip the python folder with all files inside
zip -r ./packages.zip python/
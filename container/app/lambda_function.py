import json 
import spacy 

def lambda_handler(event, context):
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from spacy!')
    }
import json 

# read the file located locally and convert to dict 
fh = open('path/to/example.json')
data = json.load(fh)

# read the file from GCP bucket and convert to dict 
from google.cloud import storage
client = storage.Client()
bucket = client.get_bucket('my-bucket')
blob = bucket.get_blob('path/to/example.json')
file = blob.download_as_string()
data = json.loads(file)

# creates unique titles per object by joining the entire hierarchy together to create a unique key
def flatten_dict(y):
    out = {}
    def flatten(x, name=''):
        if type(x) is dict:
            for a in x:
                flatten(x[a], name + a + '_')
        elif type(x) is list:
            i = 0
            for a in x:
                flatten(a, name + str(i) + '_')
                i += 1
        else:
            out[name[:-1]] = x
    flatten(y)
    return out

# call the function
print flatten_dict(data)

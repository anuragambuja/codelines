import json 

# read the file and convert to dict
fh = open('example.json')
data = json.load(fh)

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
flatten_json(data)

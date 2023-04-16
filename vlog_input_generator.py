from os import walk
path='./src'
file = open('vlog_inputs.txt','w+')
for (dirpath, dirnames, filenames) in walk(path):
    files=[path+'/'+f for f in filenames]
for p in files:
    file.write(p+'\n')
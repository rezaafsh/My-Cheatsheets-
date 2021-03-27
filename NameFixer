#special thanks to Mr.SMR76
import os
import glob
import re

idList = []

fileList = os.listdir('.')

patt = re.compile('\\d*_.*\\.jpg')

for file in fileList:
  if patt.match(file):
    nid = file.split('_')[0]
    nid = nid.zfill(10)
    
    # newName ="_".join(nid,other)    
    idList.append(nid)    
    posNum = str(idList.count(nid)).zfill(2)    
    nName = nid + '_' +  posNum + '.jpg'
    
    print('{0} -> {1}'.format(file,nName))
    os.rename(file, nName)

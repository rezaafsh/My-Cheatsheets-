f = open("C:\\Users\\rezaa\\OneDrive\\Desktop\\upi.txt", "r")
for x in f:
  st1=x.split("\t")[0]
  st2=x.split("\t")[1]
  print("data_1637742872797_upi =", st1, "then", "\'%s\'"% st2, "when")
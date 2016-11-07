import os 
file = open("nombres.txt", "r")
nombres=(l.rstrip() for l in file)

#f = open("nombres.txt", "r") #opens file with name of "test.txt"

for nombre in nombres:

	os.system("openscad.exe.lnk  -o out/"+nombre+".stl -D 'iniciales=\""+nombre+"\"' moneda.scad")

	
	

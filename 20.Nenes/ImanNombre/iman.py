import os 
file = open("nombresG.txt", "r")
nombres=(l.rstrip() for l in file)

#f = open("nombres.txt", "r") #opens file with name of "test.txt"

for nombre in nombres:
	#print ("openscad  -o out/"+nombre+".stl -D 'nombre=\""+nombre+"\"' iman_param.scad")
	os.system("openscad  -o out/"+nombre+".stl -D 'nombre=\""+nombre+"\"' iman_param.scad")

	
	

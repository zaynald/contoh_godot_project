extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var hijau=0
var kuning=0
var biru=0
var merah=0
var orange=0
var pink=0
var unggu=0
var bonus

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	Globals.set("score",self)

func killallW(w):
	Globals.get("main").killkristalWarna(w)


func sccorehit(c):
	if c=="hijau":
		hijau+=1
		if (hijau%3)==0:
			killallW(c)
		get_node("font/Label1").set_text(str(hijau))
	if c=="kuning":
		kuning+=1
		if (kuning%3)==0:
			killallW(c)
		get_node("font/Label2").set_text(str(kuning))
	if c=="biru":
		biru+=1
		if (biru%3)==0:
			killallW(c)
		get_node("font/Label3").set_text(str(biru))
	if c=="merah":
		merah+=1
		if (merah%3)==0:
			killallW(c)
		get_node("font/Label4").set_text(str(merah))
	if c=="orange":
		orange+=1
		if (orange%3)==0:
			killallW(c)
		get_node("font/Label5").set_text(str(orange))
	if c=="pink":
		pink+=1
		if (pink%3)==0:
			killallW(c)
		get_node("font/Label6").set_text(str(pink))
	if c=="unggu":
		unggu+=1
		if (unggu%3)==0:
			killallW(c)
		get_node("font/Label7").set_text(str(unggu))




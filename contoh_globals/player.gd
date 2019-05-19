extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var r =0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	Globals.set("player", self)
	#Globals.set("GUI", self)
	set_process(true)
	
func gerak():
	r +=5
	get_node("player/Sprite").set_rotd(r)
	if r==361:
		r=0
		
func _on_Button_pressed():
	
	#Globals.get("player2").putar2()# not work
	#cukup dngn
	get_node("player2").gerak2()#ok langsung aja karena children atau masuh satu parent
	Globals.get("musuh").putar()
	

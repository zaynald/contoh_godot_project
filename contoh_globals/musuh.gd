extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var s=0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	Globals.set("musuh",self)
	set_process(true)
	
func _process(delta):
	pass
	
	

func _on_Button_pressed():
	Globals.get("player").gerak() # ok work ( ke main/parent)
	Globals.get("player2").gerak2() # ke child
	putar() # ke lokal
	
	
func putar():
	s +=1
	get_node("visualmusuh").set_scale(Vector2(s,s))
	if s==10:
		s=0
	
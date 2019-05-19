extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var r=0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	Globals.set("player2", self)


func _on_Button_pressed():
	
	get_parent().get_node(".").gerak()# selama masih dlm satu parent
	# dan bukan instance

func gerak2():
	r +=5
	get_node("Sprite").set_rotd(r)
	if r==361:
		r=0

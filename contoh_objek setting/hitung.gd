extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var temp
	#temp=get_parent().call("hitung2") ok work
	temp=get_parent().hitung2() #ok work
	get_node("Label").set_text(str(temp))


func hitung(x,y):
	var z
	z=x+y
	return z
extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var play=false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#playlogo() tes
	Globals.set("logo",self)


func playlogo():
	get_node("AnimationPlayer").play("begin")
	
extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	Globals.set("master",self)


func soundmusik1():
	get_node("StreamPlayer").play(0)
	
func soundmusik2():
	get_node("StreamPlayer 2").play(0)

func soundmusik3():
	get_node("StreamPlayer 3").play(0)

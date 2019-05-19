extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var x=0
var y=0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_meta("intanc1",5)


func putar(z):
	get_node("Timer").start()
	#print("call group")
	y=z
	
func _on_Timer_timeout():
	x+=y
	get_node("Sprite").set_rotd(x)

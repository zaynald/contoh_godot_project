extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#set_meta("player","merah")
	pass

func _hit_something():
	get_parent().get_node(".")._hit_something()
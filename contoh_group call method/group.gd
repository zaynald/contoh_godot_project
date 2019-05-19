extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(String, "enemy 1", "enemy 2", "enemy 3") var enemy_name

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Label").set_text(enemy_name)
	if enemy_name=="enemy 3":
		

func dead():
	queue_free()
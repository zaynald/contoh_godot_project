extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

	





func _on_Area2D_area_enter( area ):
	print("kena")
	if area.is_in_group("musuh"):
		get_node("Label").set_text("kenaaaa")

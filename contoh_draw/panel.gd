extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func get_drag_data(pos):
	get_parent().get_node("Label 3").set_text("get drag"+str(pos))
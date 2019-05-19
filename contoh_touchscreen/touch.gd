extends TextureFrame

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)

func _input(event):
	if (event.type == InputEvent.MOUSE_MOTION):
		var posxy=event.pos
		get_node("Label").set_text(str(posxy))
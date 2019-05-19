extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var imagename

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass



func _on_TextureButton_button_up():
	if data.scene_name=="gallery":
		data.imagenow=imagename
		get_tree().change_scene("res://view.tscn")
	else:
		pass # load image line to draw main scene

extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var t = load("res://save/"+data.imagenow+".png")
	get_node("Sprite").set_texture(t)




func _on_TextureButton_pressed():
	get_tree().change_scene("res://gallery.tscn")

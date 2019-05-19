extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var r =0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func putar():
	r += 1
	get_node("Sprite").set_rotd(r)

func _on_Button_button_down():
	putar()


func _on_Button_2_button_down():
	get_tree().change_scene("res://scene2.tscn")

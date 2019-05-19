extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass



func _on_Button_pressed():
	var nilai = int(rand_range(1,5))
	get_node("Label").set_text("hasil randem rand_range :" +str(nilai))
	var nilai2 = randi()% 3
	get_node("Label 2").set_text("hasil random randi :"+str(nilai2))
	var nilai3 = randf()
	get_node("Label 3").set_text("hasil random randf :"+str(nilai3))

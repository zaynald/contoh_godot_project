extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal intance_signal
signal intance_signal2
signal intance_to_intancetes

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	print(str(get_parent()))
	#pass


func putar_intance():
	var r=get_node("Sprite").get_rotd()
	r += 10
	get_node("Sprite").set_rotd(r)

func _on_Button_pressed():
	emit_signal("intance_signal")


func _on_Button2_pressed():
	emit_signal("intance_signal2")
	


func _on_Button1_pressed():
	emit_signal("intance_to_intancetes")
	
func killself():
	queue_free()

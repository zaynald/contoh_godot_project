extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var menu=false
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func playmenu():
	Globals.get("main").setpause(true)
	get_node("AnimationPlayer").play("lose")
	

func _on_continue_pressed():
	menu=true
	get_node("AnimationPlayer").play_backwards("lose")
	
	


	


func _on_AnimationPlayer_finished():
	if menu:
		menu=false
		Globals.get("main").setpause(false)
		get_tree().reload_current_scene()


func _on_exit_pressed():
	get_tree().quit()

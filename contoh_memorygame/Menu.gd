extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#get_node("AnimationPlayer").play("mulai")
	Globals.set("menu",self)
	get_node("menu/AnimationPlayer").play("mulai")
	
	

func _on_AnimationPlayer_finished():
	get_node("menu/AnimationPlayer").stop()

func _on_TextureButton_2_pressed():#exit
	get_tree().quit()

func _on_TextureButton_pressed():
	get_tree().change_scene("res://play.tscn")
	
	
func _on_TextureButton_3_pressed():
	get_node("AnimationPlayer 2").play("set")


func _on_AnimationPlayer_2_finished():
	get_node("AnimationPlayer 2").stop(true)
	

func closesetting():
	get_node("AnimationPlayer 2").play_backwards("set",-1)

extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var skor=0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	Globals.set("winner",self)
	get_node("AnimationPlayer").play("show")
	var sett=preload("res://menu/setting.tscn").instance()
	add_child(sett)
	sett.hide()

func newwinner(s):
	skor=s

func _on_AnimationPlayer_finished():
	get_node("AnimationPlayer").stop(true)


func _on_restart_pressed():
	get_node("AnimationPlayer 2").play("hide")


func _on_AnimationPlayer_2_finished():
	get_node("AnimationPlayer").stop(true)
	get_tree().change_scene("res://play.tscn")





func _on_save_pressed():
	get_tree().change_scene("res://menu/savegame.tscn")


func _on_TextureButton_pressed():
	get_tree().change_scene("res://menu/Menu.tscn")

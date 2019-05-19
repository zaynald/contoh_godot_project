extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	if !(get_node("/root/master").pertama):
		queue_free()
	get_node("AnimationPlayer").play("begin")
	get_node("/root/master").pertama=false

func _on_AnimationPlayer_finished():
	get_tree().change_scene("res://menu/Menu.tscn")


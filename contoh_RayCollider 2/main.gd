extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const SPEED = 200
var is_enable = true

var rot=0
onready var musuh  = get_node("musuh")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#var musuh  = get_node("musuh")
	set_process(false)
	#set_process_input(true)
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	var motion = Vector2()
	var run =get_node("musuh/AnimationPlayer").get_current_animation()
	get_node("Label").set_text(str(run))
	
	
	
	if Input.is_action_pressed("ui_up"):
		motion += Vector2(0, -1)
		
			
	if Input.is_action_pressed("ui_down"):
		motion += Vector2(0, 1)
		
	if Input.is_action_pressed("ui_left"):
		rot +=0.01
		
	
			
	if Input.is_action_pressed("ui_right"):
		rot -=0.01
		
			
	#animasi.play("idle")
	motion =motion.rotated(rot)
	
	var pos = musuh.get_pos()
	pos += motion*delta*SPEED
	musuh.set_rot(rot)
	musuh.set_pos(pos)
	
	
func is_musuh():
	pass

func animasi():
	var animasi =get_node("musuh/AnimationPlayer")
	animasi.play("ani")
	animasi.queue("idle")
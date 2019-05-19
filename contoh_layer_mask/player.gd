extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const SPEED = 200
var rotasi=0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)


func _fixed_process(delta):


	var motion = Vector2()
	#var ROT=get_rotd()
	

	
	if Input.is_action_pressed("ui_up"):
		motion += Vector2(0, -0.9)
	
		
	if Input.is_action_pressed("ui_down"):
		motion += Vector2(0, 0.9)
		
	if Input.is_action_pressed("ui_left"):
		rotasi += 0.9
		
	if Input.is_action_pressed("ui_right"):
		rotasi -= 0.9
		
	
	
	set_rotd(rotasi)
	var rots=get_rot()
	var pos = get_pos()
	motion=motion.rotated(rots)
	pos += motion*delta*SPEED
	#var rotdegree=get_rotd()
	#get_node("Label").set_text(str(rotdegree))
	
	#get_parent().get_node("Label").set_text(str(pos))
	set_pos(pos)


func _on_player_area_enter( area ):
	get_node("Label").set_text("kena")


func _on_RigidBody2D_body_enter( body ):
	get_node("Label").set_text("kena")

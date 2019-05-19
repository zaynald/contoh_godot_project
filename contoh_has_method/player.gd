
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"
const SPEED = 200
var motion = Vector2()
var pos =Vector2()

var destroyed = false
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	set_process_input(true)
	set_fixed_process(true)
	


	
	
func _fixed_process(delta):
	var motion = Vector2()
	if Input.is_action_pressed("ui_left"):
		motion += Vector2(-2, 0)
	if Input.is_action_pressed("ui_right"):
		motion += Vector2(1, 0)
	var pos = get_pos()
	pos += motion*delta*SPEED
	
	#cek jangan sampai keluar
	if (pos.x < 0):
		pos.x = 0
	if (pos.x >481):
		pos.x = 480
	set_pos(pos)
	#get_node("Label").set_text(str(pos))

func hit():
	get_node("Label").set_text("hitttt")
	
func is_player():
	return not destroyed
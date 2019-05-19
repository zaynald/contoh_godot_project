
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"
const SPEED = 200
var offset 
var temp_offset
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Label").set_text("no")
	offset = get_pos().y
	temp_offset = offset
	set_fixed_process(true)


func _fixed_process(delta):
	offset += delta*SPEED #awal
	set_pos(Vector2(240,offset)) #awal
	if(offset>600):
		offset = 0
	

func _on_bodybuah_area_enter( area ):
	if (area.has_method("is_player") ):
		area.hit()
		get_node("Label").set_text("hitt")




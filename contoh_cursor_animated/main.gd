extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Sprite 2").set_rotd(30)
	set_process_input(true)
	
func _input(ev):
# Mouse in viewport coordinates
	if (ev.type==InputEvent.MOUSE_BUTTON):
		get_node("Sprite/Label").set_text("klik posisi: "+str(ev.pos))
		get_node("Sprite").set_pos(ev.pos)
		#print("Mouse Click/Unclick at: ",ev.pos)
	elif (ev.type==InputEvent.MOUSE_MOTION):
	#elif (ev.type==InputEvent.SCREEN_DRAG):
		#print("Mouse Motion at: ",ev.pos)
		var rmotion = ev.relative_pos
		#get_node("Sprite/Label 2").set_text("motion posisi: "+str(ev.pos)) #ok work
		get_node("Sprite/Label 2").set_text("motion posisi: "+str(ev.x)) # ok work
		get_node("Sprite/Label 3").set_text("relativ posisi: "+str(rmotion))
		get_node("Sprite/Label 4").set_text("relativ x posisi: "+str(ev.relative_x))
		get_node("Sprite/Label 5").set_text("speed x: "+str(ev.speed_x))
		#get_node("Sprite/Label 6").set_text("shift: "+str(ev.shift)) # ok
		get_node("Sprite/Label 6").set_text("speed y: "+str(-ev.speed_y))
		get_node("Sprite 2").set_pos(ev.pos)
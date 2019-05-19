
extends Area2D

var poscenter
var pusat=0
var negatif=false

# Virtual from CollisionObject2D (also available as signal)
func _input_event(viewport, event, shape_idx):
	# Convert event to local coordinates
	if (event.type == InputEvent.MOUSE_MOTION):
		var global_pos = event.pos
		event = make_input_local(event)
		
		var pos=event.relative_pos
		get_node("label").set_text(str(event.pos))
		
		
		var sudut = poscenter.angle_to_point(global_pos)
		get_node("label1").set_text("sudut :"+str(rad2deg(sudut))+" pusat: "+str(pusat))
		get_node("pos").set_rot(sudut)
		var sudutdeg = rad2deg(sudut)
		
		if sudutdeg >=0:
			sudut *=-1
			
		
		if sudutdeg <= pusat+10 and sudutdeg >=pusat-10:
			 normal()
		else :
			
				
			if sudutdeg > pusat+10:
				kiri()
				if sudutdeg > pusat+15:
					pusat +=1
					
			elif sudutdeg < pusat-10:
				kanan()
				if sudutdeg < pusat-15:
					pusat -=1
			
				
					
		get_node("center").set_rotd(pusat)

# Virtual from CollisionObject2D (also available as signal)
func _mouse_exit():
	get_node("label").set_text("")



func normal():
	pass
	
func kiri():
	pass
	
func kanan():
	pass

func _ready():
	
	poscenter = get_node("pos").get_global_pos()
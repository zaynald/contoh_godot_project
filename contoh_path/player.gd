
extends Navigation2D

# Member variables
const SPEED = 200.0

var begin = Vector2()
var end = Vector2()
var path = []
var target
var huruf

func _process(delta):
	if (path.size() > 1):
		var to_walk = delta*SPEED
		while(to_walk > 0 and path.size() >= 2):
			var pfrom = path[path.size() - 1]
			var pto = path[path.size() - 2]
			var d = pfrom.distance_to(pto)
			if (d <= to_walk):
				path.remove(path.size() - 1)
				to_walk -= d
			else:
				path[path.size() - 1] = pfrom.linear_interpolate(pto, to_walk/d)
				to_walk = 0
		
		var atpos = path[path.size() - 1]
		skala(atpos.y)
		#if (atpos.y<160):
			#get_node("orang").set_scale(Vector2(0.15,0.15))
		#if (atpos.y>161 and atpos.y<320):
			#get_node("orang").set_scale(Vector2(0.25,0.25))
		#elif(atpos.y>321):
			#get_node("orang").set_scale(Vector2(0.4,0.4))
			
		get_node("body").set_pos(atpos)
		
		if (path.size() < 2):
			path = []
			set_process(false)
	else:
		set_process(false)


func _update_path():
	var p = get_simple_path(begin, end, true)
	path = Array(p) # Vector2array too complex to use, convert to regular array
	path.invert()
	
	set_process(true)


func _input(event):
	if (event.type == InputEvent.MOUSE_BUTTON and event.pressed and event.button_index == 1):
		begin = get_node("body").get_pos()
		# Mouse to local navigation coordinates
		end = event.pos - get_pos()
		#get_node("suara").play("b") # bunyi ketika klik
		#get_node("Label").set_text("targetnya "+str(target))
		_update_path()
		


func _ready():
	
	var pos = get_node("body").get_pos()
	skala(pos.y)
	set_process_input(true)
	randomtarget()

func hit():
	pass

func skala(y):
	var sk=95.6+(0.2*y)
	sk=sk/479
	get_node("body/orang").set_scale(Vector2(sk,sk))

#func _on_body_area_enter_shape( area_id, area, area_shape, self_shape ):
	#if (area.has_method("gantienemy") ):
		#get_node("Label").set_text("keennnaaa")


func _on_body_area_enter( area ):
	if (area.has_method("gantienemy") ):
		#get_node("Label").set_text("targetnya "+huruf)
		area.targetnya(target)
		area.hit()
		
func cektarget(s):
	if (s==0):
		huruf="A"
		
	if (s==1):
		huruf="B"
		
	if (s==2):
		huruf="C"
		
func randomtarget():
	target =randi() % 3
	cektarget(target)
	get_node("Label").set_text("targetnya "+huruf)
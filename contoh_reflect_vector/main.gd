extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var lb = get_node("Label")
onready var ssr = get_node("Position2D/RayCast2D")
onready var panah = get_node("panah")


var testitik = Vector2(0,10)

#onready var panah = get_node("Polygon2D")

var r=0
var normal=Vector2()
var posx
var pos
var posawal

var posakhir=Vector2()
var mantul = false
var panjangtali=0

func _ready():
	
	posawal =  get_node("Position2D").get_pos()
	
	
	# Called every time the node is added to the scene.
	# Initialization here
	var v=Vector2(270,0)
	var poswal=get_node("awal").get_pos()
	var vrot=v.rotated(deg2rad(45))
	var norV=vrot.normalized()
	
	var hasilreflec=norV.reflect(poswal)

	get_node("akhir").set_pos(hasilreflec)
	print(str(hasilreflec))
	#get_node("wall").set_rotd(45)





func _on_Control_input_event( ev ):
	if (ev.type == InputEvent.MOUSE_MOTION):
		#ev = make_input_local(ev)
		
		mantul = false
		pos = ev.pos
		panah.look_at(pos)
		
		var sud = panah.get_rot()
		var testitiknew = testitik.rotated(sud)
		ssr.set_cast_to(pos-posawal)
		#panjangtali = (pos-posawal).normalized()
		
		#var jarak = posawal.distance_to(pos)
		
		
		lb.set_text(str(testitiknew+Vector2(480,580)))
		if ssr.is_colliding():
			
			mantul=true
			normal = ssr.get_collision_normal()
			
			var obj = ssr.get_collider()
			posx =ssr.get_collision_point()
			var c =(posawal-posx).normalized()
			
			#panah.set_pos(posx)
			var jarak = posawal.distance_to(posx)
			var t = 400-jarak
			pos = posx
			reflek(normal,(posx-posawal).normalized(),t)
			#pl.normal=normal
			#pl.relek(normal)
			#pl.posnew=posx
			#panah.set_rot(normal.angle())
		
	if (ev.type == InputEvent.MOUSE_BUTTON):
		pass
		#pl.relek(normal)
		#pl.motion=Vector2(-1,-1)
		#pl.posnew=posx
		#pl.set_pos(posx)
	update()

func _draw():
	draw_line(posawal,pos,Color(1,1,1),1)
	if mantul:
		draw_line(pos,posakhir,Color(1,1,1),1)

func reflek(x,y,panjang):
	
	posakhir = (x.reflect(y))*panjang+pos
	#posakhir = posakhir + pos
	#lb.set_text(str(posakhir))


func _on_Timer_timeout():
	r +=10
	get_node("wall").set_rotd(r)

	if r==360:
		r=0
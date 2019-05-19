extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var posmos=Vector2()
var gmbr=load("res://icon.png")
const RED = Color(1.0, 0, 0, 0.4)
var warna=Color(1.0, 0, 0, 0.4)
var posawal=Vector2()
var klik=0
var garis=[1,Vector2(0,0),Vector2(100,100),Color(1.0, 0, 0, 0.4),4,
			]
var tembal=3
var draw=false
var lokasidraw=Vector2()

var klikon=false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	lokasidraw=get_pos()
	set_fixed_process(false)
	#set_blend_mode(3)
	#get_node("layer").set_layer(2)
	

func _fixed_process(delta):
	posmos=get_local_mouse_pos()
	update()
	
func _draw():
	gambardrarr()
	#hide()
	#set_blend_mode(3)
	#set_draw_behind_parent(true)
	#if klik==2:
		#draw_texture(gmbr,posmos,Color(1,1,1,1))
		#draw_line(posawal,posmos,warna,tembal)
		#gambardrarr()
		#return
	
	
	#if klik==1:
		#pass
		#gambardrarr()
	#get_node(
	

func gambardrarr():
	
	var p1
	var p2
	var p3
	var p4
	
	for y in range(garis[0]):
		#print(str(y))
		
		#print(str(y*4+1))
		p1=garis[y*4+1]
		p2=garis[y*4+2]
		p3=garis[y*4+3]
		p4=garis[y*4+4]
			
		draw_line(p1,p2,p3,p4)
		#print("draw arr :"+str(p2))
	#update()
	

func _on_Control_2_input_event( ev ):
	if ev.type==InputEvent.MOUSE_BUTTON:
		var arrG=get_tree().get_nodes_in_group("layer")
		print(str(arrG))

func updategaris():
	var x=garis[0]
	x+=1
	garis.remove(0)
	garis.push_front(tembal)
	garis.push_front(warna)
	garis.push_front(posmos)
	garis.push_front(posawal)
	garis.push_front(x)
	print("array action")
	#gambardrarr()

func _on_ColorFrame_input_event( ev ):
	warna=get_parent().get_node("ColorFrame").get_frame_color()

func _on_ColorPickerButton_color_changed( color ):
	warna=color



	

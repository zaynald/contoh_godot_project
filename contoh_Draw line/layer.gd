extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var p1=Vector2()
var p2=Vector2()
var p3
var p4
var mulai=false

var posend=Vector2(100,0)

var warna=Color(1.0, 0, 0, 0.4)

var garis=[1,Vector2(200,100),Vector2(400,400),Color(1.0, 0, 0, 0.4),4,
			]
			
var klik=0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#set_layer(1)
	pass
	#get_node("ColorFrame").set_frame_color(Color(1,1,1,1))


func _draw():
	#print("awal")
	#draw_line(Vector2(0,0),Vector2(600,291),Color(1,0,0,0.4),2)
		
	#if mulai==true:
		
	gmbarARR()
		
		#gmbarARR()
		#show()
		#print(p1)
	#gmbarARR()
	
	
func gmbarARR():
	
	#print("gmbarARR")
	
	for y in range(garis[0]):
		#print(str(y))
		#draw_line(Vector2(0,0),Vector2(600,291),Color(1,0,0,0.4),2)
		
		#print(str(y*4+1))
		p1=garis[y*4+1]
		p2=garis[y*4+2]
		p3=garis[y*4+3]
		p4=garis[y*4+4]
		
		draw_line(p1,p2,p3,p4)
		
		#draw_line(Vector2(p1.x,p1.y),Vector2(p2.x,p2.y),Color(1,1,0,0.4),6)
		#print(str(garis[0]))
		#print(str(y))
		#update()
		#draw_line(p1,p2,p3,p4)
	
func drawBuffer(posawal,posmos,warna,tebal):
	
	posend=posmos
	var x=garis[0]
	x+=1
	garis.remove(0)
	garis.push_front(tebal)
	garis.push_front(warna)
	garis.push_front(posmos)
	garis.push_front(posawal)
	garis.push_front(x)
	
	print(str(garis))
	mulai=true
	update()
	



func _on_ColorFrame_input_event( ev ):
	if ev.type==InputEvent.MOUSE_BUTTON:
		if klik==0:
			
			get_node("ColorFrame").set_frame_color(Color(0,0.2,1,1))
			klik=1
			return
			
		if klik==1:
			#pass
			get_node("ColorFrame").set_frame_color(Color(0,0,0,1))
			klik=0
		if !Input.is_mouse_button_pressed(1):
			#get_node("ColorFrame").set_frame_color(Color(0,0,0,1))
			klik=1

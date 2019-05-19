extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var tapped=false
var gmbr=preload("res://icon.png")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	set_default_cursor_shape(10)
	
	
func _fixed_process(delta):
	var posxy
	#posxy=Input.get_mouse_speed()# ok work
	#posxy=Input.is_mouse_button_pressed(1)# ok work
	#posxy=Input.is_pressed() #notw owrk
	#Input.set_custom_mouse_cursor(gmbr,Vector2(0,0)) # ok work
	
	get_node("Label 2").set_text(str(posxy))
	
	
func _draw():
	var r = Rect2( Vector2(), get_size() )
	if (tapped):
		draw_rect(r, Color(1,0,0) )
		get_parent().get_node("Timer").start()
	else:
		draw_rect(r, Color(0,0,1) )
		draw_circle(Vector2(100,100),80,Color(0,1,1))
		draw_texture(gmbr,Vector2(10,100),Color(1,1,1,1))
		
func _input_event(ev):
	var posxx=ev.pos
	
	
	if (ev.type==InputEvent.MOUSE_BUTTON and ev.pressed):
		tapped=true
		update()




func _on_Timer_timeout():
	tapped=false
	update()


func _on_TextureButton_button_down():
	tapped=false
	update()


func _on_Control_mouse_enter():
	var pos=Vector2()
	pos=get_global_mouse_pos()
	


func _on_Control_input_event( ev ):
	var posx
	posx=ev.pos # ok work hasil posisi cursor
	#posx=ev.type # jenis MOUSE_MOTION =2
	#posx=ev.ID #gak jelas hanya anggka
	get_node("Label").set_text(str(posx))

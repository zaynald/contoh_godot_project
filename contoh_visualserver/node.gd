extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var rid = get_node("tes").get_canvas_item()
onready var rid2 = get_node("tes2").get_canvas_item()

var newrid 
var tex2 = ImageTexture.new()
onready var rid3 = get_node("CanvasLayer/Sprite").get_canvas_item()
onready var tex = get_node("kuas").get_texture()

onready var tinta =get_node("tinta").get_texture()

onready var sprite = get_node("tes")

var textur = ImageTexture.new()

var size = 50
var rect = Rect2(Vector2(0,0),Vector2(size,size))
var rect2 = Rect2(Vector2(0,0),Vector2(50,10))
var scale = 1.0/(size-1)
var texture
var time = 0
var w = Color(1,1,1,1)
var klik = false
var arrpos=[]
var d 
var img2=Image(800,600,true,4)


func _ready():
	d = get_node("Viewport/Camera2D").get_viewport()
	Globals.set("main",self)
	
	# Called every time the node is added to the scene.
	# Initialization here
	Globals.get("draw").tex=tinta
	generate_texture()
	set_process(false)
	set_process_input(false)
	update()
	#set_opacity(0.1)
	#VisualServer.canvas_item_set_opacity( rid, 0.1 )
	
func _process(delta):
	time +=delta
	generate_texture()
	
	update()


func _input(ev):
	pass
	

func _draw():
		#sprite.set_pos(x)
		#VisualServer.canvas_item_add_circle(rid,Vector2(0,0),20,w)
	
	VisualServer.canvas_item_add_texture_rect(rid,rect2,textur,false,w)
	#VisualServer.canvas_item_set_self_opacity( rid, 0.1 ) #work
	#VisualServer.canvas_item_add_texture_rect(rid3,rect,textur,false)

func generate_texture():
	var img = Image(size,size,0,4)
	var blue = (sin(time)+1)/2
	for i in range(0,size):
		for j in range(0,size):
			var color = Color(i*scale,j*scale,blue,1)
			img.put_pixel(i,j,color)
	#texture = VisualServer.texture_create_from_image(img)
	textur.create_from_image(img,7) 



func _on_ColorPickerButton_color_changed( color ):
	w = color
	get_node("kuas").set_modulate(color)


func _on_Timer_timeout():
	#arrpos.clear()
	pass


func _on_Control_input_event( ev ):
	if ev.type==InputEvent.MOUSE_MOTION :
		get_node("kuas").set_pos(ev.pos)
		#arrpos.empty()
		#event.type==InputEvent.MOUSE_MOTION #ok work
		if Input.is_mouse_button_pressed(1):
			#print("klik")
			
			#get_node("tes").show()
			arrpos.append(ev.pos)
			Globals.get("draw").gambar(w,arrpos)
			klik=true
		if !Input.is_mouse_button_pressed(1):
			if klik:
				klik=false
				getimage()
				arrpos.clear()
				


func getimage():
	#var c =get_viewport()
	
	#print(str(d))
	d.queue_screen_capture()
	
	
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")

	var img = d.get_screen_capture()

	
	


	
	#img2=img.get_rect(Rect2(0,0,800,600))
	img2.blend_rect(img,Rect2(0,0,800,600),Vector2(0,0))
	
	#var tex = ImageTexture.new()
	tex2.create_from_image(img2)
	get_node("Viewport/capture").set_texture(tex2)

func _on_Button_pressed():
	#update()
	textur.draw(rid,Vector2(200,200),Color(1,1,1,1),false)
	pass # replace with function body


func _on_Button_2_pressed():
	VisualServer.canvas_item_add_texture_rect(rid,rect2,textur,false,w)

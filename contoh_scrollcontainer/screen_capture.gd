extends Control


onready var texf = get_node("Viewport/Sprite").get_material()
onready var kuas = get_node("kuas")

var imageMAP = Image(800,600,true,4)

var warnakuas=Color(1,1,1,1)
onready var d = get_node("Viewport/Sprite").get_viewport()

var lineimg = preload("res://linevs.png")
var imgmap = "res://kuda.png"
var tinta_tx = preload("res://tintalarge.png")

var namafile=[]

var text = "gmbr0"

func _ready():
	
	Globals.set("main",self)
	imageMAP.load(imgmap)
	
	get_node("line").set_texture(lineimg)
	texf.set_shader_param("texmap",load(imgmap)) # isi pencarian map warna
	open_file()
	colorpaint()
	
func colorpaint():
	
	var w =[Color(1,0,0,1),Color(0,1,0,1),Color(0,0,1,1),Color(0.5,0.5,0.5,1),Color(0,0,0,1),Color(1,1,0,1),Color(1,0,1,1),Color(0,1,1,1),Color(1,1,1,1),Color(0.5,0.5,0,1)]
	var u =w.size()
	var pos=0
	for y in range(0,5*30,30):
		for x in range(0,2*30,30):
			if u==pos:
				break
			var c = load("res://warna.tscn").instance()
			c.warna=w[pos]
			c.set_pos(Vector2(x,y))
			get_node("ScrollContainer/Position2D").add_child(c)
			pos +=1


func saveimage(save):
	d.queue_screen_capture()

	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")

	var img = d.get_screen_capture()
	var x = img.get_width()
	var y = img.get_height()
	var d=8
	
	
	if save:
		var imgnew = img.resized(x/d,y/d,1)
		imgnew.save_png("res://save/"+text+"s.png")
		img.save_png("res://save/"+text+".png") #save image you here
	else:
		var tex = ImageTexture.new()
		tex.create_from_image(img)
		get_node("Viewport/save/image").set_texture(tex)
	
	
	
func set_warna(w):
	get_node("ColorPickerButton").set_color(w)
	warnakuas=w
	
func _on_ColorPickerButton_color_changed( color ):
	warnakuas=color
	
func _on_Control_input_event( ev ):

	if Input.is_mouse_button_pressed(1):
		pilihwarna(ev.pos)

	if ev.type==InputEvent.MOUSE_MOTION :
		kuas.set_pos(ev.pos)
		
		
	
func pilihwarna(pos):

	var col = imageMAP.get_pixel(pos.x,pos.y,0)
	var r=(round(col.r*100))/100
	var g=(round(col.g*100))/100
	var b=(round(col.b*100))/100
	texf.set_shader_param("warnacari",Color(r,g,b))
	texf.set_shader_param("gantiwarna",warnakuas)
	#print(str(warnakuas))

func _on_Button_pressed():
	saveimage(false)
	get_node("AcceptDialog").show()

	
	
func save_file():
	var save_file = File.new()
	save_file.open("res://save.txt", File.WRITE)
	
	for k in namafile:
		save_file.store_line(k)
		
	save_file.close()
	
func open_file():
	namafile.clear()
	var f = File.new()
	if (f.open("res://save.txt", File.READ) == OK):
		while !f.eof_reached():
			var dataS = f.get_line()
			namafile.append(dataS)
	namafile.pop_back()
	#print(str(namafile.size()))
	data.data_save=namafile  #isi data globals
func _on_AcceptDialog_confirmed():
	
	
	get_node("Viewport/Sprite").hide()
	get_node("Viewport").set_render_target_clear_on_new_frame(true)
	get_node("Viewport/save").show()
	
	
	saveimage(true)
	#yield(get_tree(), "idle_frame")
	var n = namafile.size()
	text = "gmbr"+str(n)
	namafile.append(text)
	
	get_node("Viewport/Sprite").show()
	get_node("Viewport").set_render_target_clear_on_new_frame(false)
	get_node("Viewport/save").hide()
	#get_node("AcceptDialog").hide()
	data.data_save=namafile
	save_file()





func _on_Button_2_pressed():
	get_node("Viewport").set_as_render_target(false)
	get_node("Viewport").set_render_target_clear_on_new_frame(true)
	texf.set_shading_mode(2)
	texf.set_shader_param("gantiwarna",Color(1,1,1,0))
	
	#yield(get_tree(), "idle_frame")
	texf.set_shading_mode(1)
	get_node("Viewport").set_render_target_clear_on_new_frame(false)
	texf.set_shading_mode(1)
	texf.set_shader_param("gantiwarna",Color(0,0,0,0))
	get_node("Viewport").set_as_render_target(true)


func _on_Buttongallery_pressed():
	data.scene_name="gallery"
	get_tree().change_scene("res://gallery.tscn")





func _on_Control_mouse_enter():
	get_node("kuas").show()
	Input.set_mouse_mode(1)
	

func _on_Control_mouse_exit():
	get_node("kuas").hide()
	Input.set_mouse_mode(0)

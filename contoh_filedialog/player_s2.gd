extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var coba = preload("res://SleepAway.ogg")
var pausebg = preload("res://pause.png")
var playbg = preload("res://play.png")
var t
var p = false
var isplay = false
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Label").set_text("hello")
	#get_node("Sprite").get_groups()


func _on_Button_button_down():
	get_tree().change_scene("res://main.tscn")


func _on_Button_2_button_down():
	Globals.get("sound").ganti_musik()
	


func _on_Button_3_button_down():
	Globals.get("sound").stopmusik()


func _on_Button_4_button_down():
	Globals.get("sound").playlg()


func _on_Button_5_button_down():
	var filter = ["*.ogg"]
	get_node("FileDialog").show()
	get_node("FileDialog").add_filter(filter )
	#var coba =load(get_node("FileDialog").get_current_file())
	
	


func _on_FileDialog_file_selected( path ):
	#var coba =load(get_node("FileDialog").get_current_file())
	
	#var namapath = get_node("FileDialog").get_current_path()# ok work
	var coba=load(path)
	get_node("Label 2").set_text(str(path))
	Globals.get("sound").ganti_musik(coba)


func _on_Button_6_toggled( pressed ):
	t=pressed
	#Globals.get("sound").bekukan(t) 
	if pressed:
		get_node("Label").set_text("true")
	else:
		get_node("Label").set_text("false")


func _on_Button_6_pressed():
	get_node("Label").set_text("true")





func _on_FileDialog_confirmed():
	get_node("Label 3").set_text("_on_FileDialog_confirmed")



	


func _on_TextureButton_button_down():
	
	if not p:
		get_node("VideoPlayer").play()
	else:
		get_node("VideoPlayer").set_paused(false)


# contoh toggle play
func _on_TextureButton_2_button_down():
	if not isplay:
		get_node("VideoPlayer").play()
		isplay=true
		get_node("TextureButton 2").set_normal_texture(pausebg)
		
		
	if not p:
		get_node("VideoPlayer").set_paused(false)
		get_node("TextureButton 2").set_normal_texture(pausebg)
		#get_node("VideoPlayer").play()
		p = true
	else:
		p = false
		get_node("VideoPlayer").set_paused(true)
		get_node("TextureButton 2").set_normal_texture(playbg)


func _on_TextureButton_toggled( p ):
	if p:
		get_node("Label 3").set_text("on")
	else:
		get_node("Label 3").set_text("off")

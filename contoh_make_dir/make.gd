extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var osname
var memory=1
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	osname= OS.get_name()




func _on_Button_pressed():
	var path
	if osname=="Windows":
		path="l://notebk"
	else:
		if memory==1:
			path="/storage/emulated/0/notebk" # internal
		elif memory==2:
			path="/storage/9C2F-BCF9/notebk" #external SDCARD
	var er
	
	var dir = Directory.new()
	if !dir.dir_exists(path):
		#dir.make_dir("/storage/emulated/0") # smartphone
		er = dir.make_dir(path) # in PC
		if er!=OK:
			print("error export")
			get_node("ColorFrame/Label").set_text("error")
			get_node("ColorFrame").show()
		else:
			get_node("ColorFrame/Label").set_text("folder sudah dibuat")
			get_node("ColorFrame").show()
	else:
		get_node("ColorFrame/Label").set_text("folder sudah ada")
		get_node("ColorFrame").show()


func _on_ok_pressed():
	get_node("ColorFrame").hide()
	


func _on_FileDialog_confirmed():
	var path = get_node("FileDialog").get_current_path()
	get_node("ColorFrame/Label").set_text(path)
	get_node("ColorFrame").show()
	get_node("FileDialog").hide()


func _on_Button1_pressed():
	get_node("FileDialog").show()


func _on_Button2_pressed():
	get_tree().quit()


func _on_Button3_pressed():
	memory=1


func _on_Button4_pressed():
	memory=2

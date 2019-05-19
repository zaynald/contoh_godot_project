extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var inst_icon = preload("res://galleryfile.tscn")
var file_imageline=["imgl01","imgl02"]
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	if data.scene_name=="gallery":
		load_saveimage()
	else:
		load_imageline()



func load_imageline():
	
	var u = file_imageline.size()
	var pos=0
	for y in range(4,5*115,115):
		for x in range(2,5*134,134):
			if u==pos:
				break
			var imagefile=file_imageline[pos]
			var text = load("res://imgline/"+imagefile+"s.png")
			
			var icone = inst_icon.instance()
			icone.set_pos(Vector2(x,y))
			icone.imagename=imagefile
			icone.get_node("Sprite").set_texture(text)
			get_node("ScrollContainer/Position2D").add_child(icone)
			pos +=1
	
	

func load_saveimage():
	var file = data.data_save
	

	var u = file.size()
	var pos=0
	for y in range(4,5*115,115):
		for x in range(2,5*134,134):
			if u==pos:
				break
			var imagefile=file[pos]
			var text = load("res://save/"+imagefile+"s.png")
			
			var icone = inst_icon.instance()
			icone.set_pos(Vector2(x,y))
			icone.imagename=imagefile
			icone.get_node("Sprite").set_texture(text)
			get_node("ScrollContainer/Position2D").add_child(icone)
			pos +=1
		
		
		

func _on_TextureButton_pressed():
	get_tree().change_scene("res://main.scn")

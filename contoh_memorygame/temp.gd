extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_lok2_button_down():
	
	if !lok2_buka:
		get_node("box/lok2").set_normal_texture(gbr_lok2)
		
		klik +=1
		get_node("Label 4").set_text(str(klik))
		
		if klik==2:
			lok2_buka=cek(v2)
		elif klik==1:
			buka1=v2
			get_node("Label 5").set_text("isi dari v1: "+ buka1)
			lok2_buka=true
			
		if !lok2_buka and klik==0:
			get_node("box/lok2").set_normal_texture(gbr_tanya)

extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(Color, RGBA) var warna

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("ColorFrame").set_frame_color(warna)


func _on_Button_pressed():
	Globals.get("main").set_warna(warna)
	Globals.get("mix").set_colormix(warna)

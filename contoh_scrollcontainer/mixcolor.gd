extends Position2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var warnalast=Color(1,1,1,1)
var posmix=0.5
var warnamix


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	Globals.set("mix",self)


func set_colormix(w):
	get_node("ColorFrame").set_frame_color(w)
	get_node("ColorFrame1").set_frame_color(warnalast)
	warnamix = w.linear_interpolate(warnalast,posmix)
	
	get_node("Button/ColorFrame").set_frame_color(warnamix)
	warnalast=w

func _on_HSlider_value_changed( value ):
	var w = get_node("ColorFrame").get_frame_color()
	var w2 = get_node("ColorFrame1").get_frame_color()
	posmix=value
	warnamix = w.linear_interpolate(w2,value)
	#var blendcolor = w.blend(w2)
	#get_node("ColorFrame").set_frame_color(blendcolor)
	get_node("Button/ColorFrame").set_frame_color(warnamix)
	Globals.get("main").set_warna(warnamix)


func _on_Button_pressed():
	Globals.get("main").set_warna(warnamix)

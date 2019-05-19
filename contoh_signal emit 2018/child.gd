extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal child_signal
signal child_to_intance
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#connect("child_signal",get_parent(),"putar_main")
	Globals.set("main",get_parent())
	Globals.set("tes","hello")
	print(str(get_parent()))

func putar_child():
	var r=get_node("Sprite1").get_rotd()
	r += 10
	get_node("Sprite1").set_rotd(r)

func _on_Button_pressed():
	#Globals.get("main").putar_main()
	#emit_signal("child_signal")
	Globals.get("main").putar_main()
	print("nama id :"+str(Globals.get("tes")))


func _on_Button1_pressed():
	emit_signal("child_to_intance")

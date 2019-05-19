extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var musik2 = preload("res://SleepAway.ogg")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	Globals.set("sound",self)

func ganti_musik(musik):
	get_node("StreamPlayer").set_stream(musik)
	get_node("StreamPlayer").play()
	
func stopmusik():
	get_node("StreamPlayer").stop()
	
func playlg():
	get_node("StreamPlayer").play()
	
func bekukan(onoff):
	
	if onoff:
		get_node("StreamPlayer").set_paused(true)
	else:
		get_node("StreamPlayer").set_paused(false)
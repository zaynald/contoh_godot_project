extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var done=false
var ints

signal signal_main_to_intance
signal signal_main_tochild

signal kill_all_intance

var intance=preload("res://intance.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var node=get_node("child")
	#print(str(node))
	#jika di luar node
	#node.connect("child_signal",self,"putar_main")
	# jika di node lokal 
	#connect("child_signal",get_parent(),"putar_main")
	
	connect("signal_main_tochild",node,"putar_child")
	
	Globals.set("child",node)
	
	#Globals.set("main",self)


func putar_main():
	var r=get_node("Sprite").get_rotd()
	r += 10
	get_node("Sprite").set_rotd(r)

func _on_Button_2_pressed():
	if !done:
	#pass # replace with function body
		done=true
		var i=intance.instance()
		i.set_pos(get_node("Position2D").get_pos())
		i.connect("intance_signal",self,"putar_main") #to main
		i.connect("intance_signal2",get_node("child"),"putar_child") #to child
		
		connect("signal_main_to_intance",i,"putar_intance")
		connect("kill_all_intance",i,"killself")
		
		get_node("child").connect("child_to_intance",i,"putar_intance") # child to intance
		
		add_child(i)
		ints = i
		return
	if done:
		if ints != null:
			ints.queue_free()
			done = false
		


func _on_Button_pressed():
	#pass # replace with function body
	emit_signal("signal_main_to_intance")


func _on_Button3_pressed():
	var i=intance.instance()
	i.set_pos(get_node("Position2D2").get_pos())
	i.connect("intance_signal",self,"putar_main")
	i.connect("intance_signal2",get_node("child"),"putar_child")
	i.connect("intance_to_intancetes",ints,"putar_intance")
	i.get_node("Label").set_text("in intance 2")
	
	connect("signal_main_to_intance",i,"putar_intance")
	connect("kill_all_intance",i,"killself") # signal kill intance
	
	get_node("child").connect("child_to_intance",i,"putar_intance") # child to intance
	
	add_child(i)


func _on_Button1_pressed():
	emit_signal("signal_main_tochild")



func _on_Button2_pressed():
	ints=null
	done=false
	emit_signal("kill_all_intance")


func _on_Button_3_pressed():
	Globals.get("child").putar_child()

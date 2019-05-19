extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var nodeG=[]

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	for x in range(1,3):
		var kristal = preload("res://group.tscn").instance()
		kristal.enemy_name="enemy instance"+str(x)
		kristal.set_pos(Vector2(100*x,100*x))
		add_child(kristal)
		
	nodeG=get_tree().get_nodes_in_group("enemy")
	for n in nodeG:
		print(str(n.get_name()))
		if n.get_name()=="group":
			#n.get_tree().queue_delete()
			n.queue_free()
			#n.remove_child() # not work
			n.remove_from_group("enemy") # hilang jika sudah dihapus
		
	
	nodeG=[]
	nodeG=get_tree().get_nodes_in_group("enemy")
	print("array group:"+str(nodeG))
	for n in nodeG:
		print(str(n.get_name()))
		
	var temp=get_tree().get_root()
	print("nama root "+str(temp.get_name()))
	
	var basket=["xapple","corange","dpear"]
	if "apple" in basket:
		print("ada")
	for x in basket:
		print(str(x))
		
	#basket.sort() # ok work
	var c=basket.count("xapple")
	print(str(c)) #print 1 
	#del basket[0:1]
	#c=basket.index("xapple")
	#print(str(c)) #print 1 
	
	

func _on_Button_pressed():
	get_tree().call_group(1,"enemy","dead")


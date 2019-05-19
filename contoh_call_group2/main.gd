extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass




func _on_Button_pressed():
	get_tree().call_group(0,"group1","putar",2)



func _on_Button_2_pressed():
	var arrG=get_tree().get_nodes_in_group("group1")
	#print(str(arrG))
	for c in arrG:
		var arrM=c.get_meta()
		print(str(arrM))
		c.putar(2)
	


func _on_Button_3_pressed():
	pass

extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func aktif(z):
	
	z.set_z(1)
	var arrG=get_tree().get_nodes_in_group("gmbr")
	for o in arrG:
		if o!=z:
			
			o.set_z(-1)
			o.set_pickable(false)
			

func aktifkan():
	var arrG=get_tree().get_nodes_in_group("gmbr")
	for o in arrG:
		o.set_pickable(true)
	
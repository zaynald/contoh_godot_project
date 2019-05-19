extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	
	
func _process(delta):
	
	
	
	var ray=get_node("RayCast2D").is_colliding()
	if ray:
		var objname=get_collider() 
		var temp=objname.get_type()
		get_node("Label").set_text(str(temp))
	



extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var life_rays
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("sensor/RayCast2D").add_exception(self)
	life_rays = get_node("sensor").get_children()
	for ray in life_rays:
		ray.add_exception(self)
	
	set_fixed_process(true)
	
func _fixed_process(delta):
	#if (is_colliding() && get_collider()): # asli
	
	for ray in life_rays:
		if ray.is_colliding():
			var objname=ray.get_collider() 
			get_node("Label").set_text(str(objname))
			get_node("AnimationPlayer").play("getar")
			#return
			break
		else:
		#get_node("AnimationPlayer").stop()
			get_node("Label").set_text("no collide")

func is_enemy():
	get_node("Label").set_text("is enemy")
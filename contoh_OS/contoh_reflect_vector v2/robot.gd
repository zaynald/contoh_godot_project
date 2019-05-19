extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var SPEED = 100
var motion=Vector2(1,1)
var rotasi=0
var sud
var pos

onready var sensor = get_node("RayCast2D")
var posnew
var objnew=null
var normal=Vector2(0,0)
func _ready():
	
	# Called every time the node is added to the scene.
	# Initialization here
	#set_global_rotd(90)
	#get_node("SamplePlayer2D").play("musik",-2)
	#get_node("StreamPlayer").play(0)
	pos=get_pos()
	set_fixed_process(true)
	posnew = get_pos()
	
	


func _fixed_process(delta):
	#var gsud=get_parent().get_node("player/Sprite").get_global_rotd()
	#var sud=get_pos().angle_to_point(pos)
	#get_parent().get_node("enemy/Label").set_text(str(gsud))
	#get_parent().get_node("enemy/Label1").set_text(str(rad2deg(sud)))
	#sensor.set_cast_to(pos)
	var sudut =motion.angle_to_point(Vector2(0,0))
	get_node("Label").set_text(str(rad2deg(sudut)))
	set_rot(sudut)
	if sensor.is_colliding():
		#print("kena")
		var obj = sensor.get_collider()
		if obj.has_meta("target"):
			obj.queue_free()
		#if obj != objnew:
		var normal = sensor.get_collision_normal()
		#motion=Vector2(0,-1)
		relek(normal)
		objnew = obj
		#pos=posnew
	
		
	
	
	
		
		#get_node("Label").set_text(str(rotasi))
		
	
	
	
	
	

	pos += motion*delta*SPEED
	
	
	
	
	
	
	#print("motion :"+str(motion))
	
	set_pos(pos)#awal
	
		
func relek(x):
	
	motion= x.reflect(motion)
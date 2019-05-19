extends Area2D
#extends Area2D

# Member variables
const SPEED = 1000
var direction = Vector2(0, 1)
var hit = false
var ball_speed = 800
var ball_pos =Vector2()
var posmouse
var motion = Vector2()
var sud=deg2rad(90)
var v10=deg2rad(-10)
var sudut=0
var ray
var texturewarna
var warnaonshoot
var kena=false
var col
var kenawall=true

var temp
func _ready():
	
	col=get_node("saraf")
	ball_pos=get_pos()
	get_node("sprite").set_texture(texturewarna)
	Globals.set("runshot",self)
	add_to_group("shot")
	temp=sudut+sud
	set_process(true)



func _process(delta):
	#if (event.type == InputEvent.MOUSE_BUTTON && event.is_pressed()):
		#posmouse = get_global_mouse_pos()
		#look_at(posmouse)
	#set_rotd(300).rotated(sudut)

	
	
	
	motion= Vector2(-1,0)
	var s=temp
	motion = motion.rotated(sudut+sud)
	#ball_pos=get_pos()
	ball_pos  += motion*SPEED*delta
	#translate(ball_pos)
	set_pos(ball_pos)
	set_rot(s)
	var posbola=get_pos()
	if posbola.x>=460 or posbola.x<=30:
		#print(str(posbola))
		var x=rad2deg(sudut+sud)
		sud=0
		var a=x-180
		var y=180-(2*a)
		sudut=deg2rad(x+y)
		
		#print(str(rad2deg(temp)))
	#print(str(posbola))
	
	

	

func _hit_something():
	#if (hit):
		#return
	#hit = true
	pass
	#queue_free()
	#set_process(false) # matikan gerakan peluruh
	#get_node("anim").play("splash") #jalankan animasi meledak peluruhya


func _on_visibility_exit_screen():# hilangkan jika keluar dari screen
	queue_free()
	#get_tree().quit()




func _on_shot_area_enter( area ):
	if !kena:
		
		hide()
		remove_child(col)
		set_process(false)
		kena=true
		var dataplayer=area.getdata()
		var warna=dataplayer[1]
		var pos=dataplayer[0]
		#get_node("AnimationPlayer").play("shot")
		get_node("Timer").start()
		#
		if !(warna==warnaonshoot):
			if !hit:
				Globals.get("master").soundmusik1()
				Globals.get("main").bedaADD(pos,warnaonshoot)
				hit=true
				return
		
		else:
			
			Globals.get("master").soundmusik2()
		#queue_free()
		





func _on_Timer_timeout():
	queue_free()


func _on_shot_area_enter_shape( area_id, area, area_shape, self_shape ):
	pass # replace with function body





func _on_AnimationPlayer_finished():
	queue_free()

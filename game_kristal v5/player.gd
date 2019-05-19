extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var life_rays
var metaself
var namanode=Vector2()
var aktif=true

var tdksama=false

var getar=true

var namakristal #warna current instance
var warnaTexture
var pos=Vector2()
var n=0
var WarnaS #warna shoot
var golden=false

var col
var hit=true
func _ready():
	col =get_node("saraf")
	if namakristal=="gold":
		get_node("AnimationPlayer").set_speed(1)
		get_node("AnimationPlayer").play("golden")
		

	get_node("Sprite").set_texture(warnaTexture)
		#get_node("AnimationPlayer").stop()
			#get_node("Label").set_text("no collide "+str(pos))
func kill():
	get_parent().remove_from_group("kristal")
	get_parent().remove_from_group(namakristal)
	Globals.get("main").hit(pos,"kill")
	if namakristal=="gold":
			get_node("AnimationPlayer").stop()
			get_node("AnimationPlayer").set_speed(10)
	get_node("AnimationPlayer").play("getar")
	get_node("Timer").start()
	#get_node("StreamPlayer").play(0)
	
	
	

func getdata():
	var dataPosWarna=[pos,namakristal,tdksama]
	return dataPosWarna

func _on_Timer_timeout():
	
	#get_parent().get_node(".").arr_aktif[pos]=false #non aktifkan ke Dic
	#Globals.get("main").hit(pos)
	
	#set_fixed_process(false)
	get_parent().dead()



#func _on_player_area_enter_shape( area_id, area, area_shape, self_shape ):
	#ceksamakah()
	
func ceksamakah():
	if namakristal=="gold":
		if !golden:
			golden=true
			kill()
			var warnaR=Globals.get("main").randWarna()
			Globals.get("main").killkristalWarna(warnaR)
			Globals.get("main").golden=false
			Globals.get("main").posGoldbaru()
			
			return
			
	WarnaS=Globals.get("shoot").getWarnaS()
	
	if WarnaS==namakristal:
		
		if getar:
			
			Globals.get("main").hit(pos,WarnaS)
			get_node("AnimationPlayer").play("getar")
			get_node("Timer").start()
			getar=false











func _on_player_area_enter_shape( area_id, area, area_shape, self_shape ):
	ceksamakah()
	#if area.has_group("shot"):
		#get_node("AnimationPlayer").play("getar")


func _on_AnimationPlayer_finished():
	#var namget_current_animation()
	get_parent().dead()

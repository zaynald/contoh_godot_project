extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const SPEED = 200
var tembakp = false
var tembak = false
const SHOOT_INTERVAL = 0.5
var shoot_timeout = 0
var warna=["merah","hijau","biru","kuning","pink","orange","unggu"]

var ang
var warnaNow="merah"

var textureW
var warnaShoot
var onscreen=false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here

	var getTexture=get_parent().get_node(".").gettextureW(warnaNow)
	get_node("Spritez").set_texture(getTexture)
	Globals.set("shoot",self)
	set_fixed_process(true)
	#set_process_input(true)

func getWarnaS():
	return warnaShoot

#func warnablok():
	#warnaShoot="black"
	
func setwarnaS(n):
	warnaShoot=n


func acakwarna():
	randomize()
	
	var warna_idx=int(rand_range(0,7))
	return warna[warna_idx]
	
func setwarna():
	warnaNow=acakwarna()
	var getTexture=get_parent().get_node(".").gettextureW(warnaNow)
	get_node("Spritez").set_texture(getTexture)
	
	
func _on_musuh_input_event( viewport, ev, shape_idx ):
	#print(str(ev))
	#onscreen=false
	#get_node("Label").set_text(str(ev))
	if (ev.type==InputEvent.SCREEN_TOUCH ):
		
		var posm=ev.pos
		get_node("Spritez").look_at(posm)
		tembakp=true
		
		textureW=Globals.get("main").gettextureW(warnaNow)
	
	
	if (ev.type==InputEvent.MOUSE_MOTION ):
		#onscreen=true
		var posm=ev.pos
		get_node("Spritez").look_at(posm)
		#ang=get_rot()
		get_node("Label").set_text(str(onscreen))
		#ang=get_rot()
		#var sudutbatas=rad2deg(ang)+90
		#var sudutbatas=ev.pos
		
		#if sudutbatas<=180 or sudutbatas>=360:
			#set_rot(180)
		#look_at(posm)
	
func _fixed_process(delta):
	
		
	
	shoot_timeout -= delta
	ang=get_node("Spritez").get_rot()
	#var sudutbatas=rad2deg(ang)+90
	#get_node("Label").set_text(str(sudutbatas))
	#if sudutbatas<=180 or sudutbatas>=360:
		#tembakp=false

	if (tembakp):
		#get_node("Label").set_text(str(tembakp))
		tembakp=false
		if (shoot_timeout < 0):
			shoot_timeout = SHOOT_INTERVAL
			var shot = preload("res://shot.tscn").instance()
		# Use the Position2D as reference
			setwarnaS(warnaNow)
			shot.warnaonshoot=warnaNow
			shot.texturewarna=textureW
			shot.set_pos(get_node("Spritez/shootfrom").get_global_pos())
		# Put it two parents above, so it is not moved by us
			get_node("../..").add_child(shot)
			shot.sudut=ang
			shot.texturewarna=textureW
			setwarna()
	
func kena(warna):
	var metaname=get_meta("player")
	get_node("Label").set_text(str(metaname))
	get_node("Sprite").set_texture(warna)
	



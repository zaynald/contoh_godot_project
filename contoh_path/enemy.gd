extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const SPEED = 100
var offset 
var temp_offset
var posisiy

var gbr1 = preload("res://A.png")
var gbr2 = preload("res://B.png")
var gbr3 = preload("res://C.png")

var r


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	gantienemy()
	offset = get_pos().x
	temp_offset = offset
	rundom_xy()
	posisiy = get_pos().y
	set_fixed_process(true)

func _fixed_process(delta):
	offset -= delta*SPEED #awal
	set_pos(Vector2(offset,posisiy)) #awal
	if(offset<-40):
		#offset = 0
		rundom_xy()
		gantienemy()
		get_node("Label").set_text("no kena")

func rundom_xy():
		var rand = randi()% 3
		if rand==0:
			offset = 800+350#acak posisi awal mulai (posisi x)
			#x=100 # acak posisi x
		if rand==1:
			offset = 800+20
			#x=240
		if rand==2:
			offset = 800+500
			#x=340
	
func gantienemy():
	r = randi() % 3
	if(r ==0 ):
	   get_node("Sprite").set_texture(gbr1)
	   #get_node("Label").set_text("strawberry")
	   #jenissound=1
	if(r ==1 ):
	   get_node("Sprite").set_texture(gbr2)
	   #get_node("Label").set_text("Apel")
	   #jenissound=2
	if(r ==2 ):
	   get_node("Sprite").set_texture(gbr3)
	  #get_node("Label").set_text("Jeruk")
	   #jenissound=3


func hit():
	rundom_xy()
	gantienemy()
	get_node("Label").set_text("hitt")
	#get_parent().get_node("GUI/info/Label").set_text("tidak kena")

func targetnya(t):
	if (r==t):
		#get_parent().get_node("GUI").kena()# ok work
		get_parent().get_node("GUI/info/Label").set_text("sesuai target")
		get_parent().get_node("player/Navigation").randomtarget()
	else:
		#get_parent().get_node("GUI").salah()# ok work
		get_parent().get_node("GUI/info/Label").set_text("tidak esuai target")








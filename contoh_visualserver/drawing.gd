extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


var arrposdraw=[]

var tex
var warna=Color(0,1,0,1)
var v
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	Globals.set("draw",self)
	v =get_node("../Camera2D").get_viewport()
	print(str(v))
	
func gambar(w,posarr):
	warna=w
	
	arrposdraw=posarr
	update()

func _draw():
	
	#draw_texture(textur,Vector2(10,10),w)
	for x in arrposdraw:
		draw_texture(tex,x,warna)

extends CanvasModulate

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var kotak=Rect2(0,0,20,20)
	var c=Color(0.1,0.5,0.5,1)
	voiddraw_rect(kotak, c )

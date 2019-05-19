extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var bit_screen_dic={Vector2(1,1):true,Vector2(2,1):true,
                    Vector2(1,2):true,Vector2(2,2):true,
                    Vector2(1,3):true,Vector2(2,3):true}

var bit_screen_dictemp={Vector2(1,1):false,Vector2(2,1):false,
                    Vector2(1,2):false,Vector2(2,2):false,
                    Vector2(1,3):false,Vector2(2,3):false}


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var baris_y=4
	var baris_y2 = 4
	var val=true
	print(str(bit_screen_dic))
	
	for y in range(1,4):
		baris_y -=1
		for x in range(1,3):
			
			val = bit_screen_dic[Vector2(x,baris_y)] and val
			#print(str(Vector2(x,baris_y)))
		if !val:
			baris_y2 -=1
			for x in range(1,3):
				bit_screen_dictemp[Vector2(x,baris_y2)]=bit_screen_dic[Vector2(x,baris_y)]
				
	
	print(str(bit_screen_dictemp))
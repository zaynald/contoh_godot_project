extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var x
var y
var posgw
const s=32
export(String, "a", "b", "c","d") var abjad
export(Texture) var image
export(int) var idx

var nameOBJ
var klik=false
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#nameOBJ=get_node("Sprite").get_owner()
	#print(str(nameOBJ))
	nameOBJ=get_node("Sprite").get_parent()
	#print(str(nameOBJ))
	
	get_node("Sprite").set_frame(idx)
	set_process_input(false)

func _input_event(x,event,d):
	var c=event.is_pressed()
	if klik==false:
		#set_z(10)
		#get_node("Label").set_text(str(get_z()))
		get_parent().aktif(nameOBJ)
		klik=true
	if (event.type==InputEvent.MOUSE_MOTION ):
		#event.type==InputEvent.MOUSE_MOTION #ok work
		if Input.is_mouse_button_pressed(1): #ok work
			#event=make_input_local(event)
			#if overlaps_area(
			#posgw=event.pos
			#posgw.x=posgw.x+s
			#posgw.y=posgw.y+s
			posgw=get_pos()
			if posgw.x>=1024-64:
				set_pos(posgw-Vector2(2,0))
				return
			if posgw.x<=64:
				set_pos(posgw-Vector2(-2,0))
				return
			var posrel=event.relative_pos
			posgw=posgw+posrel
			#event=make_input_local(event)
			
			#get_node("Label").set_text(str(posrel))
			set_pos(posgw)
			var objover=get_overlapping_areas()
			for o in objover:
				print(str(o.abjad))
				print(" abjda :"+str(abjad))
				if o.abjad==abjad:
					set_pickable(false)
					print(str(o.abjad))
					var postmpnya=o.get_pos()
					set_pos(postmpnya)

func _input(event):
	if (event.type==InputEvent.MOUSE_BUTTON):
	   #get_node("Label").set_text("klik ok")
		#if event.pressed: 		 
		#
		
		var y = event.pos.y  #ok work
		var x = event.pos.x  #ok work
		#get_node("Label").set_text(str(x))
		#if Input.is_mouse_button_pressed(1):
			
	   #get_node("Area2D").set_pos(lokasi(x,y))
		var xx=Input.get_mouse_mode()
		get_node("Label").set_text(str(x))
	
	
	
func lokasi(row, col):
	return Vector2(col, row)
	      
	        
	       
		#event = make_input_local(event)
		#get_node("Label").set_text(str(event.pos))
	    #if (event.button_index == BUTTON_LEFT and event.pressed):
		    #get_node("Label").set_text("klik ok")
		    #var tekan = true
		 
	    #elif (event.button_index == BUTTON_LEFT and not event.pressed):
		    #var tekan =  false
		
		
func _mouse_exit():
	#set_z(0)
	klik=false
	get_parent().aktifkan()
	#get_node("Label").set_text("keluar mouse")
	
		
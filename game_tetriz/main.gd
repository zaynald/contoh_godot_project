extends Node2D
var bit = {Vector2(1,1):false}
var bit_bentuk ={}
var bit_dic={1:[1,1,1,
                0,1,0,
                0,1,0],
3:[1,0,
   1,1],
2:[0,1,0,
   0,1,0,
   0,1,0],
4:[0,1,0,
   1,1,0,
   0,1,0],
5:[1,1,1,
   0,0,1,
   0,0,0],
6:[1,1,
   1,1],
7:[1,1,0,
   0,1,1,
   0,0,0]}
var bit_screen=[]
var bit_screen_dic={}
var bit_screen_dictemp={}
var bitvisual = load("res://bitvisual.tscn")
var lineinfo = load("res://infoline.tscn")
var pauseon = preload("res://img/puase_onblue.png")
var pauseoff = preload("res://img/puase_offblue.png")

var scoreval=0
var pos_bit=Vector2(240,40)
var bit_now={}
var bit_next=1
var level=1
var level10=0
var line_terget=[]
var pres=false
var bitcount

var child_obj
func _ready():
	update_screen(false)
	level=master.level
	
	if level==10:
		level=0
		level10 +=1
		get_node("levelval10").show()
		get_node("levelval10").set_text(str(level10))
	scoreval=master.score
	set_level(level+level10*10)
	get_node("score").set_text(str(scoreval))
	get_node("levelval").set_text(str(level))
	update_screen(false)
	bit_now=get_rand_bit()
	update_bit(bit_now,"posbit/bit")
	draw_bit(pos_bit,bit_now,"")
	set_process_input(true)

func addbit(pos,bit):
	var uk=size_bit(bit)
	var pos_bitxy=pos/40
	pos_bitxy.y -=2
	pos_bitxy.x -=1
	for y in range(1,uk):
		for x in range(1,uk):
			if bit[Vector2(x,y)]:
				bit_screen_dic[Vector2(pos_bitxy.x+x,pos_bitxy.y+y)]=true
	update_screen(false)
	line_bit()
	#get_node("eftime").start()
	#yield(get_node("eftime"),"timeout")
	#clear_screen(true)
	update_screen(false)
	bit_now=get_rand_bit()
	pos_bit=Vector2(240,40)
	update_bit(bit_now,"posbit/bit")
	draw_bit(pos_bit,bit_now,"")
func line_bit():
	var pos=Vector2(0,0)
	var line_ef=[]
	var baris_y = 23
	var baris_y2 = 23
	var val=true
	for y in range(1,23):
		val=true
		baris_y -=1
		for x in range(1,14):
			val = bit_screen_dic[Vector2(x,baris_y)] and val
		if val:
			scoreval +=1
			master.score=scoreval
			if level < 5 && scoreval==10: # jika sulit level naik
				master.level +=1
				master.score=0
				get_tree().reload_current_scene()
				break
			if level >= 5 && scoreval==10: # bonus target erase
				scoreval=0
				line_terget.pop_front()
			get_node("score").set_text(str(scoreval))
			if line_terget.has(baris_y):
				
				line_terget.erase(baris_y)
			if line_terget.empty():
				master.level +=1
				
				print("level")
				get_tree().reload_current_scene()
				break
				
			line_ef.append(baris_y)
			showline()
		else:
			baris_y2 -= 1
			for x in range(1,14):
				bit_screen_dictemp[Vector2(x,baris_y2)]=bit_screen_dic[Vector2(x,baris_y)]
	
	
	#for y in line_ef: # effeck
		#for x in range(0,17):
			#var obj_bit = bitvisual.instance()
			#obj_bit.set_pos(Vector2(pos.x+(x*40),pos.y+(y*40)))
			#obj_bit.get_node("ColorFrame").hide()
			#get_node("efek").add_child(obj_bit)
	for y in range(1,23):
		for x in range(1,14):
			bit_screen_dic[Vector2(x,y)]=bit_screen_dictemp[Vector2(x,y)]
func showline():
	var c = line_terget.size()
	line_terget.clear()
	var max_y = 22
	for x in range(c):
		line_terget.append(max_y)
		max_y -=1
	get_node("Timer line").start()
	for y in line_terget:
		var obj_line = lineinfo.instance()
		obj_line.set_pos(Vector2(0,y*40))
		get_node("line").add_child(obj_line)
func _on_Timer_line_timeout():
	var child_obj = get_node("line").get_children()
	for obj in child_obj:
		obj.queue_free()
func update_screen(f):
	clear_screen(f)
	var pos=Vector2(0,0)
	if bit_screen_dic.size()==0:
		for y in range(1,23): # layar aktif
			for x in range(1,14):
				bit_screen_dic[Vector2(x,y)]=false
				bit_screen_dictemp[Vector2(x,y)]=false
		for x in range(0,15): #base bit
			bit_screen_dic[Vector2(x,23)]=true
		for y in range(1,24): #left and right
			bit_screen_dic[Vector2(0,y)]=true
			bit_screen_dic[Vector2(14,y)]=true
	else:
		for y in range(1,23):
			for x in range(1,14):
				bit_screen_dictemp[Vector2(x,y)]=false
				if bit_screen_dic[Vector2(x,y)]:
					var obj_bit = bitvisual.instance()
					obj_bit.set_pos(Vector2(pos.x+(x*40),pos.y+(y*40)))
					get_node("Posscreen").add_child(obj_bit)
					
func set_level(l):
	
	var ypos=23-l
	for y in range(ypos,23):
		line_terget.append(y)
		for x in range(1,14):
			randomize()
			var val = int(rand_range(0,4))
			if val==0:
				bit_screen_dic[Vector2(x,y)]=false
			else:
				bit_screen_dic[Vector2(x,y)]=true
	#showline()
func get_rand_bit():
	randomize()
	var bit_no = int(rand_range(1,8))
	#bit_no=1 # tes
	var bit_arr_now=bit_data(bit_dic[bit_next])
	var bit_arr_next=bit_data(bit_dic[bit_no])
	bit_next=bit_no
	
	update_bit(bit_arr_next,"bitnext")
	return bit_arr_now
func bit_data(bit):
	var bit_temp={}
	var uk=size_bit(bit)
	var no=0
	for y in range(1,uk):
		for x in range(1,uk):
			if bit[no]==1:
				bit_temp[Vector2(x,y)]=true
			else:
				bit_temp[Vector2(x,y)]=false
			no +=1
	return bit_temp
	
func size_bit(bit):
	var s=bit.size()
	var uk
	if s==9:
		uk=4
	else:
		uk=3
	return uk
func hit_leftright(pos,databit,lr):
	var pos_bitxy=pos/40
	var uk=size_bit(databit)
	var hit=false
	for y in range(1,uk):
		for x in range(1,uk):
			var isi =databit[Vector2(x,y)]
			if lr=="left" && isi && (bit_screen_dic[Vector2(pos_bitxy.x+x-1,pos_bitxy.y+y-1)]):
				pos_bit.x =pos.x+40
				hit=true
				break
			if lr=="right" && isi && (bit_screen_dic[Vector2(pos_bitxy.x+x-1,pos_bitxy.y+y-1)]):
				pos_bit.x =pos.x-40
				hit=true
				break
	return hit
func hit_base(pos,databit):
	var pos_bitxy=pos/40
	var uk=size_bit(databit)
	var hit=false
	for y in range(1,uk):
		for x in range(1,uk):
			var isi =databit[Vector2(x,y)]
			if isi && bit_screen_dic[Vector2(pos_bitxy.x+x-1,pos_bitxy.y+y-1)]:
				hit=true
				if pos_bitxy.y==1 && hit:
					print("restart")
					get_tree().reload_current_scene()
				break
			
	return hit
func draw_bit(pos,databit,lr):
	if (lr=="left" or lr=="right") && hit_leftright(pos,databit,lr):
		return
	if hit_base(pos,databit):
		pos_bit = Vector2(240,40)
		addbit(pos,databit)
		return
	get_node("posbit/bit").set_pos(pos)
func update_bit(d_databit,p):
	hide_bit(p)
	var uk = size_bit(d_databit)
	for y in range(1,uk):
		for x in range(1,uk):
			var isi =d_databit[Vector2(x,y)]
			if isi:
				get_node(p+"/"+str(x)+str(y)).show()
func rotright_bit(bit):
	if pos_bit.x==0:
		pos_bit.x=40
	elif pos_bit.x==480:
		pos_bit.x=440
	#var posbit=pos_bit/20
	#if bit_screen_dic[posbit] or bit_screen_dic[Vector2(posbit.x+2,posbit.y)]:
		#print("ada")
		#return bit
	var uk=size_bit(bit)
	var temp_bit={}
	for x in range(1,uk):
		for y in range(1,uk):
			var isi =bit[Vector2(x,uk-y)]
			temp_bit[Vector2(y,x)]=isi
	return temp_bit
func hide_bit(lok):
	var child_obj = get_node(lok).get_children()
	for obj in child_obj:
		obj.hide()
func clear_screen(ef):
	if ef:
		var child_obj2 = get_node("efek").get_children()
		for obj in child_obj2:
			obj.queue_free()
	else:
		var child_obj = get_node("Posscreen").get_children()
		for obj2 in child_obj:
			obj2.queue_free()
func _input(event):
	if event.is_action_pressed("ui_left"):
		_on_LEFT_pressed()
	if event.is_action_pressed("ui_right"):
		_on_RIGHT_pressed()
	if event.is_action_pressed("ui_select"):
		_on_OK_pressed()
	if event.is_action_pressed("ui_down"):
		pres=true
	if event.is_action_released("ui_down"):
		pres=false
	if pres:
		get_node("Timer").start()
		_on_Timer_timeout()
func _on_Timer_timeout():
	pos_bit= Vector2(pos_bit.x,pos_bit.y+40)
	draw_bit(pos_bit,bit_now,"down")

func _on_RIGHT_pressed():
	pos_bit= Vector2(pos_bit.x+40,pos_bit.y)
	draw_bit(pos_bit,bit_now,"right")


func _on_LEFT_pressed():
	pos_bit= Vector2(pos_bit.x-40,pos_bit.y)
	draw_bit(pos_bit,bit_now,"left")


func _on_DOWN_pressed():
	pres=true


func _on_DOWN_released():
	pres=false


func _on_OK_pressed():
	var b = rotright_bit(bit_now)
	update_bit(b,"posbit/bit")
	draw_bit(pos_bit,b,"rot")
	bit_now=b


func _on_pause_pressed():
	pass # replace with function body


func _on_TextureButton_toggled( pressed ):
	set_pause(pressed)
	if pressed:
		
		get_node("button/TextureButton").set_normal_texture(pauseon)
		get_node("pause").show()
		
	else:
		
		get_node("pause").hide()
		get_node("button/TextureButton").set_normal_texture(pauseoff)

func set_pause(f):
	get_tree().set_pause(f)


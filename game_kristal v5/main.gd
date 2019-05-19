extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var kena=false
var posmusuh=Vector2()

var arrayPOS={}
const SPEED = 200
var is_enable = true
var musuh
var rot=0

var posGold=3

var xposhigh=4
var xpos=4
var ypos=4
var beda=false

var golden=false

var lama=3
var warna=["merah","hijau","biru","kuning","pink","orange","unggu"]

var textureW={"merah":load("res://merah.png"),
		"biru":load("res://biru.png"),
		"hijau":load("res://hijau.png"),
		"kuning":load("res://kuning.png"),
		"pink":load("res://pink.png"),
		"orange":load("res://orange.png"),
		"unggu":load("res://unggu.png"),
		"gold":load("res://golden.png")
		}

var arrGold=[]

var arr_warna={}

var arr_aktif={}

func isipos():
	for x in range(1,xpos+1):
		for y in range(1,ypos+1):
			arrGold.append(Vector2(x,y))

func buatDicWarnaNaktif():
	
	var tempW={}
	var tempA={}
	for x in range(1,xpos+1):
		for y in range(1,ypos+1):
			tempW[Vector2(x,y)]="merah"
			tempA[Vector2(x,y)]=false
			#print(str(x)+" ,"+str(y))
			
	for y in range(1,ypos+1): # isi baris pertama nilai true/aktif
		
		tempA.erase(Vector2(1,y))
		tempW.erase(Vector2(1,y))
		# 7 warna
		tempW[Vector2(1,y)]=randWarna()
		tempA[Vector2(1,y)]=true
		

		
	arr_warna=tempW #isi array arr_warna
	arr_aktif=tempA
	
func randWarna(): #index warna random
	randomize()
	var warna_idx=int(rand_range(0,7)) 
	
	return warna[warna_idx]
	
func kosongmoving():
	for y in range(1,ypos+1):
		moving(xpos,y)

func moving(xp,yp):
	var xtemp=1
	var x_max=xp+1
	var arrwarnaT={}
	var arraktifTemp={}

	for i in range(1,x_max):
		
		if arr_aktif[Vector2(i,yp)]:
			arrwarnaT[Vector2(xtemp,yp)]=arr_warna[Vector2(i,yp)]
			arraktifTemp[Vector2(xtemp,yp)]=arr_aktif[Vector2(i,yp)]
			arr_aktif.erase(Vector2(i,yp)) #hapus isinya
			arr_aktif[Vector2(i,yp)]=false # isi degn false
			xtemp+=1
	
	
	#print(str(arraktifTemp))
	
	#var s=arraktifTemp.size()
	var x=1
	for i in arraktifTemp.keys():
		#print(str(arraktifTemp[i]))
		arr_warna.erase(Vector2(x,yp))
		arr_aktif.erase(Vector2(x,yp))
		arr_warna[Vector2(x,yp)]=arrwarnaT[Vector2(x,yp)]
		arr_aktif[Vector2(x,yp)]=arraktifTemp[Vector2(x,yp)]
		
		x+=1
		
func size(x=4,y=4): #set ukuran kristal
	xpos=x
	ypos=y
	
	
func _ready():
	
	size(10,8)
	isipos()# for golden pos
	isiposarray()
	buatDicWarnaNaktif()
	
	get_node("Timer").start()
	Globals.set("main",self)
	# Called every time the node is added to the scene.
	# Initialization here
	#var musuh  = get_node("musuh")
	#Globals.set("pos",1)
	posmusuh=get_node("musuh").get_pos()
	
	
	
	set_process(true)
	#set_process_input(true)
	set_fixed_process(false)
	


	show_aktif()
	
func gettextureW(w):
	return textureW[w]

func bedaADD(pos,w):
	if pos.x==xpos-1:
		kalah()
		return
		
	#beda=true
	for x in range(pos.x+1,xpos+1,1):
		if !arr_aktif[Vector2(x,pos.y)]:
			arr_aktif.erase(Vector2(x,pos.y))
			arr_aktif[Vector2(x,pos.y)]=true
			arr_warna.erase(Vector2(x,pos.y))
			arr_warna[Vector2(x,pos.y)]=w
			show_aktif()
			#Globals.get("shoot").warnablok()
			
			break
		
	
func bedaWarna():
	return beda
	
	
func hit(pos,w):
	#print("awal"+str(arr_aktif[pos]))
	#print("awal"+setr(arr_aktif[pos]))
	beda=false
	if !(w=="kill"):
		Globals.get("score").sccorehit(w)
	arr_aktif.erase(pos)
	arr_aktif[pos]=false
	lama=3
	get_node("Timer 2").start()
	#print("akhir"+str(arr_aktif[pos]))

func _on_Timer_2_timeout():
	
	lama-=1
	if lama==0:
		kosongmoving()
		
		show_aktif()
		get_node("Timer 2").stop()
	#print(str(lama))

func killkristalWarna(w):#bonus kelipantan 3
	Globals.get("master").soundmusik3()
	var arrG=get_tree().get_nodes_in_group(w)	
	for n in arrG:
		n.get_node("player").kill()
	
	
func barisBaru():
		
	#hapus baris TERATAS
	
	for y in range(1,ypos+1):# baris akhir
	
		if arr_aktif[Vector2(xpos-posGold,y)]:
			if !golden:
				golden=true
				arr_warna.erase(Vector2(xpos-posGold,y))
				arr_warna[Vector2(xpos-posGold,y)]="gold"
				
			
			
		if arr_aktif[Vector2(xpos,y)]:
			kalah() # jika penuh atau ada kristal sudah di ttitik terbawah
			
		arr_warna.erase(Vector2(xpos,y)) #xpos teratas
		arr_aktif.erase(Vector2(xpos,y))
		
	for x in range(xpos,1,-1):
		for y in range(1,ypos+1):
			arr_warna[Vector2(x,y)]=arr_warna[Vector2(x-1,y)]
			arr_warna.erase(Vector2(x-1,y)) # erase bari td
			arr_aktif[Vector2(x,y)]=arr_aktif[Vector2(x-1,y)]
			arr_aktif.erase(Vector2(x-1,y))
	
	#print(str(arr_aktif))
	#pindahkan baris 1 ke baris 2
	#var nx=xpos  # awal var nx=4
	#for x in range(2,xpos+1):
		#for y in range(1,ypos+1):
			#arr_warna[Vector2(nx,y)]=arr_warna[Vector2(nx-1,y)]
		#	#arr_warna.erase(Vector2(nx-1,y))
			#arr_aktif[Vector2(nx,y)]=arr_aktif[Vector2(nx-1,y)]
			#arr_aktif.erase(Vector2(nx-1,y))
				
		#nx-=1
	# new line fill with true value
	for i in range(1,ypos+1):
		#randomize()
		arr_warna.erase(Vector2(1,i))
		#var warna_idx=int(rand_range(0,7)) # 0,1,2,3,4,5,6
		arr_warna[Vector2(1,i)]=randWarna()
		#arr_warna[Vector2(1,i)]="merah"
		arr_aktif[Vector2(1,i)]=true
			
	#get_node("RichTextLabel").clear()
	#get_node("RichTextLabel").add_text(str(arr_warna))
	#get_node("RichTextLabel").add_text(str(arr_aktif))

func killallKristal(): #hapus semua kristal
	var arrG=get_tree().get_nodes_in_group("kristal")
	for n in arrG:
		n.queue_free()
		
func posGoldbaru():
	randomize()
	var p=int(rand_range(1,xpos-1)) 
	posGold=p
	



func isiposarray(): # isi array posisi kristal
	
	var posXY=get_node("pos").get_pos()
	var y_kolomNew=0
	
	var x_baris=posXY.x
	var y_kolom=posXY.y
	#awal
	
	#var x_baris=96
	#var y_kolom=274
	
	var pos=Vector2()
	for x in range(1,xpos+1):
		x_baris=posXY.x
		for y in range(1,ypos+1):
			if y%2==0: #genap
				y_kolomNew=y_kolom-29
			if y%2==1:
				y_kolomNew=y_kolom
			pos=Vector2(x_baris,y_kolomNew)
			arrayPOS[Vector2(x,y)]=pos
			
			x_baris +=50
		y_kolom+=58
	 #buat array warna delete jika buat experiment
	
	
	

func show_aktif(): #tampilkan kristal sesuai data posisi, warna, status
	
	killallKristal()
	var pos=Vector2()
	#print(str(arr_aktif))
	for x in range(1,xpos+1):
	
		for y in range(1,ypos+1):
			var pos
			pos=arrayPOS[Vector2(x,y)]
			#print(str(arr_aktif))
				
			var aktifkah=arr_aktif[Vector2(x,y)]
			var po_xy=Vector2(x,y)

			if aktifkah:
				var warnaN=arr_warna[Vector2(x,y)]
				ShowKristal(pos,warnaN,po_xy)

func ShowKristal(pos,warnaN,posXY):
	
	var kristal = preload("res://player.tscn").instance()
				#kristal.set_pos(player.get_pos()) #versi lama
	kristal.set_pos(pos)
	kristal.add_to_group(warnaN,false)
	kristal.add_to_group("kristal",false)
	kristal.get_node("player").pos=posXY
				
			
				
	#kristal.add_to_group(warnaN,false)
	kristal.get_node("player").set_meta("meta",warnaN)
				#if warnaN==null:
					#warnaN="merah"
	kristal.get_node("player").namakristal=warnaN
	kristal.get_node("player").warnaTexture=textureW[warnaN]
	#kristal.get_node("player").pos=Vector2(x,y)
	get_node("pos").add_child(kristal)









	


func _on_Timer_timeout():
	barisBaru()
	show_aktif()

func setpause(f):
	get_tree().set_pause(f)



func kalah(): # you lose fill all with kristall
	get_node("Timer 4").start()
	get_node("Timer").stop()

func _on_Timer_4_timeout():
	drawKristal()

func drawKristal(): #begin lose... mulai tampilkan kristal penuh bertahap..
	for x in range(1,xpos+1):
		for y in range(1,ypos+1):
			if !arr_aktif[Vector2(x,y)]:
				
				#randomize()
				var pos_xy=Vector2(x,y)
				#var warna_Idx=int(rand_range(0,7))
				var warna_Str=randWarna()
				
				arr_aktif.erase(Vector2(x,y))
				arr_aktif[Vector2(x,y)]=true
				var pos=arrayPOS[Vector2(x,y)]
				ShowKristal(pos,warna_Str,pos_xy)
				if x==xpos && y==ypos:
					get_node("Timer 3").start()
					get_node("Timer 4").stop()# begin lose
				return
			elif (x==xpos && y==ypos):
				get_node("Timer 3").start()
				get_node("Timer 4").stop()
			
		
			
func _on_Timer_3_timeout(): # mulai game baru
	get_node("Timer 3").stop()
	get_node("menu").playmenu()
	







extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var huruf =["A","A","B","B","C","C","D","D","E","E","F","F","G","G","H","H",
"I","I","J","J"]
var lok=["A","A","B","B","C","C","D","D","E","E","F","F","G","G","H","H",
"I","I","J","J"]

var ke
var di

var klik=0

var sama=false



var gbr_tanya = preload("res://tanya.png")

var gbr_lok1 
var gbr_lok2
var gbr_lok3
var gbr_lok4
var gbr_lok5
var gbr_lok6
var gbr_lok7
var gbr_lok8
var gbr_lok9
var gbr_lok10
var gbr_lok11
var gbr_lok12
var gbr_lok13
var gbr_lok14
var gbr_lok15
var gbr_lok16
var gbr_lok17
var gbr_lok18
var gbr_lok19
var gbr_lok20

var gbr_lok=[]

var gbr1
var gbr2

var pos1
var pos2
var imgpos1
var imgpos2

var openimg=0

var winhit=0 #hitung yg sudah sama
var win=10  # empat image


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	di =huruf.size()
	ke=di
	
	var apa =get_node("/root/master").jenis
	if (apa=="alam"):
		ganti()
		
	
	acak()
	gbr_lok.resize(0)# hapus isi data seblumny
	
	for i in range (1,21):
		gbr_lok.push_back(load("res://"+lok[i-1]+".png"))
		
	Globals.get("waktu").mulaigame()

func ganti():
	
	# isi array dgn : ["a1",....]
	var idz=0
	for i in range(di/2):
		for z in range(2):
			gantikan_array(idz,"a"+str(i+1))
			idz +=1
	


func acak():
	
	for i in range(di):
		
		var isi = bacaarray(ke)
		#print(i)
		#print(isi)
		#lok.push_back(isi) # sekali doang
		lok.remove(i) # remove dulu
		lok.insert(i,isi) # ok work
		ke -=1
		#print(lok[i])
	
	
func gantikan_array(indx,akhir):
	huruf.remove(indx)
	huruf.insert(indx,akhir)

func bacaarray(x):
	randomize()
	var nilai = int(rand_range(0,x))
	var hasil =huruf[nilai]
	#print(hasil)
	huruf.remove(nilai)
	return hasil
	
	

func cek(img1,img2):
	if(img1==img2):
		return true 
	else:
		return false
	

	
func klik(idx_image,img):
	
	openimg +=1
	#get_node("Label 2").set_text("klik : "+str(openimg))
	if openimg==1:
		get_node("soundef").play("click")
		pos1=idx_image
		imgpos1=img
		get_node("box/lok"+str(pos1)).set_normal_texture(imgpos1)
	
	if openimg==2:
		get_node("soundef").play("click")
		if(idx_image==pos1): #jika diklik di posisi yg sama
			openimg=1
			return
		pos2=idx_image
		imgpos2=img
		
		get_node("box/lok"+str(pos2)).set_normal_texture(imgpos2)
		if cek(str(imgpos1),str(imgpos2)):
			
			#signalblok jika sudah sama
			get_node("box/lok"+str(pos2)).set_block_signals(true)
			get_node("box/lok"+str(pos1)).set_block_signals(true)
			
			# bisa play sound jika sama
			openimg=0
			winhit +=1
			get_node("Label").set_text(str(winhit))
			if(winhit==win): # jika sudah semua sama
				get_node("Label").set_text("YOUU WIN!!!") #bisa soundplay
				#get_node("win").show()
				Globals.get("waktu").stopgame()
				get_tree().change_scene("res://winner.tscn")
			return
		get_node("Label").set_text("ops.. wrong!!")
		get_node("Timer").start()
			
	if openimg==3:
		balikangbr() # if user quick respon no need time again
		get_node("Label").set_text("only two clik!!")

func _on_lok1_button_down():
	var id_img1 = 1
	var img_data = gbr_lok[0]
	klik(id_img1,img_data)
	
func _on_lok2_button_down():
	var id_img1 = 2
	var img_data = gbr_lok[1]
	klik(id_img1,img_data)

func _on_lok3_pressed():
	var id_img1 = 3
	var img_data = gbr_lok[2]
	klik(id_img1,img_data)

func _on_lok4_pressed():
	var id_img1 = 4
	var img_data = gbr_lok[3]
	klik(id_img1,img_data)

func _on_lok5_button_down():
	var id_img1 = 5
	var img_data = gbr_lok[4]
	klik(id_img1,img_data)

func _on_lok6_pressed():
	var id_img1 = 6
	var img_data = gbr_lok[5]
	klik(id_img1,img_data)

func _on_lok7_pressed():
	var id_img1 = 7
	var img_data = gbr_lok[6]
	klik(id_img1,img_data)

func _on_lok8_pressed():
	var id_img1 = 8
	var img_data = gbr_lok[7]
	klik(id_img1,img_data)
	
func _on_lok9_pressed():
	var id_img1 = 9
	var img_data = gbr_lok[8]
	klik(id_img1,img_data)
	
func _on_lok10_pressed():
	var id_img1 = 10
	var img_data = gbr_lok[9]
	klik(id_img1,img_data)

func _on_lok11_pressed():
	var id_img1 = 11
	var img_data = gbr_lok[10]
	klik(id_img1,img_data)
	
func _on_lok12_pressed():
	var id_img1 = 12
	var img_data = gbr_lok[11]
	klik(id_img1,img_data)
	
func _on_lok13_pressed():
	var id_img1 = 13
	var img_data = gbr_lok[12]
	klik(id_img1,img_data)
	
func _on_lok14_pressed():
	var id_img1 = 14
	var img_data = gbr_lok[13]
	klik(id_img1,img_data)
	
func _on_lok15_pressed():
	var id_img1 = 15
	var img_data = gbr_lok[14]
	klik(id_img1,img_data)
	
func _on_lok16_pressed():
	var id_img1 = 16
	var img_data = gbr_lok[15]
	klik(id_img1,img_data)
	
func _on_lok17_pressed():
	var id_img1 = 17
	var img_data = gbr_lok[16]
	klik(id_img1,img_data)
	
func _on_lok18_pressed():
	var id_img1 = 18
	var img_data = gbr_lok[17]
	klik(id_img1,img_data)
	
func _on_lok19_pressed():
	var id_img1 = 19
	var img_data = gbr_lok[18]
	klik(id_img1,img_data)
	
func _on_lok20_pressed():
	var id_img1 = 20
	var img_data = gbr_lok[19]
	klik(id_img1,img_data)
	



func _on_Timer_timeout():
	balikangbr()
	
func balikangbr():
	get_node("Label").set_text("")
	get_node("box/lok"+str(pos1)).set_normal_texture(gbr_tanya)
	get_node("box/lok"+str(pos2)).set_normal_texture(gbr_tanya)
	get_node("Timer").stop()
	openimg=0
	
func _on_restart_pressed():
	get_node("AnimationPlayer").play("fade")
	get_tree().reload_current_scene()
	
func _on_TextureButton_pressed():
	get_tree().change_scene("res://menu/Menu.tscn")

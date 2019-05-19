extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var tgl={}

var winnerA=[]

var ukuran=0
var nilaibaru=0
var namabaru="user"

var newskor=0

var tempstring=""

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	#baca file dan masuk ke array
	
	
	winnerA=get_node("/root/master").tempfileA
	nilaibaru=get_node("/root/master").newskor
	
	get_node("ItemList").set_size(Vector2(350,200))
	get_node("ItemList").set_max_columns(2)
	get_node("ItemList").set_fixed_column_width(150)
	ukuran()
	listwinner()
	Globals.set("listwinner",self)
	masukanskor()
	
	
	
func msuk(t):
	tempstring=t
	

func ukuran():
	ukuran=winnerA.size()
	
func listwinner():
	ukuran()
	#get_node("text").clear()# bersihkan dulu supaya tidak bertumpuk
	get_node("ItemList").clear()
	var no=0
	get_node("ItemList").add_item("no       nama")
	get_node("ItemList").add_item("         skor")
	# mulai isi dari awal
	if ukuran==1:
		return
	for i in range(0,ukuran,2):
		no +=1
		var temp =str(no)+".  "+str(winnerA[i])
		var temp2 =str(winnerA[i+1])

		get_node("ItemList").add_item(temp)
		get_node("ItemList").add_item(temp2)
func update_list():
	ukuran()
	
	if ukuran==0:
		winnerA.insert(0,nilaibaru)
		winnerA.insert(0,namabaru)
		listwinner()
		return
		
	var a=-1
	
	for i in range(ukuran/2):
		a +=2
	
		if nilaibaru<=int(winnerA[a]):
			winnerA.insert(a-1,namabaru)
			winnerA.insert(a,nilaibaru)
			listwinner()
			return
			
		if nilaibaru>int(winnerA[a]):
			
			if (ukuran/2)==(i+1):# jika sudah di akhir list
				winnerA.push_back(namabaru)
				winnerA.push_back(nilaibaru)
				listwinner()
				return
				
			elif nilaibaru<int(winnerA[a+2]):
				
				winnerA.insert(a+1,namabaru)
				winnerA.insert(a+2,nilaibaru)
				listwinner()
				return
	 #update ukuran setelah input
	listwinner() # updata list show
	




func masukanskor():
	
	
	#isi data di dialog data
	tgl=OS.get_datetime(false)
	var namatmp="Player_"+str(tgl["day"])+"."+str(tgl["month"])+"."+str(tgl["year"])+"."+str(tgl["hour"])+"."+str(tgl["minute"])
	get_node("AcceptDialog 2/Label 3").set_text(str(nilaibaru))
	get_node("AcceptDialog 2/LineEdit").set_text(namatmp)
	
	
	if ukuran>=20:
		var TwinnerA=int(winnerA[19])
		get_node("Label").set_text("ukuran :in 20"+str(ukuran))
		if (nilaibaru<TwinnerA):#jika nilaibaru lebih kecil 
			#cek dan masukan
			
			
			get_node("AcceptDialog 2").show()# input nama dan cek nilainya itu untuk di input 
			# hapus 2 array terkahir sehingga list nama tetap 10 user
			winnerA.remove(19)
			winnerA.remove(18)
			listwinner()
			
		elif (nilaibaru>=TwinnerA):#jika nilai lebih besar tidak di input dan list tetap
			
			return
	if ukuran<19:# jika list masih kurang dari 10 user. input dan proses store ke array
		get_node("AcceptDialog 2").show()
		
	

func _on_save_pressed():
	get_node("AcceptDialog").show()
	
func _on_AcceptDialog_confirmed():
	get_node("/root/master").masukanS(winnerA,ukuran)
	get_node("AcceptDialog").hide()


func _on_AcceptDialog_2_confirmed():
	get_node("AcceptDialog 2").hide()
	namabaru=get_node("AcceptDialog 2/LineEdit").get_text()
	update_list()


func _on_Button_pressed():
	get_node("WindowDialog").hide()
	winnerA.resize(0)
	listwinner()
	get_node("/root/master").resetfile()


func _on_Buttonreset_pressed():
	get_node("WindowDialog").show()


func _on_Button1_pressed():
	get_node("WindowDialog").hide()


func _on_TextureButton_2_pressed():
	get_tree().change_scene("res://winner.tscn")

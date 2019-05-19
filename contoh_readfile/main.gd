extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var jenis="alam"
var pertama=true # logo only one show up
var nama="user"
var winner
var winner2=[]

var nilainya=[]
var cc={}
var ukuran
var data32=[]
var data16

var fileidx=0

var datast

var file

var arrdec=[]
var arrmat=[]

onready var tex =get_node("RichTextLabel")

func _ready():
	var data=[]
	var ar =RawArray(data)
	ar.append(34) # awal ["]
	
	var d ="points"
	
	for t in "points":
		
		var code = t.ord_at(0)
		ar.append(code)
	

	var p = ar.get_string_from_ascii()
	var arrayfile = ["2.1491","3.15174"]
	var textnew=p
	var pertama= true
	for x in arrayfile:
		
		if pertama:
			pertama=false
			textnew = textnew+" "+x
		else:
			textnew = textnew+", "+x
	
	
	
	print(textnew)
	
	
	# Called every time the node is added to the scene.
	# Initialization here
	
	
		
func game_over():
	
	var f = File.new()
	f.open("res://highscore", File.WRITE)
	f.store_string(winner)
	close()


func _on_Button_2_pressed():
	winner ="cinta|cinta|sayang"
	game_over()


func _on_Button_pressed():
	#cc =get_node("/root/main").winner
	var nilainya
	nilainya=winner.right(2) # ok work baca mulai dari posisi 2
	
	#print(str(nilainya))
	for i in range(ukuran):
		nilainya=winner2[i]
		print(str(nilainya))
		
		
func baca(nmfile):
	
	arrmat.clear()
	var fmat = File.new()
	if (fmat.open("res://kotakwmat.mtl", File.READ) == OK):
		while !fmat.eof_reached():
			var matdata = fmat.get_8()
			
			var mat = RawArray([matdata])
			
			arrmat.append(matdata)
			
	
	arrdec.clear()
	var f = File.new()
	if (f.open("res://"+nmfile, File.READ) == OK):
		#var xdx1 = f.get_8()
		#var xdx2 = f.get_8()
		
		while !f.eof_reached():
		
		
		#for i in range(1000):
			var dx1 = f.get_8()
			var x = RawArray([dx1])
			
			#if "v"==x.get_string_from_utf8():
				#tex.newline()
			
			#tex.append_bbcode(str(x.get_string_from_utf8()))
			if str(dx1)=="13":
				tex.newline()
				
			else:
				#tex.append_bbcode(str(dx1)) # mentah
				tex.append_bbcode(str(x.get_string_from_utf8()))
			
			arrdec.append(dx1)
			#var t
		#var strin = arrdec.get_string_from_ascii()
	#nama file baru berurutan sesuai nama file awal
	fileidx +=1
	var nm=str(fileidx)+".obj"
	var nmfilenew=nmfile.replace(".obj",nm)
		#print(str(x.get_string_from_utf8()))
		
		
		
	var fsave = File.new()
	fsave.open("res://kotakwmat_copyall.obj", File.READ_WRITE) # oven file
	
	var c="mtllib kotakwmat01.mtl"  #add kode
	var t=c.to_utf8()
	
	for k in t:
		fsave.store_8(k)
	
	fsave.store_8(13) # enter code
	
	var c2="usemtl Material.001" #add kode
	var t2=c2.to_utf8()
	
	for k in t2:
		fsave.store_8(k)
	
	fsave.store_8(13)


	#store new data
	for x in arrdec:
		fsave.store_8(x)
	
	fsave.close()
	
	var matbefore
	
	var fsavemat = File.new()
	fsavemat.open("res://kotakwmat01.mtl", File.WRITE)
	
	for k in arrmat:
		
		if (matbefore==92 && k==35):
			var c=nmfile.replace(".obj",".jpg")
			
			var t=c.to_utf8()
	
			for k in t:
				fsavemat.store_8(k)
				#print("posisi")
				#print(fmat.get_pos())
			fsavemat.store_8(13)
			break
		
		else:
			fsavemat.store_8(k)
			matbefore = k
	
	
	
	
func _on_Button_3_pressed():
	get_node("FileDialog").show()
	#for i in range(ukuran):
		#datast=data32[i].get_string_from_utf8()
		#get_node("RichTextLabel").append_bbcode(str(winner ))
	
	
	


func _on_FileDialog_confirmed():
	var namafile = get_node("FileDialog").get_current_file()
	
	print(namafile.replace(".obj",""))
	baca(namafile)

extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(int) var number
export(bool) var done
export(int, "Warrior", "Magician", "Thief") var character_class
export(String, "Rebecca", "Mary", "Leah") var character_name
export(String, FILE) var file
export(String, FILE, "*.txt") var file2
export(String, MULTILINE) var text
export(int, 20) var i
export(int, -10, 20) var j
export(float, -10, 20, 0.2) var k
export(float, EXP, 100, 1000, 20) var l
export(Color, RGB) var warna
export(Color, RGBA) var warna2
export(NodePath) var node
export(int, FLAGS) var spell_elements = ELEMENT_WIND | ELEMENT_WATER
export(int, FLAGS, "Fire", "Water", "Earth", "Wind") var spell_elements = 0
export var a=[1,2,3]
export var b=[1,2,3]

# Allow integer value

var arai1=[["id","nama","NIK","alamat"],
			["s0001","Shinta",8756774,"jln. Raya Ciledug"],
			["s0002","Sany",42342342,"jln. Raya Joglo"]]


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var data=[]
	var isi
	isi=arai1[0]
	get_node("ItemList").add_item("isi array:  "+str(isi))
	isi=arai1[1]
	get_node("ItemList").add_item("isi array1:  "+str(isi))
	isi=arai1[2]
	get_node("ItemList").add_item("isi array2:  "+str(isi))
	
	
	get_node("RichTextLabel").set_bbcode(str(arai1))
	
	# ubah array ke string
	var stringdata
	stringdata=String(arai1)
	get_node("ItemList").add_item("isi stringdata:  "+stringdata)
	
	#ubah string ke array lagi  GAGAL 
	var araibaru=[]
	araibaru=stringdata.to_ascii()
	
	
	isi=araibaru[0]
	get_node("ItemList").add_item("isi arraybaru:  "+str(isi))
	isi=araibaru[1]
	get_node("ItemList").add_item("isi arraybaru1:  "+str(isi))
	isi=araibaru[2]
	get_node("ItemList").add_item("isi arraybaru2:  "+str(isi))

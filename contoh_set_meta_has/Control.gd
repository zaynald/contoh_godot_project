extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var vek1=Vector2(1,5)
var vek2=Vector2(10,30)
var kata="cinta,akhirat,Allah"
var arraykata=[]

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	get_node("ItemList").set_size(Vector2(350,200))
	get_node("ItemList").set_max_columns(1)
	get_node("ItemList").set_fixed_column_width(300)
	
	var temp=0
	
	temp=vek1.angle_to(vek2)
	get_node("ItemList").add_item("angle_to= "+str(temp))
	
	temp=vek2.length()
	get_node("ItemList").add_item("length= "+str(temp))
	
	temp=vek1.distance_to(Vector2(10,30))
	get_node("ItemList").add_item("distance_to= "+str(temp))
	
	temp=vek2.reflect(vek2)
	
	get_node("ItemList").add_item("reflect= "+str(temp))
	get_node("ItemList").add_item("vector= "+str(vek2))
	
	temp=vek2.slide(Vector2(0.001,0))
	get_node("ItemList").add_item("slide= "+str(temp))
	
	temp=vek2.rotated(deg2rad(90))
	get_node("ItemList").add_item("rotated 90 = "+str(temp))
	
	temp=vek2.normalized()
	get_node("ItemList").add_item("normalized = "+str(temp))
	
	
	#string menjadi banyak
	arraykata=kata.split(",",true )
	get_node("ItemList").add_item("split = "+str(arraykata))
	get_node("ItemList").add_item("kata idex 0 = "+str(arraykata[0]))
	
	#kata.split_floats  harus int misal "1,3.4,10" maka array isinya [1,3.4,10]
	#
	var kata="65"
	temp=kata.to_int()
	get_node("ItemList").add_item("to_int = "+str(temp))
	var kata="kkjhkj"
	temp=kata.md5_text()
	get_node("ItemList").add_item("md5_text = "+str(temp))
	
	temp=get_node("sayang").get_type()
	get_node("ItemList").add_item("get_type objeck = "+str(temp))
	
	#set meta
	set_meta("cinta",767)
	set_meta("cinta2","isi meta2")
	
	temp=get_meta("cinta2")
	get_node("ItemList").add_item("lihat value get_meta objeck = "+str(temp))
	
	temp=has_meta("cinta")
	get_node("ItemList").add_item("has_meta cinta objeck = "+str(temp))
	
	temp=has_method("contoh_method")
	get_node("ItemList").add_item("has_method objeck= "+str(temp))
	
	#set property
	set("zia",6565)
	set("zia2","isi property 2")
	
	#lihat isi property "zia2" error kosong hasilnya
	temp=get("zia")
	get_node("ItemList").add_item("get data property objeck= "+str(temp))
	
	
	var temparray1=[]
	temparray1=get_method_list() #ok work
	temparray1=get_meta_list()
	get_node("ItemList").add_item("get_meta_list objeck= "+str(temparray1))
	
	add_user_signal("lari",[1,2,3])
	
	temp=has_user_signal("lari2") #hasilnya false keculi "lari"
	get_node("ItemList").add_item("has_user_signal objeck= "+str(temp))
	
	#temp=get_node("Node2D").call("hitung",2,2) # ok work
	temp=get_node("Node2D").hitung(2,2) # work kayak di atas
	get_node("ItemList").add_item("call objeck= "+str(temp))
	
	
	
func contoh_method():
	pass

func hitung2():
	return "cinta"

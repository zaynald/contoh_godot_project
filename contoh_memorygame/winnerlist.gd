extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var namauser="user"


func _ready():
	get_node("newuser").set_text(namauser)
	Globals.set("winner",self)
	listname()

func listname():
	
	var tempnama
	var temptime
	
	tempnama=get_node("/root/master").winner_array[0]
	temptime =get_node("/root/master").winner_array[1]
	get_node("Label").set_text(str(tempnama)+" :"+str(temptime))
	
	tempnama=get_node("/root/master").winner_array[2]
	temptime =get_node("/root/master").winner_array[3]
	get_node("Label1").set_text(str(tempnama)+" :"+str(temptime))
	
	tempnama=get_node("/root/master").winner_array[4]
	temptime =get_node("/root/master").winner_array[5]
	get_node("Label2").set_text(str(tempnama)+" :"+str(temptime))
	
	tempnama=get_node("/root/master").winner_array[6]
	temptime =get_node("/root/master").winner_array[7]
	get_node("Label3").set_text(str(tempnama)+" :"+str(temptime))

func _on_TextEdit_mouse_exit():
	
	namauser = get_node("TextEdit").get_text()
	Globals.get("waktu").pemain=namauser

func newwinner(data):
	get_node("newuser").set_text(data)
	
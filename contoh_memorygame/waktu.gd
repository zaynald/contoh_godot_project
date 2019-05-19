extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var waktu={}
var detik=0
var menit=0
var jam=0
var pemain="user1"

var totaltime=0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	Globals.set("waktu",self)


func _on_Timer_timeout():
	totaltime +=1
	detik +=1
	get_node("time").set_text(str(jam)+" :"+str(menit)+" :"+str(detik))
	if detik==60:
		menit +=1
		detik=0
		get_node("time").set_text(str(jam)+" :"+str(menit)+" :"+str(detik))
		
	if menit==60:
		jam +=1
		menit=0
		
func mulaigame():
	get_node("Timer").start()
	
func stopgame():
	var temp
	temp="|"+pemain+"|"+str(jam)+":"+str(menit)+":"+str(detik)
	#get_node("/root/master").simpan_skor(temp)
	var skor
	skor=str(jam)+":"+str(menit)+":"+str(detik)
	#Globals.get("winner").newwinner(skor)
	get_node("/root/master").newskor=totaltime
	get_node("Timer").stop()
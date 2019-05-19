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


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	var f = File.new()
	if (f.open("res://highscore", File.READ) == OK):
		
		winner = f.get_as_text()
		#winner2 =f.seek(3) #not work
		#winner2 =f.get_line() # sama kayak f.get_as_text()
		winner2 =f.get_csv_line(",")
		
func game_over():
	
	var f = File.new()
	f.open("res://highscore", File.WRITE)
	f.store_string(winner)
	f.close()


func _on_Button_2_pressed():
	winner ="cinta, cinta,sayang"
	game_over()


func _on_Button_pressed():
	#cc =get_node("/root/main").winner
	var nilainya
	nilainya=winner
	
	print(str(nilainya))
	
	nilainya=winner2[2]
	print(str(nilainya))
		
		

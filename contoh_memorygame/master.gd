extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var jenis="abjad"
var pertama=true # logo only one show up

var newskor=0 #tes

var tempfileS=""
var tempfileA=[]
var sizeA=0



func _ready():
	baca()
	
func simpan():
	var f = File.new()
	f.open("user://highscore", File.WRITE)
	f.store_string(tempfileS)
	
func baca():
	var f = File.new()
	if (f.open("user://highscore", File.READ) == OK):
		tempfileA = f.get_csv_line("|")
		tempfileS = f.get_as_text()
	var temp=tempfileA.size()
	if temp==1:
		tempfileA.resize(0)

func stopmusik():
	get_node("StreamPlayer").stop()
	
func playmusik():
	get_node("StreamPlayer").play()
	
func masukanS(listA,s):
	tempfileS=""
	tempfileA=listA # pindahkan sementara
	for i in range(s):# convert array to string csv
		if (s==i+1):
			tempfileS +=str(tempfileA[i])
		else:
			tempfileS +=str(tempfileA[i])+"|"
	simpan() # save to file
	
func resetfile():
	tempfileS=""
	tempfileA.resize(0)
	simpan()
	
	
	
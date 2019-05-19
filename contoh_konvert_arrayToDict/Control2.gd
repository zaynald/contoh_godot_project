extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var data1={
		"zainal":["zainal",5623521,"l","jakarta"],
		"wini":["wini",1442142,"p","java"]
		}
		
var dataFILE=[]
var data2={}

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var datakey=data1.keys()
	var dat=""
	for i in data1.keys():
		var datavalue=data1[i]
		dat=dat+"|"+str(i)+"|"+str(datavalue)
		get_node("RichTextLabel").add_text(str(datavalue))
		get_node("RichTextLabel").newline()
	
	dat=dat.right(1)
	get_node("RichTextLabel").add_text(str(datakey))
	get_node("RichTextLabel").newline()
	get_node("RichTextLabel").add_text(dat)
	get_node("RichTextLabel").newline()
	
	var js=data1.to_json()
	get_node("RichTextLabel").add_text(js)

	
	var stringfile=str(data1)
	save(dat,"datatemp")
	
func save(datasekolahSV,filen):
	
	var f = File.new()
	f.open("res://"+filen, File.WRITE)
	f.store_string(datasekolahSV)
	close()
	



func _on_Button_pressed():
	dataFILE=openF("datatemp")
	
	get_node("RichTextLabel").newline()
	get_node("RichTextLabel").add_text(str(dataFILE))
	
	konvertTOdict()
	
	get_node("RichTextLabel").newline()
	get_node("RichTextLabel").add_text(str(data2))
	
	#baca hasil dic baru
	get_node("RichTextLabel").newline()
	get_node("RichTextLabel").add_text("kunci "+str(data2.keys()))
	get_node("RichTextLabel").newline()
	get_node("RichTextLabel").add_text("nilai "+str(data2.values()))
	
	var ar=[]
	
	ar=data2["zainal"]
	get_node("RichTextLabel").newline()
	get_node("RichTextLabel").add_text("nama "+str(ar[0]))


	

func openF(nFILE):
	var datasiswaFILE=[]
	var f = File.new()
	if (f.open("res://"+nFILE, File.READ) == OK):
		datasiswaFILE=f.get_csv_line("|")
	return datasiswaFILE
	
	
# cara konvert array ke dic
func konvertTOdict():
	var temp=dataFILE.size()/2
	var idx=0
	for i in range(temp) :
		var stringar=dataFILE[idx+1]
		stringar=stringar.replacen("[","")
		stringar=stringar.replacen("]","")
		var arrstring=stringar.split(",",true)
		data2[str(dataFILE[idx])]=arrstring
		idx+=2
		
	
	
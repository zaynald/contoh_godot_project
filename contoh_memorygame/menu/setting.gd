extends Node2D

# class member variables go here, for example:



func _ready():
	var j=get_node("/root/master").jenis
	if (j=="alam"):
		get_node("CheckBox 2").set_pressed(true)
		get_node("CheckBox 3").set_pressed(false)
	else:
		get_node("CheckBox 2").set_pressed(false)
		get_node("CheckBox 3").set_pressed(true)


func _on_CheckBox_toggled( pressed ):
	if pressed:
		get_node("/root/sound").playmusik()
	else:
		get_node("/root/sound").stopmusik()


func _on_CheckBox_2_toggled( pressed ):
	if pressed:
		get_node("/root/master").jenis="alam"
		get_node("CheckBox 3").set_pressed(false)
	else:
		get_node("/root/master").jenis="abjad"
		get_node("CheckBox 3").set_pressed(true)


func _on_CheckBox_3_toggled( pressed ):
	if pressed:
		#get_node("Label").set_text("cek")
		get_node("CheckBox 2").set_pressed(false)
		get_node("/root/master").jenis="abjad"
	else:
		#get_node("Label").set_text("unklik")
		get_node("CheckBox 2").set_pressed(true)
		get_node("/root/master").jenis="alam"

func _on_TextureButton_2_pressed():
	Globals.get("menu").closesetting()

extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("ItemList").set_size(Vector2(300,200))
	get_node("ItemList").set_max_columns(2)
	get_node("ItemList").set_fixed_column_width(100)

	
	#get_node("ItemList").select(1)
	get_node("ItemList").add_item("Nama Host")
	var temp =OS.get_name()
	get_node("ItemList").add_item(temp)
	get_node("ItemList").
	
	get_node("ItemList").add_item("Nama model hp")
	var temp=OS.get_model_name()
	get_node("ItemList").add_item(temp)
	
	get_node("ItemList").add_item("jumlah core")
	var temp=OS.get_processor_count()
	get_node("ItemList").add_item(str(temp))
	
	get_node("ItemList").add_item("jumlah dpi")
	var temp=OS.get_screen_dpi()
	get_node("ItemList").add_item(str(temp))
	
	get_node("ItemList").add_item("screen_orientation")
	var temp=OS.get_screen_orientation() 
	get_node("ItemList").add_item(str(temp))
	
	
	get_node("ItemList").add_item("screen_size")
	var temp=OS.get_screen_size()
	get_node("ItemList").add_item(str(temp))
	
	
	get_node("ItemList").add_item("memory_usage")
	var temp=OS.get_static_memory_usage()
	get_node("ItemList").add_item(str(temp))
	
	# only work on android
	get_node("ItemList").add_item("get_unique_ID")
	var temp=OS.get_unique_ID()
	get_node("ItemList").add_item(str(temp))
	
	OS.set_window_title("tes doang")
	#OS.alert("nyoba alert","warning")


func _on_StaticBody2D_mouse_enter():
	get_node("Label").set_text("over")

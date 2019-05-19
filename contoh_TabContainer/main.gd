extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("ItemList").set_size(Vector2(350,200))
	get_node("ItemList").set_max_columns(1)
	get_node("ItemList").set_fixed_column_width(300)
	
	var temp=0
	
	temp=OS.get_name()
	get_node("ItemList").add_item("get_name= "+str(temp))
	
	
	temp=OS.get_process_ID()
	get_node("ItemList").add_item("get_process_ID= "+str(temp))
	
	temp=OS.get_processor_count()
	get_node("ItemList").add_item("get_processor_count= "+str(temp))
	
	temp=OS.get_screen_dpi(0)
	get_node("ItemList").add_item("get_screen_dpi= "+str(temp))
	
	
	temp=OS.get_screen_orientation()
	get_node("ItemList").add_item("get_screen_orientation= "+str(temp))
	
	temp=OS.get_screen_size()
	get_node("ItemList").add_item("get_screen_size= "+str(temp))

	OS.set_window_title("Godot experiment")
	
	
	get_node("TabContainer").set_current_tab(1)

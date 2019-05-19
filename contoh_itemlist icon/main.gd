extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var gbr=get_node("Sprite").get_texture()
	for i in range(38):
		get_node("ItemList").add_item("")
		
	get_node("ItemList").set_size(Vector2(580,650))
	get_node("ItemList").set_max_columns(6)
	get_node("ItemList").set_fixed_column_width(90)
	get_node("ItemList").set_fixed_icon_size(Vector2(100,100))
	for i in range(6):
		#get_node("ItemList").add_item(str(i))
		get_node("ItemList").set_item_icon(i,gbr)
	for i in range(6,29,6):
		get_node("ItemList").set_item_icon(i,gbr)
	for i in range(11,30,6):
		get_node("ItemList").set_item_icon(i,gbr)
	for i in range(30,36):
		get_node("ItemList").set_item_icon(i,gbr)
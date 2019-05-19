extends ItemList

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_size(Vector2(350,200))
	set_max_columns(1)
	set_fixed_column_width(300)

extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Button_pressed():
	get_viewport().queue_screen_capture()
	# Let two frames pass to make sure the screen was captured
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	# Retrieve the captured image
	var img =get_viewport().get_screen_capture()
	# Create a texture for it
	var tex = ImageTexture.new()
	
	tex.create_from_image(img)
	var image=tex.get_data()
	# Set it to the capture node
	image.save_png("res://hasil.png")
	get_node("TextureFrame 2").set_texture(tex)

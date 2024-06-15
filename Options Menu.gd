extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	
	# Make the options menu title say Options Menu
	$"Options Menu Title".text = "Options Menu"
	
	# Align both the vertical and horizontal alignments of the options menu text at the center of the text box
	$"Options Menu Title".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Options Menu Title".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Set the options menu title text size to x = 1 and y = 50
	$"Options Menu Title".size = Vector2(100, 50)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

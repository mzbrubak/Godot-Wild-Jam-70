extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	
	# Make the credits menu title text say Credits
	$"Credits Menu Title".text = "Credits"
	
	# Align both the vertical and horizontal alignments of the credits menu title text at the center of the text box
	$"Credits Menu Title".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Credits Menu Title".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Set the credits menu title text size to x = 100 and y = 50
	$"Credits Menu Title".size = Vector2(100, 50)
	
	# Initialize the back button to say Back
	$"Back Button/Back Text".text = "Back"
	
	# Initialize the back button size here
	$"Back Button".size = Vector2(107, 50)
	
	# ALign both the vertical and horizontal alignments of the back text at the center of the text box
	$"Back Button/Back Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Back Button/Back Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Set the back button text size to x = 107 and y = 55
	$"Back Button/Back Text".size = Vector2(107, 55)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func IfBackButtonIsPressed():
	#pass # Replace with function body.
	
	# Go back to the main menu
	get_tree().change_scene_to_file("res://Main Menu.tscn")

extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	
	# Make the options menu title say Options Menu
	$"Options Menu Title".text = "Options Menu"
	
	# Align both the vertical and horizontal alignments of the options menu text at the center of the text box
	$"Options Menu Title".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Options Menu Title".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Set the options menu title text size to x = 100 and y = 50
	$"Options Menu Title".size = Vector2(100, 50)
	
	# Initialize the back button to say Back
	$"Back Button/Back Text".text = "Back"
	
	# Initialize the back button size here
	$"Back Button".size = Vector2(107, 50)
	
	# ALign both the vertical and horizontal alignments of the back text at the center of the text box
	$"Back Button/Back Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Back Button/Back Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Set the back button text size to x = 107 and y = 55
	$"Back Button/Back Text".size = Vector2(107, 55)
	
	# Initialize the resolution drop down color and menu here
	$"Resolution Drop Down Color".size = Vector2(107, 50)
	$"Resolution Drop Down Menu".size = Vector2(100, 50)
	
	# Add the resolution settings below for the player to pick the window resolution
	$"Resolution Drop Down Menu".add_item("1920x1080")
	$"Resolution Drop Down Menu".add_item("1600x900")
	$"Resolution Drop Down Menu".add_item("1360x768")
	$"Resolution Drop Down Menu".add_item("1280x960")
	$"Resolution Drop Down Menu".add_item("1024x768")
	$"Resolution Drop Down Menu".add_item("800x600")
	
	# Make the drop down color yellow for now
	$"Resolution Drop Down Color".color = Color(1.0, 1.0, 0.0, 1.0)
	
	# Make the resolution text node say Resolution
	$"Resolution Text".text = "Resolution"
	
	$"Resolution Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Resolution Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	
	# Initialize the fullscreen text size here
	$"Resolution Text".size = Vector2(100, 50)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func IfBackButtonIsPressed():
	#pass # Replace with function body.
	
	# Go back to the main menu when the player presses the back button
	get_tree().change_scene_to_file("res://Main Menu.tscn")


func IfResolutionDropDownMenuIsModified(index):
	#pass # Replace with function body.
	
	# Store the current resolution index as a variable to check which dropdown option the player selected
	var currentResolution = index
	
	# If the first current resolution is selected, use the window size of 1920x1080
	if currentResolution == 0:
		DisplayServer.window_set_size(Vector2i(1920, 1080))
	
	# If the second current resolution is selected, use the window size of 1600x900
	if currentResolution == 1:
		DisplayServer.window_set_size(Vector2i(1600, 900))
	
	# If the third current resolution is selected, use the window size of 1360x768
	if currentResolution == 2:
		DisplayServer.window_set_size(Vector2i(1360, 768))
	
	# If the fourth current resolution is selected, use the window size of 1280x960
	if currentResolution == 3:
		DisplayServer.window_set_size(Vector2i(1280, 960))
	
	# If the fifth current resolution is selected, use the window size of 1024x768
	if currentResolution == 4:
		DisplayServer.window_set_size(Vector2i(1024, 768))
	
	# If the sixth current resolution is selected, use the window size of 800x600
	if currentResolution == 5:
		DisplayServer.window_set_size(Vector2i(800, 600))


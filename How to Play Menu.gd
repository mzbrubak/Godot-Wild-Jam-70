extends Node

# Set the font to whatever we want inside the inspector
@export var howToPlayMenuFont : Font

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	
	# Make the how to play title text say How to Play
	$"How to Play Title".text = "How to Play"
	
	# Align both the vertical and horizontal alignments of the how to play menu text at the center of the text box
	$"How to Play Title".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"How to Play Title".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the how to play title add theme font override to use the font we set in the inspector
	$"How to Play Title".add_theme_font_override("font", howToPlayMenuFont)
	
	# Use the how to play title add theme font size override to set the font size to 50
	$"How to Play Title".add_theme_font_size_override("font_size", 50)
	
	# Set the how to play menu title text size to x = 100 and y = 50
	$"How to Play Title".size = Vector2(100, 50)
	
	# Initialize the back button to say Back
	$"Back Button/Back Text".text = "Back"
	
	# Initialize the back button size here
	$"Back Button".size = Vector2(107, 50)
	
	# ALign both the vertical and horizontal alignments of the back text at the center of the text box
	$"Back Button/Back Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Back Button/Back Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the how to play button text to add theme font override to use the font we set in the inspector
	$"Back Button/Back Text".add_theme_font_override("font", howToPlayMenuFont)
	
	# Use the how to play button text to add theme font size override to set the font size to 30
	$"Back Button/Back Text".add_theme_font_size_override("font_size", 30)
	
	# Set the back button text size to x = 107 and y = 60
	$"Back Button/Back Text".size = Vector2(107, 60)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func IfBackButtonIsPressed():
	#pass # Replace with function body.
	
	# Go back to the main menu
	get_tree().change_scene_to_file("res://Main Menu.tscn")

extends Control

# Get the character base script to call pause menu inside this script
@onready var characterBase = $"../"

# Set the font inside the inspector
@export var pauseMenuFont : Font

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	
	# Set the pause menu title text to say Game Paused
	$"Pause Menu Title".text = "Game Paused"
	
	$"Pause Menu Title".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Pause Menu Title".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the pause menu add theme font override to use the font we set in the inspector
	$"Pause Menu Title".add_theme_font_override("font", pauseMenuFont)
	
	# Use the pause menu add theme font size override to set the font size to 50
	$"Pause Menu Title".add_theme_font_size_override("font_size", 50)
	
	# Initialize the resume button text to say Resume
	$"Resume Button/Resume Button Text".text = "Resume"
	
	# Initialize the resume button size here
	$"Resume Button/Resume Button Text".size = Vector2(107, 60)
	
	# Set the resume button to scale twice as large than normal
	$"Resume Button".scale = Vector2(2, 2)
	
	# ALign both the vertical and horizontal alignments of the resume button text at the center of the text box
	$"Resume Button/Resume Button Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Resume Button/Resume Button Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the resume button text to add theme font override to use the font we set in the inspector
	$"Resume Button/Resume Button Text".add_theme_font_override("font", pauseMenuFont)
	
	# Use the resume button text to add theme color override to set the font color to black
	$"Resume Button/Resume Button Text".add_theme_color_override("font_color", Color(0, 0, 0, 1))
	
	# Use the resume button text to add theme font size override to set the font size to 20
	$"Resume Button/Resume Button Text".add_theme_font_size_override("font_size", 20)
	
	# Initialize the restart day button text to say Restart Day
	$"Restart Day Button/Restart Day Button Text".text = "Restart Day"
	
	# Initialize the restart day button size here
	$"Restart Day Button/Restart Day Button Text".size = Vector2(107, 60)
	
	# Set the restart day button to scale twice as large than normal
	$"Restart Day Button".scale = Vector2(2, 2)
	
	# ALign both the vertical and horizontal alignments of the restart day button text at the center of the text box
	$"Restart Day Button/Restart Day Button Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Restart Day Button/Restart Day Button Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the restart day button text to add theme font override to use the font we set in the inspector
	$"Restart Day Button/Restart Day Button Text".add_theme_font_override("font", pauseMenuFont)
	
	# Use the restart day button text to add theme color override to set the font color to black
	$"Restart Day Button/Restart Day Button Text".add_theme_color_override("font_color", Color(0, 0, 0, 1))
	
	# Use the restart day button text to add theme font size override to set the font size to 14
	$"Restart Day Button/Restart Day Button Text".add_theme_font_size_override("font_size", 14)
	
	# Initialize the quit button text to say Quit
	$"Quit Button/Quit Button Text".text = "Quit"
	
	# Initialize the quit button size here
	$"Quit Button/Quit Button Text".size = Vector2(107, 60)
	
	# Set the quit button to scale twice as large than normal
	$"Quit Button".scale = Vector2(2, 2)
	
	# ALign both the vertical and horizontal alignments of the quit button text at the center of the text box
	$"Quit Button/Quit Button Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Quit Button/Quit Button Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the quit button text to add theme font override to use the font we set in the inspector
	$"Quit Button/Quit Button Text".add_theme_font_override("font", pauseMenuFont)
	
	# Use the quit button text to add theme color override to set the font color to black
	$"Quit Button/Quit Button Text".add_theme_color_override("font_color", Color(0, 0, 0, 1))
	
	# Use the quit button text to add theme font size override to set the font size to 20
	$"Quit Button/Quit Button Text".add_theme_font_size_override("font_size", 20)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func IfResumeButtonIsPressed():
	#pass # Replace with function body.
	
	# Resume the game
	characterBase.pauseMenu()


func IfQuitButtonIsPressed():
	#pass # Replace with function body.
	
	# Go back to the main menu
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")



func IfRestartDayButtonIsPressed():
	#pass # Replace with function body.
	
	# Restart at the current scene
	get_tree().reload_current_scene()
	
	# This line of code fixes the bug of the player not being able to move after the game restarts
	# Only way to move the player around again is to pause and resume each time
	# This way, the player can move around after reloading the current scene without having to pause and resume
	characterBase.pauseMenu()

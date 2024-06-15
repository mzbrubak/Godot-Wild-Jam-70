extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	
	# Initialize the main menu title text to say Main Menu for now
	$"Main Menu Title".text = "Main Menu"
	
	# Align both the vertical and horizontal alignments of the main menu text at the center of the text box
	$"Main Menu Title".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Main Menu Title".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Set the Main Menu title text size to x = 100 and y = 50
	$"Main Menu Title".size = Vector2(100, 50)
	
	# Initialize the play button to say Play
	$"Play Button/Play Button Text".text = "Play"
	
	# Initialize the Play button size here
	$"Play Button/Play Button Text".size = Vector2(107, 55)
	
	# ALign both the vertical and horizontal alignments of the play text at the center of the text box
	$"Play Button/Play Button Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Play Button/Play Button Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Set the play button text size to x = 107 and y = 55
	$"Play Button".size = Vector2(107, 50)
	
	# Initialize the options button to say Options
	$"How to Play Button/How to Play Text".text = "How to Play"
	
	# Initialize the How to Play button size here
	$"How to Play Button/How to Play Text".size = Vector2(107, 55)
	
	# ALign both the vertical and horizontal alignments of the play text at the center of the text box
	$"How to Play Button/How to Play Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"How to Play Button/How to Play Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Set the How to Play button text size to x = 107 and y = 55
	$"How to Play Button".size = Vector2(107, 50)
	
	# Initialize the options button to say Options
	$"Options Button/Options Text".text = "Options"
	
	# Initialize the options button size here
	$"Options Button".size = Vector2(107, 50)
	
	# ALign both the vertical and horizontal alignments of the options text at the center of the text box
	$"Options Button/Options Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Options Button/Options Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Set the options button text size to x = 107 and y = 55
	$"Options Button/Options Text".size = Vector2(107, 55)
	
	# Initialize the credits button to say Credits
	$"Credits Button/Credits Text".text = "Credits"
	
	# Initialize the credits button size here
	$"Credits Button".size = Vector2(107, 50)
	
	# ALign both the vertical and horizontal alignments of the credits text at the center of the text box
	$"Credits Button/Credits Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Credits Button/Credits Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Set the credits button text size to x = 107 and y = 55
	$"Credits Button/Credits Text".size = Vector2(107, 55)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func IfOptionsButtonIsPressed():
	#pass # Replace with function body.
	
	# Go to the options menu if the player presses the options button inside the main menu
	get_tree().change_scene_to_file("res://Options Menu.tscn")


func IfHowToPlayButtonIsPressed():
	#pass # Replace with function body.
	
	# Go to the how to play menu if the player presses the how to play button inside the main menu
	get_tree().change_scene_to_file("res://How to Play Menu.tscn")


func IfCreditsButtonIsPressed():
	#pass # Replace with function body.
	
	# Go to the credits menu if the player presses the credits button inside the main menu
	get_tree().change_scene_to_file("res://Credits Menu.tscn")

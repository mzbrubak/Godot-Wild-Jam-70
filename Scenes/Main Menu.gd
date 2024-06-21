extends Node

# Set the font to whatever we want inside the inspector
@export var mainMenuFont : Font

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	
	if MainMenuMusic.playing == false:
		MainMenuMusic.play()
	
	if MainMenuMusic.playing == true:
		MainMenuMusic.volume_db = MusicVolume.musicVolume - 80
	
	# Set the window mode to windowed at start
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
	# Initialize the main menu title text to say Main Menu for now
	$"Main Menu Title".text = "Main Menu"
	
	# Align both the vertical and horizontal alignments of the main menu text at the center of the text box
	$"Main Menu Title".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Main Menu Title".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the main menu add theme font override to use the font we set in the inspector
	$"Main Menu Title".add_theme_font_override("font", mainMenuFont)
	
	# Use the main menu add theme font size override to set the font size to 50
	$"Main Menu Title".add_theme_font_size_override("font_size", 50)
	
	# Set the Main Menu title text size to x = 100 and y = 50
	$"Main Menu Title".size = Vector2(100, 50)
	
	# Initialize the play button to say Play
	$"Play Button/Play Button Text".text = "Play"
	
	# Initialize the Play button size here
	$"Play Button/Play Button Text".size = Vector2(107, 60)
	
	# ALign both the vertical and horizontal alignments of the play text at the center of the text box
	$"Play Button/Play Button Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Play Button/Play Button Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the play button text to add theme font override to use the font we set in the inspector
	$"Play Button/Play Button Text".add_theme_font_override("font", mainMenuFont)
	
	# Use the play button text to add theme font size override to set the font size to 30
	$"Play Button/Play Button Text".add_theme_font_size_override("font_size", 30)
	
	# Set the play button text size to x = 107 and y = 55
	$"Play Button".size = Vector2(107, 50)
	
	# Initialize the options button to say Options
	$"How to Play Button/How to Play Text".text = "How to Play"
	
	# Initialize the How to Play button size here
	$"How to Play Button/How to Play Text".size = Vector2(107, 60)
	
	# ALign both the vertical and horizontal alignments of the play text at the center of the text box
	$"How to Play Button/How to Play Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"How to Play Button/How to Play Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the how to play button text to add theme font override to use the font we set in the inspector
	$"How to Play Button/How to Play Text".add_theme_font_override("font", mainMenuFont)
	
	# Use the how to play button text to add theme font size override to set the font size to 14
	$"How to Play Button/How to Play Text".add_theme_font_size_override("font_size", 14)
	
	# Set the How to Play button text size to x = 107 and y = 55
	$"How to Play Button".size = Vector2(107, 50)
	
	# Initialize the options button to say Options
	$"Options Button/Options Text".text = "Options"
	
	# Initialize the options button size here
	$"Options Button".size = Vector2(107, 50)
	
	# ALign both the vertical and horizontal alignments of the options text at the center of the text box
	$"Options Button/Options Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Options Button/Options Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the options button text to add theme font override to use the font we set in the inspector
	$"Options Button/Options Text".add_theme_font_override("font", mainMenuFont)
	
	# Use the options button text to add theme font size override to set the font size to 20
	$"Options Button/Options Text".add_theme_font_size_override("font_size", 20)
	
	# Set the options button text size to x = 107 and y = 60
	$"Options Button/Options Text".size = Vector2(107, 60)
	
	# Initialize the credits button to say Credits
	$"Credits Button/Credits Text".text = "Credits"
	
	# Initialize the credits button size here
	$"Credits Button".size = Vector2(107, 50)
	
	# ALign both the vertical and horizontal alignments of the credits text at the center of the text box
	$"Credits Button/Credits Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Credits Button/Credits Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the credits button text to add theme font override to use the font we set in the inspector
	$"Credits Button/Credits Text".add_theme_font_override("font", mainMenuFont)
	
	# Use the credits button text to add theme font size override to set the font size to 20
	$"Credits Button/Credits Text".add_theme_font_size_override("font_size", 20)
	
	# Set the credits button text size to x = 107 and y = 60
	$"Credits Button/Credits Text".size = Vector2(107, 60)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pass
	
	if MainMenuMusic.playing == false:
		MainMenuMusic.play()
		MainMenuMusic.volume_db = MusicVolume.musicVolume - 80
	
	# If the player presses the ESCAPE key, then quit the game
	if Input.is_action_pressed("Quit"):
		get_tree().quit()

func IfPlayButtonIsPressed():
	#go to dev room for testing when hitting play in the main menu
	get_tree().change_scene_to_file("res://Scenes/devroom.tscn")
	
	ButtonPressSoundEffect.play()

func IfOptionsButtonIsPressed():
	#pass # Replace with function body.
	
	# Go to the options menu if the player presses the options button inside the main menu
	get_tree().change_scene_to_file("res://Scenes/Options Menu.tscn")
	
	ButtonPressSoundEffect.play()


func IfHowToPlayButtonIsPressed():
	#pass # Replace with function body.
	
	# Go to the how to play menu if the player presses the how to play button inside the main menu
	get_tree().change_scene_to_file("res://Scenes/How to Play Menu.tscn")
	
	ButtonPressSoundEffect.play()


func IfCreditsButtonIsPressed():
	#pass # Replace with function body.
	
	# Go to the credits menu if the player presses the credits button inside the main menu
	get_tree().change_scene_to_file("res://Scenes/Credits Menu.tscn")
	
	ButtonPressSoundEffect.play()

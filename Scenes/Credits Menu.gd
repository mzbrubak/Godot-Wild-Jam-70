extends Node

# Set the font to whatever we want inside the inspector
@export var creditsMenuFont : Font

var buttonHoverSoundIndex

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	
	if $"Credits Menu Video".is_playing() == false:
		get_node("Credits Menu Video").play()
	
	# Make the credits menu title text say Credits
	$"Credits Menu Title".text = "Credits"
	
	# Align both the vertical and horizontal alignments of the credits menu title text at the center of the text box
	$"Credits Menu Title".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Credits Menu Title".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the credits menu title add theme font override to use the font we set in the inspector
	$"Credits Menu Title".add_theme_font_override("font", creditsMenuFont)
	
	# Use the credits menu title add theme font size override to set the font size to 50
	$"Credits Menu Title".add_theme_font_size_override("font_size", 50)
	
	# Set the credits menu title text size to x = 100 and y = 50
	$"Credits Menu Title".size = Vector2(100, 50)
	
	# Initialize the back button to say Back
	$"Back Button/Back Text".text = "Back"
	
	# Initialize the back button size here
	$"Back Button".size = Vector2(107, 50)
	
	# ALign both the vertical and horizontal alignments of the back text at the center of the text box
	$"Back Button/Back Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Back Button/Back Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the back button text to add theme font override to use the font we set in the inspector
	$"Back Button/Back Text".add_theme_font_override("font", creditsMenuFont)
	
	# Use the back button text to add theme font size override to set the font size to 30
	$"Back Button/Back Text".add_theme_font_size_override("font_size", 30)
	
	# Set the back button text size to x = 107 and y = 55
	$"Back Button/Back Text".size = Vector2(107, 55)
	
	# Set the programmer text to say Programmer
	$"Programmer Text".text = "Programmer"
	
	# Set the programmer text size to be 100 by 50
	$"Programmer Text".size = Vector2(100, 50)
	
	# Align the programmer text at center right
	$"Programmer Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Programmer Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	
	# Use the programmer text add theme font override to use the font we set in the inspector
	$"Programmer Text".add_theme_font_override("font", creditsMenuFont)
	
	# Add the programmer theme font size to override the value set in the inspector from 1 to size 25
	$"Programmer Text".add_theme_font_size_override("font_size", 25)
	
	# Set the programmer names text to equal to our programming team
	$"Programmer Names Text".text = "Osama Hussein\nFelix DuBois"
	
	# Set the programmer names text size to 100 by 50
	$"Programmer Names Text".size = Vector2(100, 50)
	
	# Set the programmer names text to align at center left
	$"Programmer Names Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Programmer Names Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	
	# Use the programmer names text add theme font override to use the font we set in the inspector
	$"Programmer Names Text".add_theme_font_override("font", creditsMenuFont)
	
	# Use the add theme font size override to set the font size to 25 of the Programmer Names Text
	$"Programmer Names Text".add_theme_font_size_override("font_size", 25)
	
	# Set the Art Design text to say Art design
	$"Art Design Text".text = "Art design"
	
	# Set the art design text size to be 100 by 50
	$"Art Design Text".size = Vector2(100, 50)
	
	# Set the art design text to align at center right
	$"Art Design Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Art Design Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	
	# Use the art design text add theme font override to use the font we set in the inspector
	$"Art Design Text".add_theme_font_override("font", creditsMenuFont)
	
	# Set the art design theme font size to override to font size 25
	$"Art Design Text".add_theme_font_size_override("font_size", 25)
	
	# Give credit to the artist in our team
	$"Art Design Name Text".text = "Ken\nFelix DuBois"
	
	# Set the art design name text size to be 100 by 50
	$"Art Design Name Text".size = Vector2(100, 50)
	
	# Set the art design name text to align at center left
	$"Art Design Name Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Art Design Name Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	
	# Use the art design name text add theme font override to use the font we set in the inspector
	$"Art Design Name Text".add_theme_font_override("font", creditsMenuFont)
	
	# Set the art design name theme font size to override to font size 25
	$"Art Design Name Text".add_theme_font_size_override("font_size", 25)
	
	# Make the sound composer text say Sound composer
	$"Sound Composer Text".text = "Sound composer"
	
	# Set the sound composer text size to be 100 by 50
	$"Sound Composer Text".size = Vector2(100, 50)
	
	# Align the sound composer text center right
	$"Sound Composer Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Sound Composer Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	
	# Use the sound composer text add theme font override to use the font we set in the inspector
	$"Sound Composer Text".add_theme_font_override("font", creditsMenuFont)
	
	# Set the sound composer theme font size to override to font size 25
	$"Sound Composer Text".add_theme_font_size_override("font_size", 25)
	
	# Set the sound composer name text equal to our sound composer team
	$"Sound Composer Name Text".text = "Felipe Yatri"
	
	# Set the sound composer name text size to be 100 by 50
	$"Sound Composer Name Text".size = Vector2(100, 50)
	
	# Align the sound composer name text center left
	$"Sound Composer Name Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Sound Composer Name Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	
	# Use the sound composer name text add theme font override to use the font we set in the inspector
	$"Sound Composer Name Text".add_theme_font_override("font", creditsMenuFont)
	
	# Set the sound composer name theme font size to override to font size 25
	$"Sound Composer Name Text".add_theme_font_size_override("font_size", 25)
	
	# Make the producer text say Producer
	$"Producer Text".text = "Producer"
	
	# Set the producer text size to be 100 by 50
	$"Producer Text".size = Vector2(100, 50)
	
	# Align the producer text center right
	$"Producer Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Producer Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	
	# Use the producer text add theme font override to use the font we set in the inspector
	$"Producer Text".add_theme_font_override("font", creditsMenuFont)
	
	# Set the producer theme font size to override to font size 25
	$"Producer Text".add_theme_font_size_override("font_size", 25)
	
	# Give credit to our producer team
	$"Producer Name Text".text = "Felix DuBois"
	
	# Set the producer name text size to be 100 by 50
	$"Producer Name Text".size = Vector2(100, 50)
	
	# Align the producer name text center left
	$"Producer Name Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Producer Name Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	
	# Use the producer name text add theme font override to use the font we set in the inspector
	$"Producer Name Text".add_theme_font_override("font", creditsMenuFont)
	
	# Set the producer name theme font size to override to font size 25
	$"Producer Name Text".add_theme_font_size_override("font_size", 25)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pass
	
	if MainMenuMusic.playing == false:
		MainMenuMusic.play()
		MainMenuMusic.volume_db = MusicVolume.musicVolume - 80


func IfBackButtonIsPressed():
	#pass # Replace with function body.
	
	# Go back to the main menu
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")
	
	ButtonPressSoundEffect.play()


func IfBackButtonIsHoveredByMouse():
	#pass # Replace with function body.
	
	buttonHoverSoundIndex = randi_range(0, 4)
	
	if buttonHoverSoundIndex == 0:
		await(get_tree().create_timer(5)).timeout
		ButtonHoverSounds.play()
	
	if buttonHoverSoundIndex == 1:
		await(get_tree().create_timer(5)).timeout
		ButtonHoverSounds.get_node("Button Hover Sound 2").play()
	
	if buttonHoverSoundIndex == 2:
		await(get_tree().create_timer(5)).timeout
		ButtonHoverSounds.get_node("Button Hover Sound 3").play()
	
	if buttonHoverSoundIndex == 3:
		await(get_tree().create_timer(5)).timeout
		ButtonHoverSounds.get_node("Button Hover Sound 4").play()
	
	if buttonHoverSoundIndex == 4:
		await(get_tree().create_timer(5)).timeout
		ButtonHoverSounds.get_node("Button Hover Sound 5").play()


func IfBackButtonIsExitedByMouse():
	#pass # Replace with function body.
	
	ButtonHoverSounds.stop()
	ButtonHoverSounds.get_node("Button Hover Sound 2").stop()
	ButtonHoverSounds.get_node("Button Hover Sound 3").stop()
	ButtonHoverSounds.get_node("Button Hover Sound 4").stop()
	ButtonHoverSounds.get_node("Button Hover Sound 5").stop()

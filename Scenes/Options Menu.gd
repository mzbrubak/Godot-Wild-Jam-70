extends Node


# Set the font to whatever we want inside the inspector
@export var optionsMenuFont : Font

var musicSliderPercentage
var sfxSliderPercentage

var buttonHoverSoundIndex

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	
	if $"Options Menu Video".is_playing() == false:
		get_node("Options Menu Video").play()
	
	# Make the options menu title say Options Menu
	$"Options Menu Title".text = "Options Menu"
	
	# Align both the vertical and horizontal alignments of the options menu text at the center of the text box
	$"Options Menu Title".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Options Menu Title".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the main menu add theme font override to use the font we set in the inspector
	$"Options Menu Title".add_theme_font_override("font", optionsMenuFont)
	
	# Use the how to play menu add theme color override to make the color green
	$"Options Menu Title".add_theme_color_override("font_color", Color(0, 1, 0, 1))
	
	# Use the main menu add theme font size override to set the font size to 50
	$"Options Menu Title".add_theme_font_size_override("font_size", 50)
	
	# Set the options menu title text size to x = 100 and y = 50
	$"Options Menu Title".size = Vector2(100, 50)
	
	# Initialize the back button to say Back
	$"Back Button/Back Text".text = "Back"
	
	# Initialize the back button size here
	$"Back Button".size = Vector2(107, 50)
	
	# ALign both the vertical and horizontal alignments of the back text at the center of the text box
	$"Back Button/Back Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Back Button/Back Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the options button text to add theme font override to use the font we set in the inspector
	$"Back Button/Back Text".add_theme_font_override("font", optionsMenuFont)
	
	# Use the options button text to add theme font size override to set the font size to 30
	$"Back Button/Back Text".add_theme_font_size_override("font_size", 30)
	
	# Set the back button text size to x = 107 and y = 60
	$"Back Button/Back Text".size = Vector2(107, 60)
	
	# Initialize the resolution drop down color and menu here
	$"Resolution Drop Down Color".size = Vector2(120, 50)
	$"Resolution Drop Down Menu".size = Vector2(100, 50)
	
	# Use the resolution drop down menu text to add theme font override to use the font we set in the inspector
	$"Resolution Drop Down Menu".add_theme_font_override("font", optionsMenuFont)
	
	# Use the resolution drop down menu add theme color override to make the yellow-orange
	$"Resolution Drop Down Menu".add_theme_color_override("font_color", Color(1, 0.45, 0, 1))
	
	# Use the resolution drop down menu text to add theme font size override to set the font size to 20
	$"Resolution Drop Down Menu".add_theme_font_size_override("font_size", 20)
	
	# Add the resolution settings below for the player to pick the window resolution
	$"Resolution Drop Down Menu".add_item("1920x1080")
	$"Resolution Drop Down Menu".add_item("1600x900")
	$"Resolution Drop Down Menu".add_item("1360x768")
	$"Resolution Drop Down Menu".add_item("1280x960")
	$"Resolution Drop Down Menu".add_item("1024x768")
	$"Resolution Drop Down Menu".add_item("800x600")
	
	# These if statements below fixes the resolution drop down glitch always selecting the first index
	if DisplayServer.window_get_size().x == 1920 and DisplayServer.window_get_size().y == 1080:
		$"Resolution Drop Down Menu".selected = 0
	
	if DisplayServer.window_get_size().x == 1600 and DisplayServer.window_get_size().y == 900:
		$"Resolution Drop Down Menu".selected = 1
	
	if DisplayServer.window_get_size().x == 1360 and DisplayServer.window_get_size().y == 768:
		$"Resolution Drop Down Menu".selected = 2
	
	if DisplayServer.window_get_size().x == 1280 and DisplayServer.window_get_size().y == 960:
		$"Resolution Drop Down Menu".selected = 3
	
	if DisplayServer.window_get_size().x == 1024 and DisplayServer.window_get_size().y == 768:
		$"Resolution Drop Down Menu".selected = 4
	
	if DisplayServer.window_get_size().x == 800 and DisplayServer.window_get_size().y == 600:
		$"Resolution Drop Down Menu".selected = 5
	
	# Make the drop down color yellow for now
	$"Resolution Drop Down Color".color = Color(1.0, 1.0, 0.0, 1.0)
	
	# Make the resolution text node say Resolution
	$"Resolution Text".text = "Resolution"
	
	$"Resolution Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Resolution Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	
	# Use the resolution text to add theme font override to use the font we set in the inspector
	$"Resolution Text".add_theme_font_override("font", optionsMenuFont)
	
	# Use the resolution text add theme color override to make the color green-blue
	$"Resolution Text".add_theme_color_override("font_color", Color(0, 1, 1, 1))
	
	# Use the resolution text to add theme font size override to set the font size to 20
	$"Resolution Text".add_theme_font_size_override("font_size", 20)
	
	# Initialize the fullscreen text size here
	$"Resolution Text".size = Vector2(100, 50)
	
	# Set the music volume text to say Music Volume
	$"Music Volume Text".text = "Music Volume"
	
	# Align the music volume text center vertically and right horizontally
	$"Music Volume Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Music Volume Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	
	# Use the music volume text to add theme font override to use the font we set in the inspector
	$"Music Volume Text".add_theme_font_override("font", optionsMenuFont)
	
	# Use the music volume text add theme color override to make the color green-blue
	$"Music Volume Text".add_theme_color_override("font_color", Color(0, 1, 1, 1))
	
	# Use the music volume text to add theme font size override to set the font size to 20
	$"Music Volume Text".add_theme_font_size_override("font_size", 20)
	
	# Initialize the music volume size here
	$"Music Volume Text".size = Vector2(100, 50)
	
	# Set the min and max values of the music volume slider to be 0 and 80, respectively
	$"Music Volume Slider".min_value = 0
	$"Music Volume Slider".max_value = 80
	
	# Initialize the music volume slider here
	$"Music Volume Slider".size = Vector2(100, 50)
	
	# Set the music volume slider to its maximum volume at start
	$"Music Volume Slider".value = MusicVolume.musicVolume
	
	# Set the main menu music volume equal to the music volume minus the max value of the music slider
	MainMenuMusic.volume_db = MusicVolume.musicVolume - $"Music Volume Slider".max_value
	
	# Use the music volume percentage text to add theme font override to use the font we set in the inspector
	$"Music Volume Slider/Music Volume Percentage".add_theme_font_override("font", optionsMenuFont)
	
	# Use the music volume percentage add theme color override to make the color green-blue
	$"Music Volume Slider/Music Volume Percentage".add_theme_color_override("font_color", Color(0, 1, 1, 1))
	
	# Use the music volume percentage text to add theme font size override to set the font size to 20
	$"Music Volume Slider/Music Volume Percentage".add_theme_font_size_override("font_size", 25)
	
	# Initialize the music volume percentage to say whatever the music volume slider value currently is
	$"Music Volume Slider/Music Volume Percentage".text = "%s" % musicSliderPercentage
	
	# Set the SFX volume text to say SFX Volume
	$"SFX Volume Text".text = "SFX Volume"
	
	# Align the SFX volume text center vertically and right horizontally
	$"SFX Volume Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"SFX Volume Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	
	# Use the SFX volume text to add theme font override to use the font we set in the inspector
	$"SFX Volume Text".add_theme_font_override("font", optionsMenuFont)
	
	# Use the SFX volume text add theme color override to make the color green-blue
	$"SFX Volume Text".add_theme_color_override("font_color", Color(0, 1, 1, 1))
	
	# Use the SFX volume text to add theme font size override to set the font size to 20
	$"SFX Volume Text".add_theme_font_size_override("font_size", 20)
	
	# Initialize the SFX volume size here
	$"SFX Volume Text".size = Vector2(100, 50)
	
	# Set the min and max values of the SFX volume slider to be 0 and 80, respectively
	$"SFX Volume Slider".min_value = 0
	$"SFX Volume Slider".max_value = 80
	
	# Initialize the SFX volume slider here
	$"SFX Volume Slider".size = Vector2(100, 50)
	
	# Set the SFX volume value equal to the sfx volume variable
	$"SFX Volume Slider".value = SfxVolume.sfxVolume
	
	# Use the SFX volume percentage text to add theme font override to use the font we set in the inspector
	$"SFX Volume Slider/SFX Volume Percentage".add_theme_font_override("font", optionsMenuFont)
	
	# Use the SFX volume percentage add theme color override to make the color green-blue
	$"SFX Volume Slider/SFX Volume Percentage".add_theme_color_override("font_color", Color(0, 1, 1, 1))
	
	# Use the SFX volume percentage text to add theme font size override to set the font size to 20
	$"SFX Volume Slider/SFX Volume Percentage".add_theme_font_size_override("font_size", 25)
	
	# Initialize the SFX volume percentage to say whatever the SFX volume slider value currently is
	$"SFX Volume Slider/SFX Volume Percentage".text = "%s" % sfxSliderPercentage


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pass
	
	if MainMenuMusic.playing == false:
		MainMenuMusic.play()
		MainMenuMusic.volume_db = MusicVolume.musicVolume - 80
	
	musicSliderPercentage = ($"Music Volume Slider".value / $"Music Volume Slider".max_value) * 100
	
	# Initialize the music volume percentage to say whatever the music volume slider value currently is on process
	$"Music Volume Slider/Music Volume Percentage".text = "%s" % roundf(musicSliderPercentage)
	
	# Save the music volume to equal whatever the value of the music volume slider the player set it to
	MusicVolume.musicVolume = $"Music Volume Slider".value
	
	# Set the main menu music volume equal to the music volume minus the max value of the music slider
	MainMenuMusic.volume_db = MusicVolume.musicVolume - $"Music Volume Slider".max_value
	
	ButtonPressSoundEffect.volume_db = SfxVolume.sfxVolume - $"SFX Volume Slider".max_value
	
	sfxSliderPercentage = ($"SFX Volume Slider".value / $"SFX Volume Slider".max_value) * 100
	
	# Initialize the SFX volume percentage to say whatever the SFX volume slider value currently is
	$"SFX Volume Slider/SFX Volume Percentage".text = "%s" % roundf(sfxSliderPercentage)
	
	# Save the SFX volume to equal whatever the value of the SFX volume slider the player set it to
	SfxVolume.sfxVolume = $"SFX Volume Slider".value
	


func IfBackButtonIsPressed():
	#pass # Replace with function body.
	
	# Go back to the main menu when the player presses the back button
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")
	
	ButtonPressSoundEffect.play()


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

extends Control
signal dayResetManuallyTriggered
# Get the character base script to call pause menu inside this script
@onready var characterBase = $"../../"

# Set the font inside the inspector
@export var pauseMenuFont : Font

# Get the player camera node inside the character base scene and use it to set the player camera zoom
@onready var playerCameraNode = $"../../Player Camera"

var musicSliderPercentage
var sfxSliderPercentage

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
	
	# Initialize the options button text to say Options
	$"Options Button/Options Button Text".text = "Options"
	
	# Initialize the quit button size here
	$"Options Button/Options Button Text".size = Vector2(107, 60)
	
	# Set the quit button to scale twice as large than normal
	$"Options Button".scale = Vector2(2, 2)
	
	# ALign both the vertical and horizontal alignments of the quit button text at the center of the text box
	$"Options Button/Options Button Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Options Button/Options Button Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the quit button text to add theme font override to use the font we set in the inspector
	$"Options Button/Options Button Text".add_theme_font_override("font", pauseMenuFont)
	
	# Use the quit button text to add theme color override to set the font color to black
	$"Options Button/Options Button Text".add_theme_color_override("font_color", Color(0, 0, 0, 1))
	
	# Use the quit button text to add theme font size override to set the font size to 20
	$"Options Button/Options Button Text".add_theme_font_size_override("font_size", 20)
	
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
	
	# Hide the options menu right away
	$"Options Menu In-Game".hide()
	$"Options Menu In-Game/Options Menu In-Game Video".hide()
	
	# Make the options menu title say Options Menu
	$"Options Menu In-Game/Options Menu In-Game Title".text = "Options Menu"
	
	# Align both the vertical and horizontal alignments of the options menu text at the center of the text box
	$"Options Menu In-Game/Options Menu In-Game Title".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Options Menu In-Game/Options Menu In-Game Title".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the main menu add theme font override to use the font we set in the inspector
	$"Options Menu In-Game/Options Menu In-Game Title".add_theme_font_override("font", pauseMenuFont)
	
	# Use the main menu add theme font size override to set the font size to 50
	$"Options Menu In-Game/Options Menu In-Game Title".add_theme_font_size_override("font_size", 50)
	
	# Set the options menu title text size to x = 100 and y = 50
	$"Options Menu In-Game/Options Menu In-Game Title".size = Vector2(100, 50)
	
	# Initialize the back button to say Back
	$"Options Menu In-Game/Back Button/Back Text".text = "Back"
	
	# Initialize the back button size here
	$"Options Menu In-Game/Back Button".size = Vector2(107, 50)
	
	# ALign both the vertical and horizontal alignments of the back text at the center of the text box
	$"Options Menu In-Game/Back Button/Back Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Options Menu In-Game/Back Button/Back Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Use the options button text to add theme font override to use the font we set in the inspector
	$"Options Menu In-Game/Back Button/Back Text".add_theme_font_override("font", pauseMenuFont)
	
	# Use the options button text to add theme font size override to set the font size to 30
	$"Options Menu In-Game/Back Button/Back Text".add_theme_font_size_override("font_size", 30)
	
	# Set the back button text size to x = 107 and y = 60
	$"Options Menu In-Game/Back Button/Back Text".size = Vector2(107, 60)
	
	# Initialize the resolution drop down color and menu here
	$"Options Menu In-Game/Resolution Drop Down Color".size = Vector2(120, 50)
	$"Options Menu In-Game/Resolution Drop Down Menu".size = Vector2(100, 50)
	
	# Use the resolution drop down menu text to add theme font override to use the font we set in the inspector
	$"Options Menu In-Game/Resolution Drop Down Menu".add_theme_font_override("font", pauseMenuFont)
	
	# Use the resolution drop down menu text to add theme font size override to set the font size to 20
	$"Options Menu In-Game/Resolution Drop Down Menu".add_theme_font_size_override("font_size", 20)
	
	# Add the resolution settings below for the player to pick the window resolution
	$"Options Menu In-Game/Resolution Drop Down Menu".add_item("1920x1080")
	$"Options Menu In-Game/Resolution Drop Down Menu".add_item("1600x900")
	$"Options Menu In-Game/Resolution Drop Down Menu".add_item("1360x768")
	$"Options Menu In-Game/Resolution Drop Down Menu".add_item("1280x960")
	$"Options Menu In-Game/Resolution Drop Down Menu".add_item("1024x768")
	$"Options Menu In-Game/Resolution Drop Down Menu".add_item("800x600")
	
	# These if statements below fixes the resolution drop down glitch always selecting the first index
	if DisplayServer.window_get_size().x == 1920 and DisplayServer.window_get_size().y == 1080:
		$"Options Menu In-Game/Resolution Drop Down Menu".selected = 0
	
	if DisplayServer.window_get_size().x == 1600 and DisplayServer.window_get_size().y == 900:
		$"Options Menu In-Game/Resolution Drop Down Menu".selected = 1
	
	if DisplayServer.window_get_size().x == 1360 and DisplayServer.window_get_size().y == 768:
		$"Options Menu In-Game/Resolution Drop Down Menu".selected = 2
	
	if DisplayServer.window_get_size().x == 1280 and DisplayServer.window_get_size().y == 960:
		$"Options Menu In-Game/Resolution Drop Down Menu".selected = 3
	
	if DisplayServer.window_get_size().x == 1024 and DisplayServer.window_get_size().y == 768:
		$"Options Menu In-Game/Resolution Drop Down Menu".selected = 4
	
	if DisplayServer.window_get_size().x == 800 and DisplayServer.window_get_size().y == 600:
		$"Options Menu In-Game/Resolution Drop Down Menu".selected = 5
	
	# Make the drop down color yellow for now
	$"Options Menu In-Game/Resolution Drop Down Color".color = Color(1.0, 1.0, 0.0, 1.0)
	
	# Make the resolution text node say Resolution
	$"Options Menu In-Game/Resolution Text".text = "Resolution"
	
	$"Options Menu In-Game/Resolution Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Options Menu In-Game/Resolution Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	
	# Use the resolution text to add theme font override to use the font we set in the inspector
	$"Options Menu In-Game/Resolution Text".add_theme_font_override("font", pauseMenuFont)
	
	# Use the resolution text to add theme font size override to set the font size to 20
	$"Options Menu In-Game/Resolution Text".add_theme_font_size_override("font_size", 20)
	
	# Initialize the resolution text size here
	$"Options Menu In-Game/Resolution Text".size = Vector2(100, 50)
	
	# Initialize the player camera zoom drop down color here
	$"Options Menu In-Game/Player Camera Zoom Drop Down Color".size = Vector2(100, 50)
	
	# Set the player camera zoom drop down color to red
	$"Options Menu In-Game/Player Camera Zoom Drop Down Color".color = Color(1.0, 0.0, 0.0, 1.0)
	
	# Set the player camera zoom drop down menu here
	$"Options Menu In-Game/Player Camera Zoom Drop Down Menu".size = Vector2(100, 50)
	
	# Use the player camera zoom drop down menu text to add theme font override to use the font we set in the inspector
	$"Options Menu In-Game/Player Camera Zoom Drop Down Menu".add_theme_font_override("font", pauseMenuFont)
	
	# Use the player camera zoom drop down menu text to add theme font size override to set the font size to 20
	$"Options Menu In-Game/Player Camera Zoom Drop Down Menu".add_theme_font_size_override("font_size", 20)
	
	# Add the close, medium and far items on the player camera zoom drop down for the player to choose from
	$"Options Menu In-Game/Player Camera Zoom Drop Down Menu".add_item("Close")
	$"Options Menu In-Game/Player Camera Zoom Drop Down Menu".add_item("Medium")
	$"Options Menu In-Game/Player Camera Zoom Drop Down Menu".add_item("Far")
	
	# If the player camera's zoom is equal to 5 by 5, set the drop down menu to select the first one
	if playerCameraNode.zoom == Vector2(5, 5):
		$"Options Menu In-Game/Player Camera Zoom Drop Down Menu".selected = 0
	
	# If the player camera's zoom is equal to 3 by 3, set the drop down menu to select the second one
	if playerCameraNode.zoom == Vector2(3, 3):
		$"Options Menu In-Game/Player Camera Zoom Drop Down Menu".selected = 1
	
	# If the player camera's zoom is equal to 1 by 1, set the drop down menu to select the third one
	if playerCameraNode.zoom == Vector2(1, 1):
		$"Options Menu In-Game/Player Camera Zoom Drop Down Menu".selected = 2
	
	# Make the player camera zoom text node say camera zoom
	$"Options Menu In-Game/Player Camera Zoom Text".text = "Camera Zoom"
	
	# Set the player camera zoom text to align at center right of the text box
	$"Options Menu In-Game/Player Camera Zoom Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Options Menu In-Game/Player Camera Zoom Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	
	# Use the player camera zoom text to add theme font override to use the font we set in the inspector
	$"Options Menu In-Game/Player Camera Zoom Text".add_theme_font_override("font", pauseMenuFont)
	
	# Use the player camera zoom text to add theme font size override to set the font size to 20
	$"Options Menu In-Game/Player Camera Zoom Text".add_theme_font_size_override("font_size", 20)
	
	# Initialize the player camera zoom text size here
	$"Options Menu In-Game/Player Camera Zoom Text".size = Vector2(100, 50)
	
	# Set the music volume text to say Music Volume
	$"Options Menu In-Game/Music Volume Text".text = "Music Volume"
	
	# Align the music volume text center vertically and right horizontally
	$"Options Menu In-Game/Music Volume Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Options Menu In-Game/Music Volume Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	
	# Use the music volume text to add theme font override to use the font we set in the inspector
	$"Options Menu In-Game/Music Volume Text".add_theme_font_override("font", pauseMenuFont)
	
	# Use the music volume text to add theme font size override to set the font size to 20
	$"Options Menu In-Game/Music Volume Text".add_theme_font_size_override("font_size", 20)
	
	# Initialize the music volume size here
	$"Options Menu In-Game/Music Volume Text".size = Vector2(100, 50)
	
	# Set the min and max values of the music volume slider to be 0 and 80, respectively
	$"Options Menu In-Game/Music Volume Slider".min_value = 0
	$"Options Menu In-Game/Music Volume Slider".max_value = 80
	
	# Initialize the music volume slider here
	$"Options Menu In-Game/Music Volume Slider".size = Vector2(100, 50)
	
	# Set the music volume slider to its maximum volume at start
	$"Options Menu In-Game/Music Volume Slider".value = MusicVolume.musicVolume
	
	# Use the music volume percentage text to add theme font override to use the font we set in the inspector
	$"Options Menu In-Game/Music Volume Slider/Music Volume Percentage".add_theme_font_override("font", pauseMenuFont)
	
	# Use the music volume percentage text to add theme font size override to set the font size to 20
	$"Options Menu In-Game/Music Volume Slider/Music Volume Percentage".add_theme_font_size_override("font_size", 25)
	
	# Initialize the music volume percentage to say whatever the music volume slider value currently is
	$"Options Menu In-Game/Music Volume Slider/Music Volume Percentage".text = "%s" % musicSliderPercentage
	
	# Set the SFX volume text to say SFX Volume
	$"Options Menu In-Game/SFX Volume Text".text = "SFX Volume"
	
	# Align the SFX volume text center vertically and right horizontally
	$"Options Menu In-Game/SFX Volume Text".vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$"Options Menu In-Game/SFX Volume Text".horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	
	# Use the SFX volume text to add theme font override to use the font we set in the inspector
	$"Options Menu In-Game/SFX Volume Text".add_theme_font_override("font", pauseMenuFont)
	
	# Use the SFX volume text to add theme font size override to set the font size to 20
	$"Options Menu In-Game/SFX Volume Text".add_theme_font_size_override("font_size", 20)
	
	# Initialize the SFX volume size here
	$"Options Menu In-Game/SFX Volume Text".size = Vector2(100, 50)
	
	# Set the min and max values of the SFX volume slider to be 0 and 100, respectively
	$"Options Menu In-Game/SFX Volume Slider".min_value = 0
	$"Options Menu In-Game/SFX Volume Slider".max_value = 80
	
	# Initialize the SFX volume slider here
	$"Options Menu In-Game/SFX Volume Slider".size = Vector2(100, 50)
	
	# Set the SFX volume value equal to the sfx volume variable
	$"Options Menu In-Game/SFX Volume Slider".value = SfxVolume.sfxVolume
	
	# Use the SFX volume percentage text to add theme font override to use the font we set in the inspector
	$"Options Menu In-Game/SFX Volume Slider/SFX Volume Percentage".add_theme_font_override("font", pauseMenuFont)
	
	# Use the SFX volume percentage text to add theme font size override to set the font size to 20
	$"Options Menu In-Game/SFX Volume Slider/SFX Volume Percentage".add_theme_font_size_override("font_size", 25)
	
	# Initialize the SFX volume percentage to say whatever the SFX volume slider value currently is
	$"Options Menu In-Game/SFX Volume Slider/SFX Volume Percentage".text = "%s" % sfxSliderPercentage
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pass
	
	musicSliderPercentage = ($"Options Menu In-Game/Music Volume Slider".value / $"Options Menu In-Game/Music Volume Slider".max_value) * 100
	
	# Initialize the music volume percentage to say whatever the music volume slider value currently is on process
	$"Options Menu In-Game/Music Volume Slider/Music Volume Percentage".text = "%s" % roundf(musicSliderPercentage)
	
	# Save the music volume to equal whatever the value of the music volume slider the player set it to
	MusicVolume.musicVolume = $"Options Menu In-Game/Music Volume Slider".value
	
	sfxSliderPercentage = ($"Options Menu In-Game/SFX Volume Slider".value / $"Options Menu In-Game/SFX Volume Slider".max_value) * 100
	
	# Initialize the SFX volume percentage to say whatever the SFX volume slider value currently is
	$"Options Menu In-Game/SFX Volume Slider/SFX Volume Percentage".text = "%s" % roundf(sfxSliderPercentage)
	
	# Save the SFX volume to equal whatever the value of the SFX volume slider the player set it to
	SfxVolume.sfxVolume = $"Options Menu In-Game/SFX Volume Slider".value
	
	ButtonPressSoundEffect.volume_db = SfxVolume.sfxVolume - $"Options Menu In-Game/SFX Volume Slider".max_value


func IfResumeButtonIsPressed():
	#pass # Replace with function body.
	
	# Resume the game
	characterBase.pauseMenu()
	
	ButtonPressSoundEffect.play()


func IfQuitButtonIsPressed():
	#pass # Replace with function body.
	
	# Go back to the main menu
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")
	
	ButtonPressSoundEffect.play()



func IfRestartDayButtonIsPressed():
	#pass # Replace with function body.
	dayResetManuallyTriggered.emit()
	# Restart at the current scene
	#get_tree().reload_current_scene()
	
	# This line of code fixes the bug of the player not being able to move after the game restarts
	# Only way to move the player around again is to pause and resume each time
	# This way, the player can move around after reloading the current scene without having to pause and resume
	#characterBase.pauseMenu()
	
	ButtonPressSoundEffect.play()
	


func IfOptionsButtonIsPressed():
	#pass # Replace with function body.
	
	# Show the options menu in game node
	$"Options Menu In-Game".show()
	$"Options Menu In-Game/Back Button".show()
	$"Options Menu In-Game/Back Button/Back Text".show()
	$"Options Menu In-Game/Music Volume Slider".show()
	$"Options Menu In-Game/Music Volume Slider/Music Volume Percentage".show()
	$"Options Menu In-Game/Music Volume Text".show()
	$"Options Menu In-Game/Options Menu In-Game Title".show()
	$"Options Menu In-Game/Player Camera Zoom Drop Down Color".show()
	$"Options Menu In-Game/Player Camera Zoom Drop Down Menu".show()
	$"Options Menu In-Game/Player Camera Zoom Text".show()
	$"Options Menu In-Game/Resolution Drop Down Color".show()
	$"Options Menu In-Game/Resolution Drop Down Menu".show()
	$"Options Menu In-Game/Resolution Text".show()
	$"Options Menu In-Game/SFX Volume Slider".show()
	$"Options Menu In-Game/SFX Volume Slider/SFX Volume Percentage".show()
	$"Options Menu In-Game/SFX Volume Text".show()
	
	# Hide all the pause menu child nodes
	$"Pause Menu Title".hide()
	$"Resume Button".hide()
	$"Restart Day Button".hide()
	$"Options Button".hide()
	$"Quit Button".hide()
	
	$"Pause Menu Video".hide()
	
	if $"Pause Menu Video".visible == false:
		get_node("Pause Menu Video").stop()
	
	$"Options Menu In-Game/Options Menu In-Game Video".show()
	
	if $"Options Menu In-Game/Options Menu In-Game Video".visible == true:
		get_node("Options Menu In-Game/Options Menu In-Game Video").play()
	
	$"Back to the Pause Menu Video".hide()
	
	if $"Back to the Pause Menu Video".visible == false:
		get_node("Back to the Pause Menu Video").stop()
	
	ButtonPressSoundEffect.play()


func IfBackButtonIsPressed():
	#pass # Replace with function body.
	
	# Hide the options menu in game node
	$"Options Menu In-Game".hide()
	
	$"Options Menu In-Game/Options Menu In-Game Video".hide()
	
	if $"Options Menu In-Game/Options Menu In-Game Video".visible == false:
		get_node("Options Menu In-Game/Options Menu In-Game Video").stop()
	
	$"Back to the Pause Menu Video".show()
	
	if $"Back to the Pause Menu Video".visible == true:
		get_node("Back to the Pause Menu Video").play()
	
	# Show all the pause menu child nodes
	$"Pause Menu Title".show()
	$"Resume Button".show()
	$"Restart Day Button".show()
	$"Options Button".show()
	$"Quit Button".show()
	
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


func IfPlayerCameraZoomIsModified(index):
	#pass # Replace with function body.
	
	# Store the currently selected index of the player camera zoom
	var playerCameraZoomIndex = index
	
	# If the first option is selected, set the player camera zoom to 5 by 5
	if playerCameraZoomIndex == 0:
		playerCameraNode.zoom = Vector2(5, 5)
	
	# If the second option is selected, set the player camera zoom to 3 by 3
	if playerCameraZoomIndex == 1:
		playerCameraNode.zoom = Vector2(3, 3)
	
	# If the third option is selected, set the player camera zoom to 1 by 1
	if playerCameraZoomIndex == 2:
		playerCameraNode.zoom = Vector2(1, 1)

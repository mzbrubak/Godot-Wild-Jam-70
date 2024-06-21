extends CharacterBody2D
class_name Character_Base

@onready var pause_menu = $"Pause Menu Canvas Layer/PauseMenu"
@export var characterBaseFont : Font
@export var NAME:String = "Name"

@onready var pause_menu_video = $"Pause Menu Canvas Layer/PauseMenu/Pause Menu Video"
@onready var back_to_the_pause_menu_video = $"Pause Menu Canvas Layer/PauseMenu/Back to the Pause Menu Video"
@onready var options_menu_video = $"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/Options Menu In-Game Video"

var health:int = 10

var speed:int = 50
var nameentryfield
var hitbox
var interactionCandidates=[]#tracks what interactable things are in rango of the character
# Set the is game paused to false because the player hasn't paused the game yet
var isGamePaused = false
var Camera

# Called when the node enters the scene tree for the first time.
func _ready():
	
	MainMenuMusic.stop()
	
	nameentryfield=find_child("NameEntry")
	hitbox=find_child("Hitbox")
	
	# Hide the pause menu scene at start of the character base scene
	pause_menu.hide()
	
	pause_menu_video.hide()
	
	# Prevents the pause menu from moving with the parent node (in this case, the CharacterBody2D)
	pause_menu.top_level = true
	
	# Set the player camera zoom to 5 by 5
	Camera=get_node("Player Camera")
	Camera.zoom = Vector2(5, 5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Pause Game"):
		pauseMenu()
		
	if Input.is_action_just_pressed("Interact"):
		if interactionCandidates.is_empty():
			pass
		else:
			interact(interactionCandidates[0])

	
func _physics_process(delta):
	velocity=Input.get_vector("Move Left","Move Right","Move Up","Move Down")
	# If the player is currently moving, normalize the playe movement vector to prevent fast diagonal movement
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	move_and_slide()

func pauseMenu():
	
	# Basically, if is game paused is false then hide the pause menu and set the engine time scale to 1
	if isGamePaused:
		pause_menu.hide()
		pause_menu_video.hide()
		pause_menu_video.stop()
		back_to_the_pause_menu_video.hide()
		back_to_the_pause_menu_video.stop()
		options_menu_video.hide()
		options_menu_video.stop()
			
		Engine.time_scale = 1
	
	# Else if is game paused is true, then show the pause menu and set the engine time scale to 0 to pause the scene
	else:
		pause_menu.show()
		pause_menu_video.show()
		pause_menu_video.play()
		
		if $"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game".visible == true:
			$"Pause Menu Canvas Layer/PauseMenu/Options Button".show()
			$"Pause Menu Canvas Layer/PauseMenu/Options Button/Options Button Text".show()
			$"Pause Menu Canvas Layer/PauseMenu/Pause Menu Title".show()
			$"Pause Menu Canvas Layer/PauseMenu/Quit Button".show()
			$"Pause Menu Canvas Layer/PauseMenu/Quit Button/Quit Button Text".show()
			$"Pause Menu Canvas Layer/PauseMenu/Restart Day Button".show()
			$"Pause Menu Canvas Layer/PauseMenu/Restart Day Button/Restart Day Button Text".show()
			$"Pause Menu Canvas Layer/PauseMenu/Resume Button".show()
			$"Pause Menu Canvas Layer/PauseMenu/Resume Button/Resume Button Text".show()
			
			$"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/Back Button".hide()
			$"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/Back Button/Back Text".hide()
			$"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/Music Volume Slider".hide()
			$"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/Music Volume Slider/Music Volume Percentage".hide()
			$"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/Music Volume Text".hide()
			$"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/Options Menu In-Game Title".hide()
			$"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/Player Camera Zoom Drop Down Color".hide()
			$"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/Player Camera Zoom Drop Down Menu".hide()
			$"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/Player Camera Zoom Text".hide()
			$"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/Resolution Drop Down Color".hide()
			$"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/Resolution Drop Down Menu".hide()
			$"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/Resolution Text".hide()
			$"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/SFX Volume Slider".hide()
			$"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/SFX Volume Slider/SFX Volume Percentage".hide()
			$"Pause Menu Canvas Layer/PauseMenu/Options Menu In-Game/SFX Volume Text".hide()
		
		Engine.time_scale = 0
	
	# Set the is game paused equal to not paused so that the player can resume the game again
	isGamePaused = !isGamePaused

func addInteraction(interactable):
	if interactionCandidates.is_empty():
		interactionCandidates.insert(0,interactable)
	else:
		var insert_index=interactionCandidates.bsearch_custom(interactable, Callable(self, "sort_interact"))
		interactionCandidates.insert(insert_index, interactable)
func removeInteraction(interactable):
	interactionCandidates.erase(interactable)

func interact(interactable):
	print(self, " interacting with ", interactable)
	interactable.IfInteractedWith(self)

func sort_interact(interactable1,interactable2):
	return interactable1.interactionArea.priority>=interactable2.interactionArea.priority

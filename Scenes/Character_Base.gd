extends CharacterBody2D
class_name Character_Base

@onready var pause_menu = $"Pause Menu Canvas Layer/PauseMenu"

@export var characterBaseFont : Font

var health:int = 10
var NAME:String = "Name"
var speed:int = 50
var nameentryfield
var hitbox
var interactionCandidates=[]#tracks what interactable things are in rango of the character
# Set the is game paused to false because the player hasn't paused the game yet
var isGamePaused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	nameentryfield=find_child("NameEntry")
	hitbox=find_child("Hitbox")
	
	# Hide the pause menu scene at start of the character base scene
	pause_menu.hide()
	
	# Prevents the pause menu from moving with the parent node (in this case, the CharacterBody2D)
	pause_menu.top_level = true
	
	# Set the player camera zoom to 5 by 5
	get_node("Player Camera").zoom = Vector2(5, 5)

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
		Engine.time_scale = 1
	
	# Else if is game paused is true, then show the pause menu and set the engine time scale to 0 to pause the scene
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	# Set the is game paused equal to not paused so that the player can resume the game again
	isGamePaused = !isGamePaused

func addInteraction(interactable):
	if interactionCandidates.is_empty():
		interactionCandidates.insert(0,interactable)
	else:
		var insert_index=interactionCandidates.bsearch_custom(interactable, Callable(self, "sort_interact"))

func removeInteraction(interactable):
	interactionCandidates.erase(interactable)

func interact(interactable):
	print(self, " interacting with ", interactable)
	interactable.IfInteractedWith(self)

func sort_interact(interactable1,interactable2):
	return interactable1.InteractionArea.priority>=interactable2.InteractionArea.priority

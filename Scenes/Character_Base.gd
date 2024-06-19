extends CharacterBody2D

@onready var pause_menu = $"Pause Menu Canvas Layer/PauseMenu"

@export var characterBaseFont : Font

var health:int = 10
var NAME:String = "Name"
var speed:int = 50
var patience:int = 3 #how long character will try to do tasks that are late
var schedule=Schedule.new()
#also making variables to more easily access children nodes
var pathfinder
var nameentryfield
var hitbox

var playerMovement

# Set the is game paused to false because the player hasn't paused the game yet
var isGamePaused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pathfinder=find_child("NavigationAgent2D")
	nameentryfield=find_child("NameEntry")
	hitbox=find_child("CollisionShape2D")
	
	# Establish the player movement vector to 0 for both x and y because the player hasn't moved yet
	playerMovement = Vector2(0, 0)
	
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
	


func _physics_process(delta):
	velocity=Input.get_vector("Move Left","Move Right","Move Up","Move Down")
	# If the player is currently moving, normalize the playe movement vector to prevent fast diagonal movement
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	move_and_slide()

func do_currenttask():
	pass#actually do a thing
	schedule.popTask()

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



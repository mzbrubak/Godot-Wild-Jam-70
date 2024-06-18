extends CharacterBody2D

@onready var pause_menu = $PauseMenu

@export var characterBaseFont : Font

var health:int = 10
var NAME:String = "Name"
var speed:int = 5
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pass
	
	# Move the player to the right when pressing the move right input
	if Input.is_action_pressed("Move Right"):
		playerMovement += Vector2(1, 0)
	
	# Move the player to the left when pressing the move left input
	if Input.is_action_pressed("Move Left"):
		playerMovement -= Vector2(1, 0)
	
	# Move the player downward when pressing the move down input
	if Input.is_action_pressed("Move Down"):
		playerMovement += Vector2(0, 1)
	
	# Move the player upward when pressing the move up input
	if Input.is_action_pressed("Move Up"):
		playerMovement -= Vector2(0, 1)
	
	# If the player wants to pause the game, then use the pauseMenu function to pause the game
	if Input.is_action_just_pressed("Pause Game"):
		pauseMenu()
	
	# If the player is currently moving, normalize the playe movement vector to prevent fast diagonal movement
	if playerMovement.length() > 0:
		playerMovement = playerMovement.normalized() * speed
	
	# Update the player's position consistently per frame using the player movement vector times by delta
	position += playerMovement * delta

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



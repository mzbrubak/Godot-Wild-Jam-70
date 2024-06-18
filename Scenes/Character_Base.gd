extends CharacterBody2D

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

# Called when the node enters the scene tree for the first time.
func _ready():
	pathfinder=find_child("NavigationAgent2D")
	nameentryfield=find_child("NameEntry")
	hitbox=find_child("CollisionShape2D")
	
	# Establish the player movement vector to 0 for both x and y because the player hasn't moved yet
	playerMovement = Vector2(0, 0)
	
	# Hide the pause game text at start to tell the player they haven't paused the game yet
	get_node("Pause Game Label").hide()
	
	# Set the pause game text top level to true to prevent it from moving in-game
	get_node("Pause Game Label").top_level = true
	
	# Tell the player that the game is paused
	get_node("Pause Game Label").text = "Game Paused!"
	
	# Use the font we set in the inspector and set the font size to 50 for the pause game text
	get_node("Pause Game Label").add_theme_font_override("font", characterBaseFont)
	get_node("Pause Game Label").add_theme_font_size_override("font_size", 50)


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
	
	# If the player wants to pause the game and the game is not paused yet
	if Input.is_action_just_pressed("Pause Game") and get_tree().paused == false:
		get_tree().paused = true
		
		$"Pause Game Label".show()
	
	# Else if the player wants to resume the game and the game is paused (this doesn't work for some reason)
	elif Input.is_action_just_pressed("Pause Game") and get_tree().paused == true:
		get_tree().paused = false
		
		$"Pause Game Label".hide()
	
	# If the player is currently moving, normalize the playe movement vector to prevent fast diagonal movement
	if playerMovement.length() > 0:
		playerMovement = playerMovement.normalized() * speed
	
	# Update the player's position consistently per frame using the player movement vector times by delta
	position += playerMovement * delta

func do_currenttask():
	pass#actually do a thing
	schedule.popTask()

extends Character_Base
var schedule=Schedule.new()
var patience:int = 3 #how long character will try to do tasks that are late
var pathfinder
var isPlayer:bool=false #indicates possession status
var interactionArea
func _ready():
	super._ready()
	interactionArea=find_child("InteractionArea")

func _process(delta):
	if isPlayer:
		if Input.is_action_just_pressed("Pause Game"):
			pauseMenu()
		if Input.is_action_just_pressed("Interact"):
			pass
		if Input.is_action_just_pressed("Unpossess"):
			pass
	else:
		pass
func _physics_process(delta):
	if isPlayer:
		velocity=Input.get_vector("Move Left","Move Right","Move Up","Move Down")
		# If the player is currently moving, normalize the playe movement vector to prevent fast diagonal movement
		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
		move_and_slide()


func do_currenttask():
	pass#actually do a thing
	schedule.popTask()

func IfBodyEntered(Body):
	print(Body," entered interaction area of ",self)
	Body.addInteraction(self)

func IfBodyExited(Body):
	print(Body," exited interaction area of ",self)
	Body.removeInteraction(self)

func IfInteractedWith(Character):
	print("Why hello, ", Character,"!")
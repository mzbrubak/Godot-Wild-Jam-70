extends Character_Base
signal possessionEnding
var schedule=Schedule.new()
var patience:int = 3 #how long character will try to do tasks that are late
var pathfinder
var isPlayer:bool=false #indicates possession status
var interactionArea
var testTask: Task
var navigationReady=false
func _ready():
	super._ready()
	interactionArea=find_child("InteractionArea")
	pathfinder=find_child("NavigationAgent2D")
	schedule.currenttask=Task.new(20, Vector2(360,300), 0,[])
	pathfinder.set_target_position(schedule.currenttask.location)
	#call_deferred("NavigationSetup")

func _process(delta):
	if isPlayer:
		if Input.is_action_just_pressed("Pause Game"):
			pauseMenu()
		if Input.is_action_just_pressed("Interact"):
			if interactionCandidates.is_empty():
				pass
			else:
				interact(interactionCandidates[0])
		if Input.is_action_just_pressed("Unpossess"):
			endPossession()
	else:
		pass
func _physics_process(delta):
	if isPlayer:
		velocity=Input.get_vector("Move Left","Move Right","Move Up","Move Down")
		# If the player is currently moving, normalize the playe movement vector to prevent fast diagonal movement
		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
		move_and_slide()
	elif navigationReady and !pathfinder.is_navigation_finished():
		var next_path_position=pathfinder.get_next_path_position()
		velocity=global_position.direction_to(next_path_position)*speed
		#print(global_position.direction_to(next_path_position))
		move_and_slide()


func do_currenttask():
	pass#actually do a thing
	getnexttask()

func getnexttask():
	schedule.popTask()
	pathfinder.set_target_position(schedule.currenttask)

func IfBodyEntered(Body):
	print(Body," entered interaction area of ",self)
	Body.addInteraction(self)

func IfBodyExited(Body):
	print(Body," exited interaction area of ",self)
	Body.removeInteraction(self)

func IfInteractedWith(Character):
	print("Why hello, ", Character,". I'm ",NAME)

func becomePossessed():
	isPlayer=true
	interactionArea.get_child(0).disabled=true
	set_collision_layer_value(3, true)
	
func endPossession():
	isPlayer=false
	interactionArea.get_child(0).disabled=false
	set_collision_layer_value(3,false)
	possessionEnding.emit(self)

func startNavigation(time:int):
#the pathfinding algorithm only works if there is enough lead time to make a navigation map
#in an attempt to allow for this in an easier way, I'm just going to wait for a certain time to start
	var triggertime=5
	if time>=triggertime:
		navigationReady=true
		pathfinder.set_max_speed(speed)
		

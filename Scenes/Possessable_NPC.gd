extends Character_Base
signal possessionEnding
var schedule=Schedule.new()
var patience:int = 3 #how long character will try to do tasks that are late
var pathfinder
var isPlayer:bool=false #indicates possession status
var interactionArea
var testTask: Task
var navigationReady=false
var possessionstartTime:int
enum {IDLE, INTERACT, FIGHT}

func _ready():
	super._ready()
	interactionArea=find_child("InteractionArea")
	pathfinder=find_child("NavigationAgent2D")
	schedule.addTask(20,Vector2(1000,800), 0,[])
	schedule.addTask(40,Vector2(100,100),0,[])
	schedule.remainingschedule=schedule.fullschedule
	schedule.popTask()
	NavigationServer2D.map_changed.connect(startNavigation)
	

func _process(_delta):
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
		if pathfinder.is_navigation_finished():
			pass
	
func _physics_process(_delta):
	if isPlayer:
		velocity=Input.get_vector("Move Left","Move Right","Move Up","Move Down")
		# If the player is currently moving, normalize the playe movement vector to prevent fast diagonal movement
		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
		move_and_slide()
	#elif navigationReady and !pathfinder.is_navigation_finished():
	elif pathfinder.is_navigation_finished():
		pass
	else:
		var next_path_position=pathfinder.get_next_path_position()
		velocity=global_position.direction_to(next_path_position)*speed
		move_and_slide()


func do_currenttask():
	match schedule.currenttask.action:
		INTERACT:
			if !interactionCandidates.is_empty():
				interact(interactionCandidates[0])
		IDLE:
			pass
	
	getnexttask()

func getnexttask():
	schedule.popTask()
	pathfinder.set_target_position(schedule.currenttask.location)

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

func startNavigation(mapRID):
#the pathfinding algorithm only works if there is enough lead time to make a navigation map
#in an attempt to allow for this in an easier way, I'm just going to wait for a certain time to start
	pathfinder.set_navigation_map(mapRID)
	pathfinder.set_navigation_layer_value(1,true)
	pathfinder.set_target_position(schedule.currenttask.location)
	pathfinder.set_max_speed(speed)
	navigationReady=true

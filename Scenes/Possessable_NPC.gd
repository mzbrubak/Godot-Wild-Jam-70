extends Character_Base
class_name Possessable_NPC
signal possessionBeginning
signal possessionEnding
signal announceIntent
signal actionReady
@export var schedule=Schedule.new()
var patience:int = 3 #how long character will try to do tasks that are late
var pathfinder
var isPlayer:bool=false #indicates possession status
var interactionArea
var navigationReady=false
var possessionstartTime:int
var possessionActions: Array[Task]=[]
@export var canUseAxe: bool = false
enum {IDLE, INTERACT, FIGHT}
var time:int
var timer

func _ready():
	MainMenuMusic.stop()
	
	super._ready()
	interactionArea=find_child("InteractionArea")
	pathfinder=find_child("NavigationAgent2D")
	loadNPCData()
	NavigationServer2D.map_changed.connect(startNavigation)
	timer = get_parent().get_node("Timer Canvas Layer/Timer")
	

func _process(_delta):
	MainMenuMusic.stop()
	
	if isPlayer:
		if Input.is_action_just_pressed("Pause Game"):
			pauseMenu()
		if Input.is_action_just_pressed("Interact"):
			if interactionCandidates.is_empty():
				pass
			else:
				registerPossessionInteract(interactionCandidates[0])
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


func getnexttask():
	schedule.popTask()
	pathfinder.set_target_position(schedule.currenttask.location)
	announceIntent.emit(self,schedule.currenttask)

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
	set_collision_layer_value(4,false)
	Camera.make_current()
	timer.AnnounceTime.connect(track_time_while_possessed)
	time=timer.timeint#in case things happen between ticks
	possessionstartTime=time
	possessionBeginning.emit(self)
	
func endPossession():
	isPlayer=false
	interactionArea.get_child(0).disabled=false
	set_collision_layer_value(3,false)
	set_collision_layer_value(4,true)
	schedule.eraseTasks(possessionstartTime, time)
	for i in range(possessionActions.size()):
		schedule.addTask(possessionActions[i])
	timer.AnnounceTime.disconnect(track_time_while_possessed)
	possessionEnding.emit(self)

func startNavigation(mapRID):
#the pathfinding algorithm only works if there is enough lead time to make a navigation map
#in an attempt to allow for this in an easier way, I'm just going to wait for a certain time to start
	pathfinder.set_navigation_map(mapRID)
	pathfinder.set_navigation_layer_value(1,true)
	pathfinder.set_max_speed(speed)
	getnexttask()
	navigationReady=true

func _on_target_reached():
	#print("Made it")
	actionReady.emit(self)

func track_time_while_possessed(t):#at start of possession, connect this to GM node
	time=t
	
func registerPossessionInteract(interactee):
	var newTask=Task.new()
	newTask.time=time
	newTask.location=interactee.global_position
	newTask.action=1
	if "objectID" in interactee:
		newTask.target=interactee.objectID
	possessionActions.insert(0,newTask)
	#add case for NPC interact later

func saveNPCData():
	var data = NPCData.new()
	data.name_guessed=get_node("NameEntry").text
	data.originalschedule=schedule.originalschedule
	data.fullschedule=schedule.fullschedule
	ResourceSaver.save(data,str("res://Schedules/",NAME,".tres"))

func loadNPCData():
	var data = ResourceLoader.load(str("res://Schedules/",NAME,".tres"))
	get_node("NameEntry").text=data.name_guessed
	schedule.originalschedule=data.originalschedule.duplicate(true)
	schedule.fullschedule=data.fullschedule.duplicate(true)
	schedule.remainingschedule=schedule.fullschedule.duplicate(true)

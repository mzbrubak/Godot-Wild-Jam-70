extends Node2D
var time:int=0
@export var daylength:int=60
var NPCList=[]
var NPCIntendedTasks=[]
var NPCActionReady=[]
var ObjectList: Dictionary
var possessedNPCindex=-1
var fairy
enum{IDLE, INTERACT, FIGHT}
var restartmode: bool = false


func _ready():
	MainMenuMusic.stop()
	fairy=get_node("Fairy")
	get_node("NavigationRegion2D").bake_navigation_polygon()
	var objects=find_children("*","StaticBody2D")
	for object in objects:
		if object.has_method("IfInteractedWith"):
			ObjectList[object.objectID]=object
	var characters=find_children("*","Character_Base")
	for character in characters:
		character.get_node("Pause Menu Canvas Layer/PauseMenu").dayResetManuallyTriggered.connect(restart_day)
		if character.has_method("getnexttask"):
			character.announceIntent.connect(_on_npc_announce_intent)
			character.actionReady.connect(_on_npc_action_ready)
			character.possessionBeginning.connect(_on_NPC_possession_beginning)
			character.possessionEnding.connect(_on_NPC_possession_ending)


	
	
	# Set the timer canvas layer to be bigger than normal so that the timer is visible
	get_node("Timer Canvas Layer").scale = Vector2(5, 5)

func _process(delta):
	MainMenuMusic.stop()
	if restartmode and Input.is_anything_pressed():
		restart_day()




func trackTime(t):
	time=t
	if time>=daylength:
		restart_day()
	for i in NPCActionReady.size():
		if i==possessedNPCindex:
			return
		elif NPCActionReady[i]==true and time>=NPCIntendedTasks[i].time:
			do_NPC_action(i)
		elif time>=NPCIntendedTasks[i].time+NPCList[i].patience:
			#print("Abandoning task")
			NPCList[i].getnexttask()
			
func restart_day():
	for NPC in NPCList:
		NPC.saveNPCData()
	get_tree().reload_current_scene()
	Engine.time_scale=1

func _on_npc_announce_intent(NPC,task):
	#print(NPC," intends to do action ", task.action, " to ", task.target)
	var NPCindex=NPCList.find(NPC)
	if NPCindex==-1:#meaning NPC not found
		NPCList.insert(NPCList.size(),NPC)
		NPCIntendedTasks.insert(NPCIntendedTasks.size(),task)
		NPCActionReady.insert(NPCActionReady.size(),false)
	else:
		NPCIntendedTasks[NPCindex]=task
		NPCActionReady[NPCindex]=false

func _on_npc_action_ready(NPC):
	var NPCindex=NPCList.find(NPC)
	var actionTime=NPCIntendedTasks[NPCindex].time
	if time>=actionTime:
		do_NPC_action(NPCindex)
	else:
		NPCActionReady[NPCindex]=true
	
func do_NPC_action(NPCindex):
	match NPCIntendedTasks[NPCindex].action:
		INTERACT:
			var object=NPCIntendedTasks[NPCindex].target
			if NPCList[NPCindex].interactionCandidates.has(ObjectList[object]):
				NPCList[NPCindex].interact(ObjectList[object])
			#add NPC case later (object list just has objects)
			else:
				#print("Whoops")
				pass
		FIGHT:
			#print("Haven't implemented fighting yet :/")
			pass
		IDLE:
			#print("Idling")
			pass
		_:
			#print("How the hell did you get here?")
			pass
	NPCList[NPCindex].getnexttask()

func _on_NPC_possession_beginning(NPC):
	possessedNPCindex=NPCList.find(NPC)
	
func _on_NPC_possession_ending(NPC):
	possessedNPCindex=-1


func _on_fairy_name_entry_mode_toggle():
	if Engine.time_scale==1:
		Engine.time_scale=0
		fairy.nameentryfield.visible=true
		for NPC in NPCList:
			NPC.nameentryfield.visible=true
	elif Engine.time_scale==0:
		Engine.time_scale=1
		fairy.nameentryfield.visible=false
		for NPC in NPCList:
			NPC.nameentryfield.visible=false

func _on_caught():
	get_node("Dialogue Canvas Layer").visible=true
	await get_tree().create_timer(0.5).timeout
	restartmode=true
	#print("GAME OVER")

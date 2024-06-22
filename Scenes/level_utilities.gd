extends Node2D
var time:int=0
var daylength:int=60
var NPCList=[]
var NPCIntendedTasks=[]
var NPCActionReady=[]
var ObjectList: Dictionary
enum{IDLE, INTERACT, FIGHT}

func _ready():
	MainMenuMusic.stop()
	
	var objects=find_children("*","StaticBody2D")
	for object in objects:
		if object.has_method("IfInteractedWith"):
			ObjectList[object.objectID]=object
	var characters=find_children("*","Character_Base")
	for character in characters:
		character.get_node("Pause Menu Canvas Layer/PauseMenu").dayResetManuallyTriggered.connect(restart_day)
	
	# Set the timer canvas layer to be bigger than normal so that the timer is visible
	get_node("Timer Canvas Layer").scale = Vector2(5, 5)

func _process(delta):
	MainMenuMusic.stop()

func trackTime(t):
	time=t
	if time>=daylength:
		restart_day()
	for i in NPCActionReady.size():
		if NPCActionReady[i]==true and time>=NPCIntendedTasks[i].time:
			do_NPC_action(i)
		elif time>=NPCIntendedTasks[i].time+NPCList[i].patience:
			print("Abandoning task")
			NPCList[i].getnexttask()
			
func restart_day():
	get_tree().reload_current_scene()
	for NPC in NPCList:
		NPC.saveNPCData()
	Engine.time_scale=1

func _on_npc_announce_intent(NPC,task):
	print(NPC," intends to do action ", task.action, " to ", task.target)
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
		FIGHT:
			print("Haven't implemented fighting yet :/")
		IDLE:
			print("Idling")
		_:
			print("How the hell did you get here?")
	NPCList[NPCindex].getnexttask()

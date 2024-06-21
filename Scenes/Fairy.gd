extends Character_Base
var possessionOffset:Vector2
var isPossessing:bool = false


func _ready():
	super._ready()
	speed=200

func _process(delta):
	if isPossessing:
		return
	super._process(delta)
	if Input.is_action_just_pressed("Possess"):
		attemptPossession()
#don't need fairy to act during possession

func _physics_process(delta):
	if isPossessing:
		return
	super._physics_process(delta)
#don't need fairy to move during possession
	
func attemptPossession():
	if interactionCandidates.is_empty():
		print("No possessable characters in range.")
	else:
		var index=0
		var possessionCandidate=null
		while possessionCandidate==null and index<interactionCandidates.size():
			if interactionCandidates[index].has_method("becomePossessed"):
				possessionCandidate=interactionCandidates[index]
			index+=1
		if possessionCandidate==null:
			print("No possessable characters in range.")
		else:
			if possessionCandidate.find_child("NameEntry").text==possessionCandidate.NAME:
				print("Possessing ",possessionCandidate)
				possessionCandidate.becomePossessed()
				find_child("Hitbox").disabled=true
				possessionCandidate.possessionEnding.connect(endPossession)
				possessionOffset=position-possessionCandidate.position
				isPossessing=true
			else:
				print("Can't possess character without knowing their name")

func endPossession(Character):
	position=Character.position+possessionOffset
	find_child("Hitbox").disabled=false
	isPossessing=false
	Character.possessionEnding.disconnect(endPossession)
	Camera.make_current()
	

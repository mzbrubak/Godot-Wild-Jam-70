extends Character_Base
var possessionOffset:Vector2

func _ready():
	super._ready()
	speed=200

func _process(delta):
	super._process(delta)
	if Input.is_action_just_pressed("Possess"):
		attemptPossession()
		
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
			else:
				print("Can't possess character without knowing their name")

func endPossession(Character):
	position=Character.position+possessionOffset
	find_child("Hitbox").disabled=false
	Character.possessionEnding.disconnect(endPossession)

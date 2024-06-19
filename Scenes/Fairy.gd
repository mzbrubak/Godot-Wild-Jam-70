extends Character_Base

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
			print("Possessing ",possessionCandidate)
			possessionCandidate.becomePossessed()

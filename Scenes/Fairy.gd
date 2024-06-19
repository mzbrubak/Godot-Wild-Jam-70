extends Character_Base

func _process(delta):
	super._process(delta)
	if Input.is_action_just_pressed("Possess"):
		attemptPossession()
		
func attemptPossession():
	pass

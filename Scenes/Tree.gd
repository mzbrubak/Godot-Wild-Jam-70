extends Interactable_Object


# Called when the node enters the scene tree for the first time.
func IfInteractedWith(Character):
	if "canUseAxe" in Character and Character.canUseAxe==true:
		print("Chopping down tree today")
		get_node("StumpSprite").visible=true
		get_node("FullTreeSprite").visible=false
	else:
		print(str(Character.NAME," leaves a mark on ", objectID))

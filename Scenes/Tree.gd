extends Interactable_Object
var chopped: bool = false
const logresource=preload("res://Scenes/log.tscn")

# Called when the node enters the scene tree for the first time.
func IfInteractedWith(Character):
	if chopped==false and "canUseAxe" in Character and Character.canUseAxe==true:
		#print("Chopping down tree")#replace with sound effect and animation
		get_node("StumpSprite").visible=true
		get_node("FullTreeSprite").visible=false
		chopped=true
		var newLog=logresource.instantiate()
		newLog.position=position#should be same as tree
		newLog.rotation=getLogRotation(Character)
		get_parent().add_child(newLog)
		get_parent().bake_navigation_polygon()#to account for log hitbox
	else:
		pass
		#print(str(Character.NAME," leaves a mark on ", objectID))

func getLogRotation(Character):
	var displacement=position-Character.position
	return displacement.angle()

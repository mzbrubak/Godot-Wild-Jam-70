extends Interactable_Object


func IfInteractedWith(character):
	if character is Possessable_NPC:#fairy can't do this
		get_node("HitboxShape").disabled=true
		get_node("InteractionArea").queue_free()
		get_node("Sprite2D").visible=false
		get_parent().bake_navigation_polygon()#since hitbox is now gone
		self.reparent(character)

	else:
		print("This axe is too heavy for you to carry.")
		

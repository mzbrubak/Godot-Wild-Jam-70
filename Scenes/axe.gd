extends Interactable_Object


func IfInteractedWith(character):
	if character is Possessable_NPC:#fairy can't do this
		get_node("HitboxShape").disabled=true
		get_node("InteractionArea").queue_free()
		get_node("Sprite2D").visible=false
		self.reparent(character)

	else:
		print("This axe is too heavy for you to carry.")
		

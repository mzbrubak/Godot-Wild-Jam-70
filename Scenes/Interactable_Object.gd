extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func IfBodyEntered(Body):
	print(Body," entered interaction area of ",self)
	Body.addInteraction(self)

func IfBodyExited(Body):
	print(Body," exited interaction area of ",self)
	Body.removeInteraction(self)

func IfInteractedWith(Character):
	print("The wall does not talk back to ", Character)

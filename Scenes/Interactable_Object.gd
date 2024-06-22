extends StaticBody2D
class_name Interactable_Object
var interactionArea
@export var objectID:String

# Called when the node enters the scene tree for the first time.
func _ready():
	interactionArea=find_child("InteractionArea")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func IfBodyEntered(Body):
	print(Body," entered interaction area of ",objectID)
	Body.addInteraction(self)

func IfBodyExited(Body):
	print(Body," exited interaction area of ",objectID)
	Body.removeInteraction(self)

func IfInteractedWith(Character):
	print(objectID, " was pressed by ", Character)

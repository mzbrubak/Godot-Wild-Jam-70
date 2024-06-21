extends Resource
class_name Task
@export var time:float
@export var location:Vector2
@export var action:int
@export var target = ""

func _init(t=0, loc=Vector2(0,0), act=0, cond=""):
	time=t
	location=loc
	action=act
	target=cond


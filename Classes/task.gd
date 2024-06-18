class_name Task
var time:float
var location:Vector2
var action:int
var conditions = []

func _init(t=0, loc="", act="", cond=[]):
	time=t
	location=loc
	action=act
	conditions=cond


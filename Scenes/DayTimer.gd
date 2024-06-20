extends Timer
signal AnnounceTime
@export var timeint: int
var TimeUI
# Called when the node enters the scene tree for the first time.
func _ready():
	timeint=0
	TimeUI=find_child("Time")
	TimeUI.text=str(timeint)
	
func onTimeout():
	#print("Testing")
	timeint+=1
	TimeUI.text=str(timeint)
	AnnounceTime.emit(timeint)

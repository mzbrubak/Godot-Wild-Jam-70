extends Timer
signal AnnounceTime
@export var timeint: int
var daylength=100
var TimeUI
# Called when the node enters the scene tree for the first time.
func _ready():
	timeint=0
	TimeUI=find_child("Time")
	TimeUI.text=str(timeint)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func onTimeout():
	#print("Testing")
	timeint+=1
	TimeUI.text=str(timeint)
	AnnounceTime.emit(timeint)
	if timeint>=daylength:
		pass

extends CharacterBody2D

var health:int = 10
var NAME:String = "Name"
var speed:int = 5
var patience:int = 3 #how long character will try to do tasks that are late
var schedule=Schedule.new()
#also making variables to more easily access children nodes
var pathfinder
var nameentryfield
var hitbox
# Called when the node enters the scene tree for the first time.
func _ready():
	pathfinder=find_child("NavigationAgent2D")
	nameentryfield=find_child("NameEntry")
	hitbox=find_child("CollisionShape2D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func do_currenttask():
	pass#actually do a thing
	schedule.popTask()

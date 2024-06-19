extends Character_Base
var schedule=Schedule.new()
var patience:int = 3 #how long character will try to do tasks that are late
var pathfinder
func do_currenttask():
	pass#actually do a thing
	schedule.popTask()

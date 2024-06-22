extends Resource
class_name Schedule
#note: events are listed in reverse order because pop_back is more memory-efficient than pop_front
@export var fullschedule: Array[Task] = [] #lists all events for the day, including those already done
@export var originalschedule: Array[Task] = [] #what NPC does without interaction; read this from a file later
@export var remainingschedule: Array[Task]= [] #lists events for the day that have not yet been done
var currenttask:Task


func popTask():
	if remainingschedule.is_empty():
		currenttask=Task.new(999999,currenttask.location,0,[])
	else:
		currenttask=remainingschedule.pop_back()

func addTask(task:Task):
	var insertIndex=fullschedule.bsearch_custom(task, Callable(self,"compareTaskTime"))
	fullschedule.insert(insertIndex,task)

func eraseTasks(start_time, end_time): #does just the overwrite point
	var starttask=Task.new(start_time)
	var endtask=Task.new(end_time)
	var startindex=fullschedule.bsearch_custom(starttask, Callable(self,"compareTaskTime"))
	var endindex=fullschedule.bsearch_custom(endtask, Callable(self,"compareTaskTime"))
	var counttoerase=startindex-endindex#no OBO error; if indices are the same, no events occurred between these times
	while counttoerase>0:
		fullschedule.pop_at(endindex)
		counttoerase-=1

func overwriteTasks(tasklist):#called after possession ends.  For technical reasons starting and ending possession should be first and last task
	var starttask=tasklist.pop_back()
	var endtask=tasklist.pop_front()
	var startindex=fullschedule.bsearch_custom(starttask, Callable(self,"compareTaskTime"))
	var endindex=fullschedule.bsearch_custom(endtask, Callable(self,"compareTaskTime"))
	var counttoerase=startindex-endindex#no OBO error; if indices are the same, no events occurred
	# 3 situations: erasedcount==tasklist.length, or > or <
	for i in range(tasklist.size()):
		if counttoerase>0:
			fullschedule[startindex-i] = tasklist.pop_back()
			counttoerase-=1
		else:
			fullschedule.insert(endindex,tasklist.pop_back())
	while counttoerase>0:
		fullschedule.pop_at(endindex)
		counttoerase-=1
		
func restartschedule():#called on day reset
	remainingschedule=fullschedule.duplicate(true)

func revertschedule(time):#undoes all player influence on NPC
	fullschedule=originalschedule.duplicate(true)
	remainingschedule=originalschedule.duplicate(true)
	if currenttask in originalschedule:
		var firsttask=remainingschedule.pop_back()
		while (firsttask==currenttask)==false:
			firsttask=remainingschedule.pop_back()
	else:
		popTask()
		while currenttask.time<time:
			popTask()

func compareTaskTime(task1,task2):#utility for custom binary search
	return (task1.time>task2.time)

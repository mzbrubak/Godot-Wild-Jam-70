extends Character_Base
signal caught
var pathfinder
var player
var navigationReady: bool = false
func _ready():
	speed=103
	pathfinder=get_node("NavigationAgent2D")
	player=get_parent().get_node("Lumberjack")
	NavigationServer2D.map_changed.connect(startNavigation)
	player=get_parent().get_node("Lumberjack")

func _process(_delta):
	pass

func _physics_process(_delta):
	if navigationReady:
		pathfinder.set_target_position(player.position)
	var next_path_position=pathfinder.get_next_path_position()
	velocity=global_position.direction_to(next_path_position)*speed
	move_and_slide()

func startNavigation(mapRID):
#the pathfinding algorithm only works if there is enough lead time to make a navigation map
#in an attempt to allow for this in an easier way, I'm just going to wait for a certain time to start
	pathfinder.set_navigation_map(mapRID)
	pathfinder.set_navigation_layer_value(1,true)
	pathfinder.set_max_speed(speed)
	pathfinder.set_target_position(player.position)
	navigationReady=true
	NavigationServer2D.map_changed.disconnect(startNavigation)#I only want this to happen the first time

func IfBodyEntered(Body):
	if Body==player:
		if Body.isPlayer:
			Body.call_deferred("endPossession")
		caught.emit()

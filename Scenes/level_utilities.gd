extends Node2D
var navigation_mesh: NavigationPolygon
var source_geometry: NavigationMeshSourceGeometryData2D
var callback_parsing: Callable
var callback_baking: Callable
var region_rid: RID

# Called when the node enters the scene tree for the first time.
#closely following example at https://docs.godotengine.org/en/stable/tutorials/navigation/navigation_using_navigationmeshes.html
func _ready():
	navigation_mesh=NavigationPolygon.new()
	navigation_mesh.agent_radius=10.0
	source_geometry=NavigationMeshSourceGeometryData2D.new()
	callback_parsing=on_parsing_done
	callback_baking=on_baking_done
	region_rid=NavigationServer2D.region_create()
	NavigationServer2D.region_set_enabled(region_rid,true)
	NavigationServer2D.region_set_map(region_rid,get_world_2d().get_navigation_map())
	parse_source_geometry.call_deferred()

func parse_source_geometry():
	source_geometry.clear()
	var root_node: Node2D=self
	NavigationServer2D.parse_source_geometry_data(navigation_mesh,source_geometry,root_node,callback_parsing)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_parsing_done():
	source_geometry.add_traversable_outline(PackedVector2Array([
		Vector2(0.0,0.0),
		Vector2(1200.0,0.0),
		Vector2(1200.0,1100.0),
		Vector2(0.0,1100.0)
	]))
	NavigationServer2D.bake_from_source_geometry_data_async(
		navigation_mesh,
		source_geometry,
		callback_baking
	)

func on_baking_done():
	NavigationServer2D.region_set_navigation_polygon(region_rid,navigation_mesh)
	print("Baking finished!")


extends Node2D

@onready var terrain_layer = $"TerrainLayer (TileMapLayer)"
@onready var player = $Player
var player_grid_pos = Vector2i(0, 0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("player position: ", player.position)
	player_grid_pos = terrain_layer.local_to_map(player.position)
	print("player_grid_pos: ", player_grid_pos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			var global_mouse_pos = get_global_mouse_position()
			var grid_pos = terrain_layer.local_to_map(global_mouse_pos)
			var dx = abs(grid_pos.x - player_grid_pos.x)
			var dy = abs(grid_pos.y - player_grid_pos.y)
			print("dx: ", dx, " dy: ", dy)
			if dx <= 1 and dy <= 1 and (dx + dy) > 0:
				print("MOVING!!")
				# it's adjacent baby, move
				player_grid_pos = grid_pos
				var target_position = terrain_layer.map_to_local(grid_pos)
				player.position = target_position
				print("Grid position: ", grid_pos)

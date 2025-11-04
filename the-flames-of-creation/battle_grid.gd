extends Node2D

@onready var terrain_layer = $"TerrainLayer (TileMapLayer)"
@onready var player = $Player
@onready var enemy = $Enemy
var player_grid_pos = Vector2i(0, 0)
var enemy_grid_pos = Vector2i(2, 2)
var current_turn = "player"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("player position: ", player.position)
	player_grid_pos = terrain_layer.local_to_map(player.position)
	print("player_grid_pos: ", player_grid_pos)
	enemy_grid_pos = terrain_layer.local_to_map(enemy.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and current_turn == "player":
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
				current_turn = "enemy"
				enemy_turn()

func enemy_turn() -> void:
	print("Enemy turn begun!")
	var dx = player_grid_pos.x - enemy_grid_pos.x
	var dy = player_grid_pos.y - enemy_grid_pos.y
	print("MOVING!!")
	# it's adjacent baby, move
	var new_grid_pos = enemy_grid_pos + Vector2i(sign(dx), sign(dy))
	enemy_grid_pos = new_grid_pos
	var target_position = terrain_layer.map_to_local(new_grid_pos)
	enemy.position = target_position
	current_turn = "player"

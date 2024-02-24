extends Node

@onready var mob_spawner = $MobSpawner
@onready var game_over_display = $GameOver
@onready var hud = $HUD

var points = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	EventBus.mob_dead.connect(dead_mob_counter)

func _on_base_game_is_over():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	var gun = find_child("Gun")
	
	gun.hide()
	mob_spawner.hide()
	hud.hide()
	game_over_display.show()

func dead_mob_counter():
	points += 1

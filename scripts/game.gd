extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_base_game_is_over():
	var gun = find_child("Gun")
	var mob_spawner = find_child("MobSpawner")
	var game_over_display = find_child("GameOver")
	gun.hide()
	mob_spawner.hide()
	game_over_display.show()

	

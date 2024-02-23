extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

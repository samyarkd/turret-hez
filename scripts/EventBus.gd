extends Node

signal mob_dead

var user_session: NakamaSession

func _process(delta):
	if get_tree().current_scene:
		var current_scene_name = get_tree().current_scene.name
		if user_session and current_scene_name == 'Auth':
			get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		elif !user_session and current_scene_name != 'Auth':
			get_tree().change_scene_to_file("res://scenes/auth.tscn")

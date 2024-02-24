extends Area2D
@onready var fire_aim = $FireAim
@onready var aim_angle = $AimAngle
@onready var tower_top_effect = $"../Sprite2D/Sprite2D3/TowerTopEffect"

@export var bullet_scene : PackedScene

@export var bullet_speed = 1000
@export var fire_rate = 0.2
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

var can_fire = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse = get_global_mouse_position()
	look_at(mouse)
	
	if Input.is_action_pressed("shoot") and can_fire:
		# spawn a bullet
		var bullet_instance = bullet_scene.instantiate()
		bullet_instance.position = Vector2.ZERO
		bullet_instance.set_roatation(rotation)
		# add bullet to the root
		tower_top_effect.play()
		audio_stream_player_2d.play()
		get_parent().add_child(bullet_instance)
		
		# set a fire rate
		can_fire = false
		await get_tree().create_timer(fire_rate).timeout
		can_fire = true



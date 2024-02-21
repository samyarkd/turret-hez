extends Area2D
@onready var fire_aim = $FireAim
@onready var aim_angle = $AimAngle

@export var bullet_scene : PackedScene

@export var bullet_speed = 1000
@export var fire_rate = 0.2

var can_fire = true

# Called when the node enters the scene tree for the first time.
func _ready():
	center_gun()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	center_gun()
	
	var mouse = get_global_mouse_position()
	look_at(mouse)
	
	if Input.is_action_pressed("shoot") and can_fire:
		# spawn a bullet
		var bullet_instance = bullet_scene.instantiate()
		bullet_instance.position = fire_aim.global_position
		bullet_instance.set_roatation(rotation)
		# add bullet to the root
		get_parent().add_child(bullet_instance)
		
		# set a fire rate
		can_fire = false
		await get_tree().create_timer(fire_rate).timeout
		can_fire = true

# center gun in the viewport
func center_gun():
	position.x = get_viewport_rect().size.x/2
	position.y = get_viewport_rect().size.y/2

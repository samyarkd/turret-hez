extends RigidBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@export var speed = 350

signal collided_with_mob

var gun_rotation = 0

func _ready():
	rotation = gun_rotation
	apply_impulse(Vector2(speed,0).rotated(gun_rotation))
	

func set_roatation(custom_rotation: float):
	gun_rotation = custom_rotation


func _on_body_entered(body):
	if body.is_in_group('MobBot'):
		collided_with_mob.emit()
		queue_free()
		body.death()

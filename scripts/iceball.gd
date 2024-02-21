extends RigidBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var speed = 350

var gun_rotation = 0

func _ready():
	rotation = gun_rotation
	apply_impulse(Vector2(speed,0).rotated(gun_rotation))
	

func set_roatation(custom_rotation: float):
	gun_rotation = custom_rotation


func _on_body_entered(body):
	queue_free()
	body.death()

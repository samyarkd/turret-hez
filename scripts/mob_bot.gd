extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

@export var movement_speed = 200.0
@export var knockback_recovery = 3.5

var knockback = Vector2.ZERO
var is_dead = false

func _physics_process(_delta):
	if !is_dead:
		var vpr = get_viewport_rect().size
		var center = Vector2(vpr.x/2, vpr.y/2)
		
		knockback = knockback.move_toward(Vector2.ZERO, knockback_recovery)
		var direction = global_position.direction_to(center)
		velocity = direction*movement_speed
		velocity += knockback
		move_and_slide()
		if direction.x < 0.1:
			sprite.flip_h = true
		elif direction.x > -0.1:
			sprite.flip_h = false

func death():
	sprite.play("death")
	is_dead = true


func sprite_animation_finished():
	if is_dead and sprite.animation == 'death':
		queue_free()

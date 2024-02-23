extends Area2D

signal game_is_over

@export var hp = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	center_position()

# center gun in the viewport
func center_position():
	position.x = get_viewport_rect().size.x/2
	position.y = get_viewport_rect().size.y/2

func hurt():
	hp -= 1
	if hp == 0:
		game_over()

func game_over():
	queue_free()
	game_is_over.emit()

# keeping trak of mobs that collided with the base
var mobbot_collisions = {}
func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body.is_in_group('MobBot'):
			var mobbot_id = body.get_instance_id()  # Unique identifier for each MobBot
			if mobbot_collisions.has(mobbot_id):
				continue  # Skip if already collided

			hurt()
			body.death()
			mobbot_collisions[mobbot_id] = true  # Mark as collided

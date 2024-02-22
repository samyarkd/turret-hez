extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	center_position()

# center gun in the viewport
func center_position():
	position.x = get_viewport_rect().size.x/2
	position.y = get_viewport_rect().size.y/2

extends CanvasLayer

@onready var mob_killed_label = $Panel/MobKilledLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mob_killed_label.text = str("Points: %d" % get_parent().points)

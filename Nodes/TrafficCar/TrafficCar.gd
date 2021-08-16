extends "res://Nodes/Car/Car.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.frame = randi() % 8
	position.y = 58


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

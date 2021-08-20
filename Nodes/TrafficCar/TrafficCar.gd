extends "res://Nodes/Car/Car.gd"

signal collision

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.frame = randi() % 8
	position.y = 58


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_shape_entered(area_id, area, area_shape, local_shape):
	emit_signal("collision")

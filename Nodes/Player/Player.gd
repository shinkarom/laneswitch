extends "res://Nodes/Car/Car.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.frame = Globals.player_frame


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

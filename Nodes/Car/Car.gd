extends Node2D


export(int) var lane = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = Globals.lane_offsets[lane]+58

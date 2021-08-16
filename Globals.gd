extends Node

signal speed_changed

const speed_delta = 10
const cars_for_speed_increase = 4
const lane_offsets = [50, 230, 420]
const distance_between_rows = 30

var speed = 150 setget speed_set
var player_frame = 8

func speed_set(new_value):
	speed = new_value
	emit_signal("speed_changed",new_value)

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

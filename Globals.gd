extends Node

signal speed_changed
signal score_changed

const speed_delta = 10
const rows_for_speed_increase = 4
const score_delta = 1
const rows_for_score_increase = 1
const lane_offsets = [50, 230, 420]
const distance_between_rows = 30
const start_speed = 150

var speed = start_speed setget speed_set
var score = 0 setget score_set
var player_frame = 8
var speed_row_tally = 0
var score_row_tally = 0

func speed_set(new_value):
	speed = new_value
	emit_signal("speed_changed",new_value)
	
func score_set(new_value):
	score = new_value
	emit_signal("score_changed",new_value)

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

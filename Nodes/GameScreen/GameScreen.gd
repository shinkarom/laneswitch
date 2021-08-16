extends Node2D


var TrafficCar = load("res://Nodes/TrafficCar/TrafficCar.tscn")
var TrafficRow = load("res://Nodes/TrafficRow/TrafficRow.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	_on_Globals_speed_changed(Globals.speed)
	create_row()
	$ScoreLabel.raise()
	$SpeedLabel.raise()

func create_row():
	var row = TrafficRow.instance()
	add_child(row)
	row.connect("moved_onscreen", self, "row_onscreen")

func row_onscreen():
	create_row()
	$ScoreLabel.raise()
	$SpeedLabel.raise()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event.is_action_released("ui_left"):
		if $Player.lane > 0:
			$Player.lane -= 1
	else: if event.is_action_released("ui_right"):
		if $Player.lane < 2:
			$Player.lane += 1

func _on_Globals_speed_changed(new_value):
	$Highway.scroll_speed = new_value
	$SpeedLabel.text = "Speed: "+str(new_value/10)

func _on_GameScreen_tree_entered():
	Globals.connect("speed_changed",self,"_on_Globals_speed_changed")

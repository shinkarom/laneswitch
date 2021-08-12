extends Node2D


var TrafficCar = load("res://Nodes/TrafficCar/TrafficCar.tscn")
var tcar

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	_on_Globals_speed_changed(Globals.speed)
	tcar = TrafficCar.instance()
	add_child(tcar)
	$ScoreLabel.raise()
	$SpeedLabel.raise()
	tcar.lane = randi() % 3
	tcar.position.y = 600+58

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

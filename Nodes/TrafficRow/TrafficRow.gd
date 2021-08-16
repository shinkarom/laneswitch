extends Node2D

signal moved_onscreen
var TrafficCar = load("res://Nodes/TrafficCar/TrafficCar.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 0
	position.y = 800
	if randi()%2 == 0: create_car(0)
	if randi()%2 == 0:create_car(1)
	if randi()%2 == 0:create_car(2)

func create_car(lane):
	var tcar = TrafficCar.instance()
	tcar.lane = lane
	add_child(tcar)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var oldy = position.y
	position.y -= Globals.speed * delta
	var z = 550
	if oldy >= z and position.y < z:
		emit_signal("moved_onscreen")
	if position.y < -150:
		queue_free()

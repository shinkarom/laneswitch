extends Node2D

signal moved_onscreen
signal moved_offscreen
signal collision
var TrafficCar = load("res://Nodes/TrafficCar/TrafficCar.tscn")

var is_empty = false

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 0
	position.y = 800

func init(num):
	if num == 0 : is_empty = true
	if (num & 4) != 0: create_car(0)
	if (num & 2) != 0: create_car(1)
	if (num & 1) != 0: create_car(2)

func create_car(lane):
	var tcar = TrafficCar.instance()
	tcar.connect("collision",self,"collision")
	tcar.lane = lane
	add_child(tcar)

func collision():
	emit_signal("collision")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var oldy = position.y
	position.y -= Globals.speed * delta
	var z = 550
	if oldy >= z and position.y < z:
		emit_signal("moved_onscreen", is_empty)
	if position.y < -150:
		emit_signal("moved_offscreen", is_empty)
		queue_free()

extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_up():
	get_tree().change_scene("res://Nodes/MainMenu/MainMenu.tscn")

func _input(event):
	if event.is_action_released("ui_left"):
		_on_ButtonPrevious_button_up()
	else: if event.is_action_released("ui_right"):
		_on_ButtonNext_button_up()

func _on_ButtonNext_button_up():
	var f = Globals.player_frame
	f = f+1
	if f > 11:
		f = 8
	$Player/Sprite.frame = f
	Globals.player_frame = f


func _on_ButtonPrevious_button_up():
	var f = Globals.player_frame
	f = f-1
	if f < 8:
		f = 11
	$Player/Sprite.frame = f
	Globals.player_frame = f

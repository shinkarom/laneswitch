extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$SoundButton.pressed = not AudioServer.is_bus_mute(2)
	$MusicButton.pressed = not AudioServer.is_bus_mute(1)
	$MusicSlider.value = db2linear(AudioServer.get_bus_volume_db(1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_up():
	get_tree().change_scene("res://Nodes/MainMenu/MainMenu.tscn")
	GlobalMusic.playButtonSound()

func _input(event):
	if event.is_action_released("ui_left"):
		_on_ButtonPrevious_button_up()
	else: if event.is_action_released("ui_right"):
		_on_ButtonNext_button_up()

func _on_ButtonNext_button_up():
	GlobalMusic.playButtonSound()
	var f = Globals.player_frame
	f = f+1
	if f > 11:
		f = 8
	$Player/Sprite.frame = f
	Globals.player_frame = f


func _on_ButtonPrevious_button_up():
	GlobalMusic.playButtonSound()
	var f = Globals.player_frame
	f = f-1
	if f < 8:
		f = 11
	$Player/Sprite.frame = f
	Globals.player_frame = f


func _on_CheckButton_toggled(button_pressed):
	GlobalMusic.playButtonSound()
	AudioServer.set_bus_mute(2,not button_pressed)


func _on_MusicSlider_value_changed(value):
	AudioServer.set_bus_volume_db(1,linear2db(value))


func _on_MusicButton_toggled(button_pressed):
	GlobalMusic.playButtonSound()
	AudioServer.set_bus_mute(1,not button_pressed)


func _on_MusicSlider_mouse_exited():
	$MusicSlider.release_focus()

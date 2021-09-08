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


func _on_QuitButton_button_up():
	GlobalMusic.playButtonSound()
	get_tree().quit()


func _on_PlayButton_button_up():
	get_tree().change_scene("res://Nodes/GameScreen/GameScreen.tscn")
	GlobalMusic.playButtonSound()


func _on_CreditsButton_button_up():
	get_tree().change_scene("res://Nodes/Credits/Credits.tscn")
	GlobalMusic.playButtonSound()

func _on_SettingsButton_button_up():
	get_tree().change_scene("res://Nodes/Settings/Settings.tscn")
	GlobalMusic.playButtonSound()

func _on_HelpButton_button_up():
	get_tree().change_scene("res://Nodes/HelpScreen/HelpScreen.tscn")
	GlobalMusic.playButtonSound()
	

extends PopupDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true


func _unhandled_input(event):
	if event.is_action_released("ui_cancel"):
		_on_ContinueButton_pressed()

func _on_ContinueButton_pressed():
	get_tree().paused = false
	queue_free()

func _on_RestartButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Nodes/GameScreen/GameScreen.tscn")


func _on_QuitButton_pressed():
	get_tree().paused = false
	get_tree().quit()


func _on_MainMenuButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Nodes/MainMenu/MainMenu.tscn")

extends PopupDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$GameOverScoreLabel.text = "Score: "+ str(Globals.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_RestartButton_pressed():
	GlobalMusic.playButtonSound()
	get_tree().paused = false
	get_tree().change_scene("res://Nodes/GameScreen/GameScreen.tscn")


func _on_QuitButton_pressed():
	GlobalMusic.playButtonSound()
	get_tree().paused = false
	get_tree().quit()


func _on_MainMenuButton_pressed():
	GlobalMusic.playButtonSound()
	get_tree().paused = false
	get_tree().change_scene("res://Nodes/MainMenu/MainMenu.tscn")

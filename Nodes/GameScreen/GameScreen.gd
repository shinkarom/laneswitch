extends Node2D


var TrafficCar = load("res://Nodes/TrafficCar/TrafficCar.tscn")
var TrafficRow = load("res://Nodes/TrafficRow/TrafficRow.tscn")
var this_row = 0

func _ready():
	randomize()
	Globals.score = 0
	Globals.speed_row_tally = 0
	Globals.score_row_tally = 0
	Globals.speed = Globals.start_speed
	_on_Globals_speed_changed(Globals.speed)
	create_row(this_row)
	$ScoreLabel.raise()
	$SpeedLabel.raise()
	GlobalMusic.playGameMusic()
	$Tween.interpolate_property($StartLabel, "custom_colors/font_color:a8", 255, 0,
	 2,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,2)
	$Tween.start()

func create_row(num):
	var row = TrafficRow.instance()
	row.init(num)
	add_child(row)
	this_row = num
	row.connect("moved_onscreen", self, "row_onscreen")
	row.connect("moved_offscreen", self, "row_offscreen")
	row.connect("collision",self,"row_collision")

func next_row(num):
	var ar
	match num:
		0: ar = [1, 2, 3, 4, 5, 6]
		1: ar = [0, 1, 2, 3, 4, 5]
		2: ar = [0, 2]
		3: ar = [0, 1, 2, 3]
		4: ar = [0, 1, 2, 4, 6]
		5: ar = [0, 1, 4]
		6: ar = [0, 2, 4, 6]
		_: ar = [7]
	return ar[randi() % ar.size()]

func row_onscreen(empty):
	create_row(next_row(this_row))
	$ScoreLabel.raise()
	$SpeedLabel.raise()

func row_offscreen(empty):
	Globals.speed_row_tally += 1
	if not empty:
		Globals.score_row_tally += 1
	if Globals.speed_row_tally >= Globals.rows_for_speed_increase:
		Globals.speed_row_tally -= Globals.rows_for_speed_increase
		Globals.speed += Globals.speed_delta
	if Globals.score_row_tally >= Globals.rows_for_score_increase:
		Globals.score_row_tally -= Globals.rows_for_score_increase
		Globals.score += Globals.score_delta

func row_collision():
	get_tree().paused = true
	$ScoreLabel.visible = false
	$SpeedLabel.visible = false
	GlobalMusic.stop()
	var GameOverPopup = load("res://Nodes/GameOverPopup/GameOverPopup.tscn").instance()
	add_child(GameOverPopup)
	GameOverPopup.popup_centered()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event.is_action_released("ui_cancel"):
		get_tree().set_input_as_handled()
		var PauseMenu = load("res://Nodes/PauseMenu/PauseMenu.tscn").instance()
		add_child(PauseMenu)
		PauseMenu.popup_centered()
	if event.is_action_released("ui_left"):
		if $Player.lane > 0:
			$Player.lane -= 1
	else: if event.is_action_released("ui_right"):
		if $Player.lane < 2:
			$Player.lane += 1

func _on_Globals_speed_changed(new_value):
	$Highway.scroll_speed = new_value
	$SpeedLabel.text = "Speed: "+str(new_value/10)

func _on_Globals_score_changed(new_value):
	$ScoreLabel.text = "Score: "+ str(new_value)

func _on_GameScreen_tree_entered():
	Globals.connect("speed_changed",self,"_on_Globals_speed_changed")
	Globals.connect("score_changed",self,"_on_Globals_score_changed")

func restart():
	get_tree().paused = false
	get_tree().change_scene("res://Nodes/GameScreen/GameScreen.tscn")

func main_menu():
	get_tree().paused = false
	get_tree().change_scene("res://Nodes/MainMenu/MainMenu.tscn")

func quit():
	get_tree().paused = false
	get_tree().quit()

func _on_RestartButton_button_up():
	restart()

func _on_MainMenuButton_button_up():
	main_menu()


func _on_QuitButton_button_up():
	quit()


func _on_GameScreen_tree_exited():
	GlobalMusic.playMenuMusic()

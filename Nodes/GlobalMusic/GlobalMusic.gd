extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	playMenuMusic()

func playMenuMusic():
	play("menu.mp3")

func playGameMusic():
	pass
	
func playButtonSound():
	pass

func play(filename):
	var loaded_stream = load("res://audio/"+filename)
	$AudioStreamPlayer.stream = loaded_stream
	$AudioStreamPlayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

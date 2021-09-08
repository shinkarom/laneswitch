extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	playMenuMusic()

func playMenuMusic():
	$MusicStreamPlayer.stop()
	playMusic("bensound-happyrock.mp3")

func playGameMusic():
	$MusicStreamPlayer.stop()
	playMusic("summerintown.mp3")
	
func playButtonSound():
	$SoundStreamPlayer.stop()
	playSound("click1.ogg")

func playMusic(filename):
	var loaded_stream = load("res://audio/"+filename)
	$MusicStreamPlayer.stream = loaded_stream
	$MusicStreamPlayer.play()

func playSound(filename):
	var loaded_stream = load("res://audio/"+filename)
	$SoundStreamPlayer.stream = loaded_stream
	$SoundStreamPlayer.play()

func stop():
	$MusicStreamPlayer.stop()
	$SoundStreamPlayer.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

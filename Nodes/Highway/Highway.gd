extends ParallaxBackground

export(int) var scroll_speed = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var half = 300
	var amount = scroll_speed * delta
	var new_y = $ParallaxLayer/Sprite.offset.y - amount
	if new_y < -600:
		new_y += 600
	$ParallaxLayer/Sprite.offset.y = new_y

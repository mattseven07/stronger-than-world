extends Camera2D

@export var shake_strength := 6.0
@export var shake_duration := 0.2

var shake_time := 0.0

func shake():
	shake_time = shake_duration

func _process(delta):
	if shake_time > 0:
		shake_time -= delta
		offset = Vector2(
			randf_range(-shake_strength, shake_strength),
			randf_range(-shake_strength, shake_strength)
		)
	else:
		offset = Vector2.ZERO

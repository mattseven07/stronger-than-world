extends Node2D

@export var sink_distance := 96
@export var sink_speed := 250.0
@export var restore_delay := 1.0

var original_y := 0.0
var active := false

func _ready():
	original_y = position.y

func sink():
	if active:
		return
	active = true

	var tween := create_tween()
	tween.tween_property(
		self,
		"position:y",
		original_y + sink_distance,
		sink_distance / sink_speed
	)

	tween.finished.connect(_restore)

func _restore():
	await get_tree().create_timer(restore_delay).timeout

	var tween := create_tween()
	tween.tween_property(
		self,
		"position:y",
		original_y,
		sink_distance / sink_speed
	)

	tween.finished.connect(func(): active = false)

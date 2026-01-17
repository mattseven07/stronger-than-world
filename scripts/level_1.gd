extends Node2D

@export_file("*.tscn") var next_level

@onready var fade_rect := $CanvasLayer/ColorRect

func fade_and_next_level():
	var tween := create_tween()
	tween.tween_property(fade_rect, "color:a", 1.0, 0.6)
	tween.finished.connect(_load_next_level)

func _load_next_level():
	if next_level == "":
		push_error("Next level not assigned!")
		return

	get_tree().change_scene_to_file(next_level)

extends Node2D

@export var ground_to_move: Node2D
@export var move_amount := -64
@export var move_speed := 200.0

var triggered := false

func _ready():
	$GapTrigger.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if triggered:
		return

	if body.is_in_group("player"):
		triggered = true
		var cam := get_viewport().get_camera_2d()
		if cam and cam.has_method("shake"):
			cam.shake()
		move_platform()

func move_platform():
	if ground_to_move == null:
		push_error("No ground assigned to GapPuller!")
		return

	var target_y := ground_to_move.position.y + move_amount

	var tween := create_tween()
	tween.tween_property(
		ground_to_move,
		"position:y",
		target_y,
		abs(move_amount) / move_speed
	)

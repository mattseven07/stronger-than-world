extends Area2D

@export var ground_move: Node2D
@export var move_amount := -64
@export var move_speed := 800.0

var triggered := false
@onready var particles := $GapParticles

func _on_body_entered(body):
	if triggered:
		return

	if body.is_in_group("player"):
		triggered = true
			# 🔥 Screen shake
		var cam := get_viewport().get_camera_2d()
		if cam and cam.has_method("shake"):
			cam.shake()

		# 💥 Particles
		if particles:
			particles.restart()
		move_platform()

func move_platform():
	if ground_move == null:
		push_error("GroundMove not assigned")
		return

	var target_x := ground_move.position.x + move_amount

	var tween := create_tween()
	tween.tween_property(
		ground_move,
		"position:x",
		target_x,
		abs(move_amount) / move_speed
	)

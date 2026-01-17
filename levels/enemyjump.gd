extends Area2D

@export var gap_puller: Node2D  # the node that closes the gap

func _ready():
	body_entered.connect(_on_gap_jump_trigger_body_entered)

func _on_gap_jump_trigger_body_entered(body):
	# ENEMY → jump the gap
	if body.is_in_group("enemy"):
		if body.has_method("jump_gap"):
			body.jump_gap()
	
	# PLAYER → close the gap
	elif body.is_in_group("player"):
		if gap_puller and gap_puller.has_method("move_platform"):
			gap_puller.move_platform()

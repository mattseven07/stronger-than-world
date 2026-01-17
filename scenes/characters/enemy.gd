extends CharacterBody2D

@export var speed := 120.0
@export var jump_force := -200.0

var fleeing := false
var flee_dir := 1

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	if fleeing:
		velocity.x = flee_dir * speed
	else:
		velocity.x = 0

	move_and_slide()

func _on_vision_body_entered(body):
	if body.is_in_group("player"):
		flee_dir = sign(global_position.x - body.global_position.x)
		if flee_dir == 0:
			flee_dir = 1
		fleeing = true

func jump_gap():
	if is_on_floor():
		velocity.y = jump_force

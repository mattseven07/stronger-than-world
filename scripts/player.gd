extends CharacterBody2D

@onready var camera := $Camera2D
@onready var animated_sprite: AnimatedSprite2D = $Sprite2D
@onready var sfx_walk :=$sfx_walk

const SPEED       = 100.0
const JUMP_VELOCITY = -250.0   # usually a bit stronger feels better

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump (better to use custom action name)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Horizontal movement
	var direction := Input.get_axis("left", "right")
	
	if direction != 0:
		velocity.x = direction * SPEED
		sfx_walk.play()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * 2)  # faster stop feels better
		sfx_walk.stop()

	# ───────────────────────────────────────
	# Animation logic
	# ───────────────────────────────────────
	
	# Flip sprite when going left
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	if is_on_floor():
		if direction != 0:
			animated_sprite.play("walk")
		else:
			animated_sprite.play("idle")     # ← you need an "idle" animation!
	else:
		# In air
		if velocity.y < 0:
			animated_sprite.play("jump")     # ← optional: need "jump" anim
		else:
			animated_sprite.play("fall")     # ← optional: need "fall" anim

	move_and_slide()

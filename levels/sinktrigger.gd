extends Area2D

@export var sinkplatform: Node2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):
		if sinkplatform and sinkplatform.has_method("sink"):
			sinkplatform.sink()

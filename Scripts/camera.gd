extends Camera2D

@export var follow_speed: float = 1
@export var follow_offset: Vector2 = Vector2(0, 0)

@export var player: Node2D

func _process(delta):
	if player:
		var target_position = player.global_position + follow_offset
		global_position = global_position.lerp(target_position, follow_speed * delta)

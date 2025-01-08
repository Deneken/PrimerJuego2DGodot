extends RigidBody2D


func _ready() -> void:
	var enemy_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	var random_type_number = randi_range(0, enemy_types.size() - 1) # Da el total(size) 0 a 3, y no indice, por eso el -1 (0 a 2)
	$AnimatedSprite2D.play(enemy_types[random_type_number])
	


func _process(delta: float) -> void:
	pass

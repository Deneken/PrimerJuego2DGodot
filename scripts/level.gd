extends Node


@export var enemy_scene: PackedScene


func _ready() -> void:
	new_game()

func _on_timer_timeout() -> void:
	#print("Crear enemigo")
	var enemy = enemy_scene.instantiate()
	
	# Cada enemigo se pociciona en el valor dado Ejemplo(100,100)
	enemy.position = Vector2(100,100)
	
	add_child(enemy)
	#print(enemy)


# Poscion del player
func new_game():
	$Player.position = $Marker2D.position

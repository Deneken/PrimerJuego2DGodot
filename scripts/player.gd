extends Area2D

# Variables
@export_category("Variables")
@export var speed:int = 350
var screen_size # Para que no se escape de la pantalla



# Main
func _ready() -> void:
	screen_size = get_viewport_rect().size
	



# Procesos c/d Frame -> Detectar eventos = Precionar Teclas
func _process(delta: float) -> void:
	# Resumir todo lo de arriba
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") # get_vector normaliza los diagonales
	if direction: # vector2(1,0)
		position += direction * speed * delta
		# Animaciones Derecha - Izquieda
		if direction.x:
			$AnimatedSprite2D.flip_v = false
			$AnimatedSprite2D.play("walk")
			$AnimatedSprite2D.flip_h = direction.x < 0
		# Animaciones Arriba - Abajo y Diagonal
		elif direction.y:
			$AnimatedSprite2D.play("up")
			$AnimatedSprite2D.flip_v = direction.y > 0
	# Rango de la pantalla
	position = position.clamp(Vector2.ZERO, screen_size)
	

	


func _on_area_entered(area: Area2D) -> void:
	print("Toque un enemigo")
	area.queue_free()

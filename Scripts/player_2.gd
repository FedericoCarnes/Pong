extends CharacterBody2D

var speed = 300
var direction = Vector2.ZERO

func _physics_process(delta: float) -> void:
	# Capturar entrada solo en el eje Y
	direction.y = Input.get_action_strength("s") - Input.get_action_strength("w")
	
	# Asignar velocidad en Y y mover
	velocity.y = direction.y * speed
	move_and_slide()

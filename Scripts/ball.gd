extends CharacterBody2D

var speed = 300

func _ready():
	inicializar()

func inicializar():
	if randi() % 2 == 0:
		velocity.x = 1
	else:
		velocity.x = -1
	
	if randi() % 2 == 0:
		velocity.y = 1
	else:
		velocity.y = -1
	velocity *= speed

func _physics_process(delta: float):
	var info = move_and_collide(velocity * delta)
	if info:
		velocity = velocity.bounce(info.get_normal())

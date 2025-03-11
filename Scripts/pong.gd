extends Node2D

const CENTER = Vector2(640,360)
var puntaje1 = -2
var puntaje2 = -2
var music = Autoload.music
var dificulty = Autoload.dificulty

func _ready():
	print (music)
	if music:
		$Music.play()
	actualizarDificultad()
	var player = get_node("Player2")
	var ia = get_node("Ia")
	
	if player && ia:
		if Autoload.modePlay == 1:
			player.visible = false
			ia.visible = true
		else:
			player.visible = true
			ia.visible = false

func actualizarDificultad():
	if dificulty == 1:
		$Ia.speed = 300
		$Ball.speed = 340
	elif dificulty == 2:
		$Ia.speed = 390
		$Ball.speed = 440
	else:
		$Ia.speed = 440
		$Ball.speed = 540

func _on_pared_izq_body_entered(body: Node2D) -> void:
	puntaje1 += 1
	$PlayerScore.text = str(puntaje1)
	reset()


func _on_pared_der_body_entered(body: Node2D) -> void:
	puntaje2 += 1
	$PlayerScore2.text = str(puntaje2)
	reset()

func reset():
	$Ball.call("inicializar")
	$Ball.position = CENTER
	$Player.position.y = CENTER.y
	$Player2.position.y = CENTER.y
	$Ia.position.y = CENTER.y

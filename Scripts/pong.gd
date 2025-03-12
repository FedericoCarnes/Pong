extends Node2D

const CENTER = Vector2(640,360)
var puntaje1 = -2
var puntaje2 = -2
var music = Autoload.music
var dificulty = Autoload.dificulty
var puntajeMax = 5


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
	if puntaje1 >= puntajeMax:
		ganar()
	else:
		reset()
		$PlayerScore2.text = str(puntaje1)


func _on_pared_der_body_entered(body: Node2D) -> void:
	puntaje2 += 1
	if puntaje2 >= puntajeMax:
		ganar()
	else:
		reset()
		$PlayerScore2.text = str(puntaje2)

func ganar():
	var aux
	if puntaje1 > puntaje2:
		if $Ia.visible:
			aux = "Ganador ia \n" + str(puntaje1) + "-" + str(puntaje2)
		else:
			aux = "Ganador player 2 \n" + str(puntaje1) + "-" + str(puntaje2)
	else:
		aux = "Ganador player 1 \n" + str(puntaje1) + "-" + str(puntaje2)
	$MenuGanar.visible = true
	$MenuGanar/Label.text = str(aux)
	puntaje1 = 0
	puntaje2 = 0
	$PlayerScore2.text = str(puntaje1)
	$PlayerScore2.text = str(puntaje2)
	reset()
	get_tree().paused = true


func reset():
	$Ball.call("inicializar")
	$Ball.position = CENTER
	$Player.position.y = CENTER.y
	$Player2.position.y = CENTER.y
	$Ia.position.y = CENTER.y

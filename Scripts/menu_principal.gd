extends Control

var music = true

func _ready() -> void:
	$Music.play()

func _on_play_pressed() -> void:
	var menuPrincipal = get_node("VBoxContainer")
	var menuPrincipal2 = get_node("VBoxContainer2")
	
	if menuPrincipal && menuPrincipal2:
		menuPrincipal.visible = false
		menuPrincipal2.visible = true

func _on_opcions_pressed() -> void:
	var menuPrincipal = get_node("VBoxContainer")
	var menuPrincipal3 = get_node("VBoxContainer3")
	
	if menuPrincipal && menuPrincipal3:
		menuPrincipal.visible = false
		menuPrincipal3.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_player_pressed() -> void:
	Autoload.modePlay = 1
	Autoload.music = music
	get_tree().change_scene_to_file("res://Escenas/cancha_pong.tscn")

func _on_players_pressed() -> void:
	Autoload.modePlay = 2
	Autoload.music = music
	get_tree().change_scene_to_file("res://Escenas/cancha_pong.tscn")


func _on_option_button_item_selected(index: int) -> void:
	if index != 0:
		Autoload.dificulty = index


func _on_atras_pressed() -> void:
	var menuPrincipal = get_node("VBoxContainer")
	var menuPrincipal3 = get_node("VBoxContainer3")
	
	if menuPrincipal && menuPrincipal3:
		menuPrincipal.visible = true
		menuPrincipal3.visible = false


func _on_check_button_toggled(toggled_on: bool) -> void:
	Autoload.music = toggled_on
	music = toggled_on
	if toggled_on:
		$Music.play()
	else:
		$Music.stop()

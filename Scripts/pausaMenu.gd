extends CanvasLayer

func _physics_process(delta: float):
	if Input.is_action_just_pressed("pausa"):
		pausa()

func _on_button_pressed() -> void:
	pausa()

func _on_play_pressed() -> void:
	pausa()

func _on_opcions_pressed() -> void:
	var menuPrincipal = get_node("VBoxContainer")
	var menuPrincipal3 = get_node("VBoxContainer3")
	
	if menuPrincipal && menuPrincipal3:
		menuPrincipal.visible = false
		menuPrincipal3.visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_option_button_item_selected(index: int) -> void:
	if index != 0:
		Autoload.dificulty = index
	get_parent().actualizarDificultad()

func _on_atras_pressed() -> void:
	var menuPrincipal = get_node("VBoxContainer")
	var menuPrincipal3 = get_node("VBoxContainer3")
	
	if menuPrincipal && menuPrincipal3:
		menuPrincipal.visible = true
		menuPrincipal3.visible = false

func _on_check_button_toggled(toggled_on: bool) -> void:
	Autoload.music = toggled_on
	if toggled_on:
		get_parent().get_node("Music").play()
	else:
		get_parent().get_node("Music").stop()

func pausa():
	get_tree().paused = not get_tree().paused
	$ColorRect.visible = not $ColorRect.visible
	if $VBoxContainer.visible:	
		$VBoxContainer.visible = not $VBoxContainer.visible
	elif $VBoxContainer3.visible:
		$VBoxContainer3.visible = not $VBoxContainer3.visible
	else:
		$VBoxContainer.visible = not $VBoxContainer.visible


func _on_reset_pressed() -> void:
	get_tree().reload_current_scene()

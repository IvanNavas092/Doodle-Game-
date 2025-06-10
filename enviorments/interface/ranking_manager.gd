extends MarginContainer

@onready var loading_screen = preload("res://enviorments/interface/loading.tscn")
@onready var leaderboard_screen = preload("res://enviorments/interface/leaderboard.tscn")
@onready var header = $"../header"
@onready var alert = $VBoxContainer/alert
@onready var name_alert = $VBoxContainer/name_alert



func _ready() -> void:
	# Conectar la señal al inicio para no perderla
	if not SilentWolf.Scores.is_connected("sw_scores_received", Callable(self, "_on_scores_received")):
		SilentWolf.Scores.connect("sw_scores_received", Callable(self, "_on_scores_received"))
		print_debug("✅ Señal 'sw_scores_received' conectada al iniciar.")

func _on_submit_btn_pressed() -> void:
	var player_name = $VBoxContainer/name_input.text.strip_edges()
	var loading_scene = loading_screen.instantiate()
	if player_name != '':
		alert.hide()
		$VBoxContainer.add_child(loading_scene)

		# Comprobar si la puntuación es mayor que 0
		if Global.highscore > 0:
			# Guardar la puntuación solo si es mayor que 0
			SilentWolf.Scores.save_score(player_name, Global.highscore)
			print_debug("✅ Puntuación guardada:", player_name)
		else:
			# Mostrar alerta si la puntuación es 0
			print_debug("❌ Puntuación no guardada, ya que es 0.")
			name_alert.show()
		
		
		await get_tree().create_timer(1).timeout  
		var sw_result: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
		print("Scores: " + str(sw_result.scores))
		
		#Animacion loading
		loading_scene.queue_free()
		# quitar la VBoxContainer y header.show()
		for nodes in $VBoxContainer.get_children():
			$VBoxContainer.remove_child(nodes)
			nodes.queue_free()
		header.show()


		var scores = sw_result.scores
		var idx = 1
		var scores_text = ""
		# Acceder a las puntuaciones
		for score_entry in scores:

			var items = leaderboard_screen.instantiate()
			
			# Asignar los valores a cada nodo
			items.get_node("player_position").text = '#' + str(idx)
			items.get_node("playerName").text = score_entry["player_name"]
			items.get_node("playerScore").text = str(score_entry["score"])
			$VBoxContainer.add_child(items)
			idx += 1
	else:
		alert.show()
		
func _on_retry_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")

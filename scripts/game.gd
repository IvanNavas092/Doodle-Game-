extends Node2D

@onready var platform_container = $container_platforms as Node2D
@onready var platform_initial_position_y = $container_platforms/platform.position.y
@onready var camera = $camera as Camera2D
@onready var player = $player as CharacterBody2D
@onready var score_label = $camera/score as Label
@onready var camera_start_position = $camera.position.y

@export var platform_scene: Array[PackedScene]
@export var enemy_scene: PackedScene  # Escena del enemigo

var last_platform_is_cloud = false
var score := 0
var enemy_spawned := false  # Para evitar múltiples enemigos

func level_generator(amount):
	for i in amount:
		var new_type = randi() % 4
		
		# Comprobamos si el índice es válido para platform_scene
		if new_type >= platform_scene.size():
			new_type = 0  # Aseguramos que no sea un índice fuera de rango
		
		var new_platform = null
		
		if new_type == 0:
			new_platform = platform_scene[0].instantiate() as StaticBody2D
		elif new_type == 1:
			new_platform = platform_scene[1].instantiate() as StaticBody2D
		elif new_type >= 2:
			if last_platform_is_cloud == false:
				new_platform = platform_scene[new_type].instantiate() as StaticBody2D
				new_platform.delete_object.connect(delete_object)  # Conectar la señal
				last_platform_is_cloud = true
			else:
				new_platform = platform_scene[0].instantiate() as StaticBody2D
				last_platform_is_cloud = false
		
		# Verificar que new_platform no sea null antes de usarlo
		if new_platform != null:
			platform_initial_position_y -= randf_range(190,250)  # Distancia de altura random
			new_platform.position = Vector2(randf_range(75,520), platform_initial_position_y)
			platform_container.call_deferred("add_child", new_platform)
		else:
			print("ERROR: No se pudo instanciar la plataforma con new_type =", new_type)

	# **Generar enemigo si la puntuación supera los 10000 puntos**
	if score > 100000 and not enemy_spawned:
		spawn_enemy()
		enemy_spawned = true  # Para evitar múltiples enemigos

func _ready() -> void:
	randomize()
	level_generator(50)
	
func _physics_process(delta: float) -> void:
	if player.position.y < camera.position.y:
		camera.position.y = player.position.y
	score_update()

# Eliminación de objetos
func delete_object(obstacle) -> void:
	if obstacle.is_in_group("player"): 
		Global.lastscore = score
		if score > Global.highscore:
			Global.highscore = score
		if get_tree().change_scene_to_file("res://enviorments/interface/screen_score.tscn") != OK:
			print("game over")
	elif obstacle.is_in_group("platform") or obstacle.is_in_group("enemies"): 
		obstacle.queue_free()
		level_generator(1)

# Para limpiar y generar plataformas
func _on_platform_cleaner_body_entered(body: Node2D) -> void:
	delete_object(body)
	level_generator(1)
	
func score_update(): 
	score = camera_start_position - camera.position.y
	score_label.text = str(int(score))

# **Función para generar el enemigo**
func spawn_enemy():
	if enemy_scene:
		var enemy = enemy_scene.instantiate() as CharacterBody2D
		enemy.position = Vector2(randf_range(75, 520), platform_initial_position_y - 50)  # Un poco por encima de la plataforma
		platform_container.call_deferred("add_child", enemy)
	else:
		print("ERROR: enemy_scene no está asignado en el Inspector")

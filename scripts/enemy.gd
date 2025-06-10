extends "res://scripts/ground_grass_s.gd"

var direction = Vector2.RIGHT
var velocity = Vector2.ZERO
@onready var animation = $animation as AnimatedSprite2D
@export var speed = 100
@onready var screen_size = get_viewport_rect().size


func _physics_process(delta: float) -> void:
	movement(delta)
	 

func movement(delta):
	velocity = direction * speed
	global_position += velocity * delta
	
	if not animation.is_playing():
		animation.play("default")  
		
	if global_position.x >= screen_size.x:
		direction.x = -1  # Cambiar dirección
		animation.flip_h = !animation.flip_h
	elif global_position.x <= 0:
		direction.x = 1  # Cambiar dirección
		animation.flip_h = !animation.flip_h
		
func response():
	print("Eliminando enemigo")
	emit_signal("delete_object", self)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and body.has_method("die"):
		body.die()

extends CharacterBody2D


const SPEED_DIRECTION = 600.0
const JUMP_FORCE = 500.0
@onready var animation = $animation as AnimatedSprite2D
@onready var screen_size = get_viewport_rect().size
@onready var sound = $sound_fx as AudioStreamPlayer



func move(delta: float) -> void:
# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if is_on_floor():
		velocity.y = -JUMP_FORCE
		animation.play("default")
		sound.play()
		
	if velocity.y > 0:
		animation.play("fall")
		
	var colision = move_and_collide(velocity * delta)
	if colision:
		var collider = colision.get_collider()
		if collider.has_method("get_jump_force"):
			var spring_jump_force = collider.get_jump_force()
			velocity.y = -JUMP_FORCE * spring_jump_force

				
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("mover_izq_a", "mover_derecha_d")
	if direction:
		velocity.x = direction * SPEED_DIRECTION
		animation.scale.x = abs(animation.scale.x) * direction  # Mantiene el tamaño correcto
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED_DIRECTION)


func _physics_process(delta: float) -> void:
	move(delta)
	
	"""PANTALLA BUCLE"""
	position.x = wrapf(position.x, 0, screen_size.x)
	move_and_slide()
	
func die():
	print("player Invisible")
	visible = false
	await get_tree().create_timer(5).timeout
	visible = true

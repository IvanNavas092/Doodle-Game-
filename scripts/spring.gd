extends "res://scripts/ground_grass_s.gd"


  # Ajusta el multiplicador del salto

func get_jump_force() -> float:
	return jump_force
	
func response():
	$spring.play("default")


func _on_spring_animation_finished() -> void:
	$spring.frame = 0
	$spring.play("stop")

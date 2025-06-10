extends "res://scripts/ground_grass_s.gd"


func get_jump_force() -> float:
	return jump_force
func response():
	emit_signal("delete_object", self)

extends Control

@onready var highscore = $"main/Label" as Label

func _ready() -> void:
	highscore.text = "HIGHSCORE\n" + str(Global.highscore)

func _on_startbtn_pressed() -> void:
	if get_tree().change_scene_to_file("res://game.tscn") != OK:
		print("A jugar!")


func _on_quitbtn_pressed() -> void:
	get_tree().quit()

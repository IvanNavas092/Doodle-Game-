extends Node


var highscore := 0
var lastscore := 0
var scoreId 

func _ready() -> void:
	SilentWolf.configure({
		"api_key": "tdsfz8PN9F2agazxVjP3z1V8CT3R0xcP6qdAiN1I",
		"game_id": "doodlejumpnavas",
		"log_level": 1
		
	})

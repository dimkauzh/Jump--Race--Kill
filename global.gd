extends Node

export var hearts_max = 3
var hearts = hearts_max
var hud

func lose_hearts():
	hearts -= 1
	hud.hearts()
	if hearts == 0:
		get_tree().change_scene("res://gameover.tscn")

#func add_coin():
#	hud._on_coin_col()
	

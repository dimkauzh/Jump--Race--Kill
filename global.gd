extends Node

var hearts_max = 3
var hearts = hearts_max
var hud
var player
var levels = []
var unlockedlevels = 1
#var level1_ready = false
#var level2_ready = false
var level_ready = 1

func get_level_id():
	var level_name = get_tree().get_current_scene().get_name()
	return int(level_name.replace("Level ", ""))


func hearts_scenes_level1():
	if hearts == 0:
		get_tree().change_scene("res://gameover.tscn")
	else:
		get_tree().change_scene("res://Level 1.tscn")
		
func hearts_scenes_level2():
	if hearts == 0:
		get_tree().change_scene("res://gameover.tscn")
	else:
		get_tree().change_scene("res://Level 2.tscn")
		
func hearts_scenes_level3():
	if hearts == 0:
		get_tree().change_scene("res://gameover.tscn")
	else:
		get_tree().change_scene("res://Level 3.tscn")

func hearts_scenes_level():
	if hearts == 0:
		get_tree().change_scene("res://gameover.tscn")
	else:
		get_tree().reload_current_scene()

func lose_hearts():
	hearts -= 1
	hud.load_hearts()
	if hearts == 0:
		get_tree().reload_current_scene()
		get_tree().change_scene("res://gameover.tscn")
	
func add_hearts():
	hearts += 1
	hud.load_hearts()

#func add_coin():
#	hud._on_coin_col()

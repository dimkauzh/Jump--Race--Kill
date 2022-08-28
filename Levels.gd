extends Control

func _on_Level_pressed(level):
	Global.hearts = Global.hearts_max
	get_tree().change_scene("res://Level %s.tscn" % String(level))

func _on_Back_pressed():
	get_tree().change_scene("res://Main-Menu.tscn")

func _ready():
	for level_num in Global.level_ready:
		if level_num >= $Levels.get_child_count():
			get_tree().change_scene("res://youwin.tscn")
			break
		var lv = get_node("Levels/Level %s" % String(level_num + 1))
		lv.disabled = false

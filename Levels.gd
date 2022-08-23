extends Control

func _on_Level_pressed(level):
	Global.hearts = Global.hearts_max
	get_tree().change_scene("res://Level %s.tscn" % String(level))

func _on_Back_pressed():
	get_tree().change_scene("res://Main-Menu.tscn")

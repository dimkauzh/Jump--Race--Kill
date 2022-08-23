extends Control

func _on_Button_pressed():
	get_tree().change_scene("res://Levels.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://howtoplay.tscn")


func _on_exit_pressed():
	get_tree().quit()

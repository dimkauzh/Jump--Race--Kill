extends Control

func _ready():
	$gameover.play()

func _on_Button_pressed():
	get_tree().change_scene("res://Levels.tscn")

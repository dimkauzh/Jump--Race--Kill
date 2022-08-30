extends Control

func _ready():
	$"BackGround-Music".play()

func _on_Button_pressed():
	Global.level_ready = Global.level_ready - 1
	get_tree().change_scene("res://Levels.tscn")

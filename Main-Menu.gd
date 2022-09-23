extends Control

var os = OS.get_name()

func _on_Button_pressed():
	get_tree().change_scene("res://Levels.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://howtoplay.tscn")

func _ready():
	if os == "Windows" or os == "OSX" or os == "Flash" or os == "Haiku" or os == "X11" or os == "WinRT":
		$exit.visible = true
		$exit.disabled = false

func _on_exit_pressed():
	get_tree().quit()

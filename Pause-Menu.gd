extends Control

var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("Pause-Menu"):
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = true
	get_tree().paused = is_paused
	visible = is_paused

func set_not_is_paused():
	is_paused = false
	get_tree().paused = is_paused
	visible = is_paused

func _physics_process(delta):
	get_tree().paused = is_paused
	visible = is_paused

func _on_Resume_pressed():
	self.is_paused = false
	set_not_is_paused()


func _on_Restart_pressed():
	self.is_paused = false
	get_tree().reload_current_scene()
	


func _on_Exit_pressed():
	self.is_paused = false
	get_tree().change_scene("res://Main-Menu.tscn")
	set_not_is_paused()

extends CanvasLayer

var coin = 0
var completed = false

func _ready():
	$Coin.text = String(coin)
	load_hearts()
	Global.hud = self

func load_hearts():
	$hearts.rect_size.x = Global.hearts * 53
	$nohearts.rect_size.x = (Global.hearts_max - Global.hearts) * 53
	$nohearts.rect_position.x = $hearts.rect_position.x + $hearts.rect_size.x * $hearts.rect_scale.x

func _on_Coin_coin_col():
	coin = coin + 1

	_ready()
	if coin == 16:
		var level_id = Global.get_level_id()
		if get_tree().get_current_scene().get_name() == "Level 1": get_tree().change_scene("res://Level 2.tscn")
		if get_tree().get_current_scene().get_name() == "Level 2": get_tree().change_scene("res://Level 3.tscn")
		if level_id  >= Global.level_ready:
			Global.level_ready = level_id + 1
			var string_level_id = String(level_id)

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
		if level_id  >= Global.level_ready:
			Global.level_ready = level_id + 1
		get_tree().change_scene("res://Levels.tscn")

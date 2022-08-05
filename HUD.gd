extends CanvasLayer

var coin = 0

func _ready():
	$Coin.text = String(coin)

func _on_coin_col():
	coin = coin + 1
	_ready()
	if coin == 15:
		get_tree().change_scene("res://Level 1.tscn")


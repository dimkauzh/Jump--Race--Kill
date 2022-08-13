extends CanvasLayer

var coin = 0

func _ready():
	$Coin.text = String(coin)
	#hearts()
	Global.hud = self

func _on_coin_col():
	coin = coin + 1
	_ready()
	if coin == 15:
		get_tree().change_scene("res://youwin.tscn")

func _physics_process(delta):
	hearts()

func hearts():
	$hearts.rect_size.x = Global.hearts * 36
	$nohearts.rect_size.x = (Global.hearts_max - Global.hearts) * 36
	$nohearts.rect_position.x = $hearts.rect_position.x + $hearts.rect_size.x * $hearts.rect_scale.x

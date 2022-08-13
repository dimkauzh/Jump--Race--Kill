extends Area2D

signal coin_col

func _ready():
	pass

func _process(delta):
	$AnimatedSprite.play("coin")

func _on_Coin_body_entered(body):
	emit_signal("coin_col")
	queue_free()

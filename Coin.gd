extends Area2D

signal coin_col

func _process(delta):
	$AnimatedSprite.play("coin")

func _on_Coin_body_entered(body):
	emit_signal("coin_col")
	queue_free()

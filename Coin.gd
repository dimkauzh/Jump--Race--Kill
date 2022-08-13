extends Area2D

signal coin_col

func _ready():
	pass

func _process(delta):
	$AnimatedSprite.play("coin")

func _on_Coin_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	emit_signal("coin_col")
	queue_free()


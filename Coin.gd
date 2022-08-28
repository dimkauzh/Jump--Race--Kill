extends Area2D

signal coin_col

func _ready():
	pass

func _process(_delta):
	$AnimatedSprite.play("coin")

func _on_Coin_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	emit_signal("coin_col")
	queue_free()


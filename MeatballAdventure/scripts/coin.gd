extends Area2D



func _on_body_entered(body: Node2D) -> void:
	print('加1分')
	queue_free()

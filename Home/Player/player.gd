extends CharacterBody2D

var speed: int = 5
var mouse_pos: Vector2

func _physics_process(delta: float) -> void:
	if mouse_pos:
		if mouse_pos.distance_to()
	# 速度归一化
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()	
	
	# 选择动画
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
	# 向左移动水平翻转
	$AnimatedSprite2D.flip_h = velocity.x < 0
	if velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		# 向下移动垂直翻转

extends RigidBody2D



func _ready():
	# 随机选择动画
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	# 超出屏幕删除自己
	queue_free()

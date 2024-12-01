extends Path2D

var screen_size: Rect2

func _ready() -> void:
	screen_size = get_viewport_rect()
	
	update_path()
	
## 更新路径点
func update_path() -> void:
	"""更新路径点的方法"""
	curve.clear_points()
	
	# 使用相对坐标设置路径点，适应不同屏幕尺寸
	var points = [
		screen_size.position,
		Vector2(screen_size.size.x, screen_size.position.y),
		screen_size.size,
		Vector2(screen_size.position.x, screen_size.size.y),
		screen_size.position
	]
	
	for point in points:
		curve.add_point(point)

extends Path2D

var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect()
	curve.clear_points()
	curve.add_point(screen_size.position)
	curve.add_point(Vector2(screen_size.size.x,screen_size.position.y))
	curve.add_point(screen_size.size)
	curve.add_point(Vector2(screen_size.position.x,screen_size.size.y))
	curve.add_point(screen_size.position)

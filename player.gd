extends Area2D

@export var speed = 400 # 玩家角色的速度
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	# 获取游戏窗口大小
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

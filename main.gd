extends Node

@export var mob_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	#new_game()
	pass


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	score = 0
	$player.start($StartPosition.position)
	$StartTimer.start()


func _on_mob_timer_timeout():
	# 创建怪物实例
	var mob = mob_scene.instantiate()
	
	# 让怪物在路径上选择随机位置
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()
	
	# 让怪物在路径上向右旋转
	var direction = mob_spawn_location.rotation + PI / 2
	mob.position = mob_spawn_location.position
	# 随机旋转角度
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	# 随机选择怪物的移动速度
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	# 将新实例添加到场景中
	add_child(mob)


func _on_score_timer_timeout():
	score += 1


func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	

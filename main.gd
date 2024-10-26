extends Node

@export var mob_scene: PackedScene
var score
# Called when the node enters the scene tree for the first time.
func _ready():
	#new_game()
	$HUD.toload()
	
func game_over():
	$GameTimer.stop()
	$MobTimer.stop()
	$Music.stop()
	$HUD.show_game_over()
	$DeathSound.play()
	$HUD.score_group.append(score)
	$HUD.tosave()
	$HUD.toload()
	#print($HUD.score_group)
	
func new_game():
	$Music.play()
	score = 0
	$HUD.toload()
	get_tree().call_group("mobs", "queue_free")
	$player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.update_best_score()
	$HUD.show_message("在按键上移动手指就可移动")
	await $HUD/MessageTimer.timeout
	$HUD.show_message("Get Ready")

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
	var velocity = Vector2(randf_range(100.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	# 将新实例添加到场景中
	add_child(mob)


func _on_game_timer_timeout():
	score += 1
	$MobTimer.wait_time -= 0.01
	$HUD.update_score(score)
	

func _on_start_timer_timeout():
	$MobTimer.start()
	$GameTimer.start()
	

extends CanvasLayer

# 创建新的 ConfigFile 对象。
var config = ConfigFile.new()
var score_group = [ ]
var best_score = 0
# 按钮按下发出信号
signal start_game

func _ready():
	pass
	
func show_message(text):
	# 显示临时信息
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


func show_game_over():
	# 显示gameover
	show_message("Game Over")
	# 等待MessageTimer计时器结束
	await $MessageTimer.timeout
	
	# 重新开始提示
	show_message("泳棋太差了\n再来一次吧")
	await $MessageTimer.timeout
	$ScoreLabelBox.text = ("你的得分记录\n" + str(score_group))
	$ScoreLabelBox.show()
	
	# 等待 1 秒显示start
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score):
	# 更新分数
	$ScoreLabel.text = str(score)
	
func update_best_score():
	best_score = score_group.max()
	$BestScoreLabel.text = "最高\n" + str(best_score)
	
func _on_start_button_pressed():
	$StartButton.hide()
	$ScoreLabelBox.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()

func tosave() -> void:
	# 存储一些值。
	config.set_value("player", "score", score_group)
	
	# 将其保存到文件中（如果已存在则覆盖）。
	config.save("user://scores.cfg")
	
func toload() -> void:
	# 从文件加载数据。
	var result = config.load("user://scores.cfg")
	
	# 如果文件没有加载，忽略它。
	if result == OK:
		score_group = config.get_value("player", "score")
		update_best_score()
	else:
		show_message("加载失败")

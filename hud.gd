extends CanvasLayer

# 按钮按下发出信号
signal start_game


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
	$Message.text = "泳棋太差了\n再来一次吧"
	$Message.show()
	
	# 等待 1 秒显示start
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()


func update_score(score):
	# 更新分数
	$ScoreLabel.text = str(score)
	

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()

extends Node


func _on_dialogic_text_signal(argument:String):
	if argument == "toquit":
		get_tree().quit()


func _on_minigame_button_pressed() -> void:
	get_tree().change_scene_to_file("res://minigames/dodge_the_creeps/main.tscn")
func _on_war_button_pressed() -> void:
	get_tree().change_scene_to_file("res://War/Field/example.tscn")

func _on_test_dialog_button_pressed() -> void:
	Dialogic.signal_event.connect(_on_dialogic_text_signal)
	Dialogic.start("res://Tests/Dialogs/leader.dtl")

func _on_home_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Home/Stages/farm.tscn")

func _on_common_button_pressed() -> void:
	get_tree().change_scene_to_file("res://War/Field/example2.tscn")

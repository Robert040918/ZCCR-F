extends Node

func _on_minigame_button_pressed() -> void:
	get_tree().change_scene_to_file("res://smallgames/dodge_the_creeps/main.tscn")


func _on_war_button_pressed() -> void:
	get_tree().change_scene_to_file("res://War/Field/example.tscn")

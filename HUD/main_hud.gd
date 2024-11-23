extends Node


func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_text_signal)
	Dialogic.start("res://HUD/leader.dtl")
	
func _on_dialogic_text_signal(argument:String):
	if argument == "toquit":
		get_tree().quit()


func _on_minigame_button_pressed() -> void:
	get_tree().change_scene_to_file("res://smallgames/dodge_the_creeps/main.tscn")

func _on_war_button_pressed() -> void:
	get_tree().change_scene_to_file("res://War/Field/example.tscn")

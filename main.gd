extends Control

class_name Main

func _on_exit_pressed() -> void:
	get_tree().quit()
	
func _on__send_end() -> void:
	$MarginContainer/AnimationPlayer.play("start")
	$MarginContainer/VBoxContainer/timer.pause()

func _on_reset_pressed() -> void:
	$MarginContainer/VBoxContainer/timer.start()
	$"MarginContainer/VBoxContainer/15".suffle()

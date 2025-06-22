extends Control

class_name Cell

func set_value(value:int):
	$fishka.number = value

func get_value()->int:
	return get_children().front().number

extends GridContainer

@onready var child_count = get_child_count()
signal send_end()

func _ready() -> void:
	suffle()
	Globals.player_state.start_load_cell_values(self)
	
func set_cells(values:Array[int]):
	if values.size() == child_count:
		var cells = get_children()
		for idx in range(values.size()):
			cells[idx].set_value(values[idx])

func suffle():
	var cells = get_children()
	cells.shuffle()
	for value in range(child_count):
		cells[value].set_value(value)
			
func check_assemble():
	var count = 0
	for cell in get_children():
		count += 1
		if cell.get_value() != count and count < child_count:
			return
			
	send_end.emit()
	

func _on_reset_pressed() -> void:
	suffle()

func _exit_tree() -> void:
	Globals.player_state.save_cell_values(self)

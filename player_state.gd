extends Resource

class_name PlayerState

@export var cell_values:Array[int]
@export var start_time:int = 0

func save_cell_values(grid:GridContainer):
	if grid:
		cell_values.clear()
		for cell in grid.get_children():
			cell_values.append(cell.get_value())
				
func start_load_cell_values(grid:GridContainer):
	if grid and not cell_values.is_empty():
		grid.set_cells(cell_values)
		

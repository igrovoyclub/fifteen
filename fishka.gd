extends Label

class_name Fishka

var number:int = 0:
	set (value):
		number = value
		text = str(number)
		if number == 0:
			self_modulate.a = 0
		else:
			self_modulate.a = 1

func _get_drag_data(_at_position: Vector2) -> Variant:
	return self
	
func _drop_data(at_position: Vector2, second_fishka: Variant) -> void:
	if second_fishka is Fishka and (self.number == 0 or second_fishka.number == 0):
		var tween = create_tween()
		tween.tween_property(self, "global_position", second_fishka.global_position, 0.5)
		tween.parallel().tween_property(second_fishka, "global_position", self.global_position, 0.5)
		tween.tween_callback(func(): 
			var parent_self = get_parent();
			var parent_second = second_fishka.get_parent();
			parent_self.remove_child(self);
			parent_second.remove_child(second_fishka);
			parent_self.add_child(second_fishka);
			parent_second.add_child(self);
			self.position = Vector2.ZERO;
			second_fishka.position = Vector2.ZERO;
			get_tree().call_group("grid", "check_assemble"))
		$AudioStreamPlayer2D.play()
	
func _can_drop_data(at_position: Vector2, second_fishka: Variant) -> bool:
	if second_fishka is Fishka and second_fishka != self:
		var direct = global_position.direction_to(second_fishka.global_position).sign()
		return second_fishka is Fishka and (self.number == 0 or second_fishka.number == 0) and (direct.x == 0 or direct.y == 0)
	return false

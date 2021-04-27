extends OptionButton

func _input(event: InputEvent) -> void:
	if has_focus():
		var selection = selected
		if event.is_action_pressed("ui_down"):
			selection += 1
			if selection > get_item_count()-1:
				selection = 0
			select(selection)
		if event.is_action_pressed("ui_up"):
			selection -= 1
			if selection < 0:
				selection = get_item_count()-1
			select(selection)
		emit_signal("item_selected",selection)

extends VBoxContainer

var bond = load("res://SheetTemplate/Bond/Bond.tscn")
signal bond_added

func _on_ButtonAddBond_pressed() -> void:
	var new_bond = bond.instance()
	add_child(new_bond)
	emit_signal("bond_added")

func _on_ButtonModifyBond_toggled(button_pressed: bool) -> void:
	get_tree().call_group("Bond","show_control",button_pressed)
	get_tree().call_group("HideGroupBond","hide" if button_pressed else "show")

func call_update():
	yield(get_tree(),"idle_frame")
	get_tree().call_group("Bond","update_index")




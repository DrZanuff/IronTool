extends VBoxContainer

var Vow = load("res://SheetTemplate/Vow/Vow.tscn")
signal vow_added

func _on_ButtonAddVow_pressed() -> void:
	var new_vow = Vow.instance()
	add_child(new_vow)
	emit_signal("vow_added")
	

func _on_ButtonModify_toggled(button_pressed: bool) -> void:
	get_tree().call_group("Vow","show_control",button_pressed)
	get_tree().call_group("HideGroup","hide" if button_pressed else "show")

func call_update():
	yield(get_tree(),"idle_frame")
	get_tree().call_group("Vow","update_index")

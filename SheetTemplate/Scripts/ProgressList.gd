extends VBoxContainer

var progress = load("res://SheetTemplate/Progress/Progress.tscn")
signal progress_added

func _on_ButtonAddProgress_pressed() -> void:
	var new_progress = progress.instance()
	add_child(new_progress)
	emit_signal("progress_added")


func _on_ButtonModifyProgress_toggled(button_pressed: bool) -> void:
	get_tree().call_group("Progress","show_control",button_pressed)
	get_tree().call_group("HideGroupProgress","hide" if button_pressed else "show")

func call_update():
	yield(get_tree(),"idle_frame")
	get_tree().call_group("Progress","update_index")

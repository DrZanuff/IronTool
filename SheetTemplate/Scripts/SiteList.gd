extends VBoxContainer

var site = load("res://SheetTemplate/Site/Site.tscn")
signal site_added

func _on_ButtonAddSite_pressed() -> void:
	var new_site = site.instance()
	add_child(new_site)
	emit_signal("site_added")
	
func _on_ButtonModifySite_toggled(button_pressed: bool) -> void:
	get_tree().call_group("Site","show_control",button_pressed)
	get_tree().call_group("HideGroupSite","hide" if button_pressed else "show")
	
func call_update():
	yield(get_tree(),"idle_frame")
	get_tree().call_group("Site","update_index")



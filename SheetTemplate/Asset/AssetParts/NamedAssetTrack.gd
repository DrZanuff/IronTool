extends MarginContainer

var named_unit_track = load("res://SheetTemplate/Asset/AssetParts/NamedUnitTrack.tscn")

func create_track(units : Array):
	for u in units:
		var new_named_unit_track = named_unit_track.instance()
		$HBox.add_child(new_named_unit_track)
		new_named_unit_track.set_text(u.name)
		var checkbox = new_named_unit_track.get_checkbox() as CheckBox
		checkbox.connect("pressed",self,"mark_track",[checkbox])
		

func mark_track(checkbox_node):
	for node in $HBox.get_children():
		if node.get_checkbox() is CheckBox:
			node.get_checkbox().pressed = false
			
	checkbox_node.pressed = true

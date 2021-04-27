extends MarginContainer

var unit_track = load("res://SheetTemplate/Asset/AssetParts/UnitTrack.tscn")

func create_track(size,value):
	for u in range(size+1):
		var new_unit_track = unit_track.instance()
		$HBox.add_child(new_unit_track)
		new_unit_track.set_text(u)
		var check = new_unit_track.get_checkBox()
		check.connect("pressed",self,"mark_track",[check])
		if u == value:
			check.pressed = true
		
func mark_track(node : CheckBox):
	for n in $HBox.get_children():
		if n.get_checkBox() is CheckBox:
			n.get_checkBox().pressed = false
	node.pressed = true

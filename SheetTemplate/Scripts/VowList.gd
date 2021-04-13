extends ScrollContainer

var Vow = load("res://SheetTemplate/Vow/Vow.tscn")

func _on_ButtonAddVow_pressed() -> void:
	var new_vow = Vow.instance()
	$VowContents/VowList.add_child(new_vow)
#	yield(get_tree(), "idle_frame")
#	yield(get_tree(), "idle_frame")
	$VowContents/Tween.interpolate_property(
		self,
		"scroll_vertical",
		self.scroll_vertical,
		self.get_v_scrollbar().max_value,
		2.0,Tween.TRANS_LINEAR,Tween.EASE_IN)
	$VowContents/Tween.start()
#	Scroll.scroll_vertical = Scroll.get_v_scrollbar().max_value
	

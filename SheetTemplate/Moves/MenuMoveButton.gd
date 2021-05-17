extends MarginContainer

func _deploy(_text : String , _color : Color):
	$Margin/Label.text = _text
	$ColorRect.color = _color



func _on_Button_mouse_entered() -> void:
	$Margin/Label.add_color_override("font_color",Color.yellow)


func _on_Button_mouse_exited() -> void:
	$Margin/Label.add_color_override("font_color",Color.white)

extends MarginContainer


func set_text(text):
	$Box/RichTextLabel.append_bbcode(text)

func check(status):
	if status is bool:
		$Box/CheckBox.pressed = status
	else:
		$Box/CheckBox.pressed = (status == "true")
		

extends MarginContainer


func set_text(text):
	$Box/RichTextLabel.append_bbcode(text)

func check(status):
	$Box/CheckBox.pressed = (status == "true")

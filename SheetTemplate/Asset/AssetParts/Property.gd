extends MarginContainer

func set_text(text):
	$HBox/RichTextLabel.append_bbcode(text)

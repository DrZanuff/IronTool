extends MarginContainer

func set_text(text):
	$Margin/VBox/Label.text = text

func get_checkbox():
	return $Margin/VBox/CheckBox

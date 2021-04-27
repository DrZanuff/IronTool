extends MarginContainer

func set_text(val):
	$Margin/VBox/Label.text = ("+" if int(val) > 0 else "") + str(val)

func get_checkBox():
	return $Margin/VBox/CheckBox


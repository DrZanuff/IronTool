extends MarginContainer


func set_row_color(color : int , order = "dark_first"):
	if color == 0:
		if order == "dark_first":
			$ColorRect.color = Color("#2c2c2c")
		else:
			$ColorRect.color = Color("#525252")
	
	else:
		if order == "dark_first":
			$ColorRect.color = Color("#525252")
		else:
			$ColorRect.color = Color("#2c2c2c")

func set_text(range_str,text):
	$Margin/HBox/Range.text = range_str
	$Margin/HBox/Text.text = text

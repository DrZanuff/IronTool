extends MarginContainer

func set_title(text):
	$Body/Margin/Title.text = text

func add_button(text):
	var item = $Body/OracleList/Content/Item.duplicate()
	$Body/OracleList/Content.add_child(item)
	item.get_node("BtnOracle").text = text
	item.show()

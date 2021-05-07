extends MarginContainer

var order = 0

func set_title(text):
	$Body/Margin/Title.text = text

func add_button(text,index) -> HBoxContainer:
	var item = $Body/OracleList/Content/Item.duplicate()
	$Body/OracleList/Content.add_child(item)
	item.get_node("BtnOracle").text = text
	item.name = text
	item.show()
	item.order = index
	return(item)

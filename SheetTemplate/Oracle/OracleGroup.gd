extends MarginContainer

var order = 0

func set_title(text):
	$Body/Margin/Title.text = text

func add_button( index , btn_module , btn_type , btn_oracle) -> HBoxContainer:
	var item = $Body/OracleList/Content/Item.duplicate()
	$Body/OracleList/Content.add_child(item)
	item.get_node("BtnOracle").text = btn_oracle
	item.name = btn_oracle
	item.show()
	item.order = index
	item.module = btn_module
	item.type  = btn_type
	item.oracle = btn_oracle 
	return(item)

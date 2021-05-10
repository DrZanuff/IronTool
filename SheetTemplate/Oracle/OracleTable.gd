extends HBoxContainer

var OracleElement = load("res://SheetTemplate/Oracle/OracleElement.tscn")
var current_col = 0

func populate_table(oracle , size):
	current_col = 0
	
	for col in get_children():
		col.hide()
		for node in col.get_children():
			node.queue_free()
	
	$Col1.show()
	
	for i in range(size):
		var newOracleElement = OracleElement.instance()
		get_child(current_col).call_deferred("add_child",newOracleElement)
		if current_col % 2 == 0:
			newOracleElement.set_row_color(i % 2 )
		else:
			newOracleElement.set_row_color(i % 2 , "light_first" )
	
		newOracleElement.set_text(oracle[i].str_range,oracle[i].name)
		
		print(i)
		if i == 74 or i == 49 or i == 24:
			
			current_col += 1
			get_child(current_col).visible = true

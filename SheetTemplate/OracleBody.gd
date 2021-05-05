extends VBoxContainer

var oracleGroup = load("res://SheetTemplate/Oracle/OracleGroup.tscn")
var btnGroup = load("res://SheetTemplate/Oracle/Modules.tres")

func _ready() -> void:
	for module in Global.oracles:
		var btn = Button.new()
		btn.toggle_mode = true
		btn.rect_min_size.x = 180
		btn.text = module
		$OracleMenu.add_child(btn)
		
		var newTable = $Tables.duplicate()
		newTable.name = module
		add_child(newTable)
		
		btn.group = btnGroup
		btn.connect("toggled",newTable,"show_table")
		
		if module == "IRONSWORN":
			$OracleMenu.move_child(btn,0)
			newTable.show()
			btn.pressed = true
		if module == "DELVE":
			$OracleMenu.move_child(btn,1)
		
		for type in Global.oracles[module]:
			if type != "MOVES":
				var newOracleGroup = oracleGroup.instance()
				newTable.get_node("HBox/SideMenu").add_child(newOracleGroup)
				
				newOracleGroup.set_title(type)
				Global.oracles[module][type]
				
				for oracle in Global.oracles[module][type]:
					print("____________________________________")
					if typeof(Global.oracles[module][type][oracle]) != TYPE_INT:
						newOracleGroup.name = oracle
						newOracleGroup.add_button(oracle)
						print(Global.oracles[module][type][oracle])
						if Global.oracles[module][type][oracle].type_order > Global.oracles[module][type].order:
							newTable.get_node("HBox/SideMenu").move_child(newOracleGroup,0)
							
#					var pos = max(
#						$Tables/HBox/SideMenu.get_child_count() - Global.oracles[module][type][oracle].type_order,
#						$Tables/HBox/SideMenu.get_child_count()
#					)
#					$Tables/HBox/SideMenu.move_child(newOracleGroup,pos)
#					printt(pos , Global.oracles[module][type][oracle].type_order , newOracleGroup.name , newOracleGroup.get_parent().name)

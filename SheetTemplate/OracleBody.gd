extends VBoxContainer

var oracleGroup = load("res://SheetTemplate/Oracle/OracleGroup.tscn")
var btnGroup = load("res://SheetTemplate/Oracle/Modules.tres")

func _ready() -> void:
	var oraclesGroupsOrder = {}
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
			
			if not oraclesGroupsOrder.has(module):
				oraclesGroupsOrder[module] = []
				
			if type != "MOVES":
				var newOracleGroup = oracleGroup.instance()
				newTable.get_node("HBox/SideMenu").add_child(newOracleGroup)
				
				newOracleGroup.set_title(type)
				
				oraclesGroupsOrder[module].push_back(newOracleGroup)
				
				for oracle in Global.oracles[module][type]:
					if typeof(Global.oracles[module][type][oracle]) != TYPE_INT:
						newOracleGroup.name = type
						newOracleGroup.add_button(oracle)
						
						if newOracleGroup.order < Global.oracles[module][type][oracle].type_order:
							newOracleGroup.order = Global.oracles[module][type][oracle].type_order
	
	#Ordenar os Grupos
	for group in oraclesGroupsOrder:
		print(oraclesGroupsOrder[group])
		
		oraclesGroupsOrder[group].sort_custom(MyCustomSorter, "sort_descending")

		var oracle_group_index = 0
		for a in oraclesGroupsOrder[group]:
			a.get_parent().move_child(a,oracle_group_index)
			oracle_group_index +=1

		

class MyCustomSorter:
	static func sort_descending(a, b):
		if a.order > b.order:
			return true
		return false

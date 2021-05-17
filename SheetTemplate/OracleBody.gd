extends VBoxContainer

var oracleGroup = load("res://SheetTemplate/Oracle/OracleGroup.tscn")
var btnGroup = load("res://SheetTemplate/Oracle/Modules.tres")

func _ready() -> void:
	var oraclesGroupsOrder = {}
	var oraclesButtonOrder = {}
	for module in Global.oracles:
		#Adiciona novo Button na parte de cima
		var btn = Button.new()
		btn.toggle_mode = true
		btn.rect_min_size.x = 180
		btn.text = module
		$OracleMenu.add_child(btn)
		
		#Adiciona nova Table
		var newTable = $Tables.duplicate()
		newTable.name = module
		add_child(newTable)
		
		btn.group = btnGroup
		btn.connect("toggled",newTable,"show_table")
		
		if module == "IRONSWORN":
			$OracleMenu.move_child(btn,0)
			newTable.show()
			btn.pressed = true
			newTable.show()
		if module == "DELVE":
			$OracleMenu.move_child(btn,1)
			newTable.hide()
		
		for type in Global.oracles[module]:
			
			if not oraclesGroupsOrder.has(module):
				oraclesGroupsOrder[module] = []
				
			if not oraclesButtonOrder.has(module):
				oraclesButtonOrder[module] = {}
				
			if type != "MOVES":
				#Adiciona novo agrupador de Oracles
				var newOracleGroup = oracleGroup.instance()
				newTable.get_node("HBox/SideMenu").add_child(newOracleGroup)
				
				newOracleGroup.set_title(type)
				
				oraclesGroupsOrder[module].push_back(newOracleGroup)
				
				for oracle in Global.oracles[module][type]:
					if typeof(Global.oracles[module][type][oracle]) != TYPE_INT:
						newOracleGroup.name = type
						#Adiciona novo Oracle Button
						var oracleButton = newOracleGroup.add_button(
							Global.oracles[module][type][oracle].oracle_order,
							module,
							type,
							oracle
						)
						
						oracleButton.btnOracle.connect("pressed",self,"show_oracle",[module,type,oracle])
						
						
						if not oraclesButtonOrder[module].has(type):
							oraclesButtonOrder[module][type] = []
						
						oraclesButtonOrder[module][type].push_back(oracleButton)
						
						if newOracleGroup.order < Global.oracles[module][type][oracle].type_order:
							newOracleGroup.order = Global.oracles[module][type][oracle].type_order
	
	#Ordenar os Grupos
	for group in oraclesGroupsOrder:

		
		oraclesGroupsOrder[group].sort_custom(MyCustomSorter, "sort_descending")

		var oracle_group_index = 0
		for a in oraclesGroupsOrder[group]:
			a.get_parent().move_child(a,oracle_group_index)
			oracle_group_index +=1
	
	#Ordernar Buttons
	for modules in oraclesButtonOrder:
		for btn in oraclesButtonOrder[modules]:
			oraclesButtonOrder[modules][btn].sort_custom(MyCustomSorter, "sort_descending")

			var oracle_btn_index = 0
			for item in oraclesButtonOrder[modules][btn]:
				item.get_parent().move_child( item , oracle_btn_index+1 )
				oracle_btn_index += 1

class MyCustomSorter:
	static func sort_descending(a, b):
		if a.order > b.order:
			return true
		return false


func show_oracle(module,type,oracle):
	get_node(module).get_node("HBox/Table/OracleTable").populate_table(
		Global.oracles[module][type][oracle].data , 
		Global.oracles[module][type][oracle].data.size()
	)

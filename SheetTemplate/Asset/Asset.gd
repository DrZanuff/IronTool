extends MarginContainer

onready var opt_type =  $Body/Margin/OptMargin/OptType

func _ready() -> void:
	update_list()

func update_list():
	for node in $Body/Info/Types.get_children():
		node.queue_free()
		
	$Body/Margin/OptMargin/OptType.clear()
	$Body/Margin/OptMargin/OptType.add_item("SELECT")
	for i in Global.assets:
		$Body/Margin/OptMargin/OptType.add_item(i)
		var new_opt = OptionButton.new()
		$Body/Info/Types.add_child(new_opt)
		new_opt.visible = false
		new_opt.name = i
		new_opt.add_item("SELECT")
		new_opt.connect("item_selected",self,"show_data",[new_opt])
		for asset in Global.assets[i]:
			new_opt.add_item(asset)
	
	$Body/Margin/OptMargin/OptType.add_item("CUSTOM")
	
	check_saved_assets()

func check_saved_assets():
	pass


func _on_OptType_item_selected(index: int) -> void:
	var type_name = opt_type.get_item_text(opt_type.selected)
	hide_all_assets_list()
	$Body/Info/Types.show()
	
	if type_name == "SELECT":
		$Body/Info/Types.hide()
	elif type_name == "CUSTOM":
		pass
	else:
		if $Body/Info/Types.has_node(type_name):
			$Body/Info/Types.get_node(type_name).show()

func hide_all_assets_list():
	for node in $Body/Info/Types.get_children():
		node.visible = false

func show_data(index,list : OptionButton):
	var type_name = opt_type.get_item_text(opt_type.selected)
	var asset_name = list.get_item_text(list.selected)
	var asset_data = JSON.parse(Global.assets[type_name][asset_name].data).result
	for item in asset_data:
		print(item)

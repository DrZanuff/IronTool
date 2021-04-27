extends MarginContainer

onready var opt_type =  $Body/Margin/OptMargin/OptType
var skill = load("res://SheetTemplate/Asset/AssetParts/Skill.tscn")
var text = load("res://SheetTemplate/Asset/AssetParts/Text.tscn")
var property = load("res://SheetTemplate/Asset/AssetParts/Property.tscn")
var assetTrack = load("res://SheetTemplate/Asset/AssetParts/AssetTrack.tscn")
var asset_item = load("res://SheetTemplate/Asset/AssetParts/Item.tscn")

func _ready() -> void:
	update_list()

func update_list():
	for node in $Body/Info/Types.get_children():
		node.queue_free()
		
	$Body/Margin/OptMargin/OptType.clear()
	$Body/Margin/OptMargin/OptType.add_item("SELECT")
	
	var types_array = Global.assets.keys()
	types_array.sort()
	
	for i in types_array:
#	for i in Global.assets:
		$Body/Margin/OptMargin/OptType.add_item(i)
		var new_opt = OptionButton.new()
		$Body/Info/Types.add_child(new_opt)
		new_opt.visible = false
		new_opt.name = i
		new_opt.add_item("SELECT")
		new_opt.connect("item_selected",self,"show_data",[new_opt])
		
		var assets_array = Global.assets[i].keys()
		assets_array.sort()
		for a in assets_array:
			new_opt.add_item(a)
		
#		for asset in Global.assets[i]:
#			new_opt.add_item(asset)
	
	$Body/Margin/OptMargin/OptType.add_item("CUSTOM")
	
	check_saved_assets()

func check_saved_assets():
	pass


func _on_OptType_item_selected(index: int) -> void:
	var type_name = opt_type.get_item_text(opt_type.selected)
	clear_itens()
	$Body/Info/Types.show()
	
	if type_name == "SELECT":
		$Body/Info/Types.hide()
	elif type_name == "CUSTOM":
		pass
	else:
		if $Body/Info/Types.has_node(type_name):
			$Body/Info/Types.get_node(type_name).show()

func show_data(index,list : OptionButton):
	clear_itens()
	var type_name = opt_type.get_item_text(opt_type.selected)
	var asset_name = list.get_item_text(list.selected)
	var asset_data = JSON.parse(Global.assets[type_name][asset_name].data).result
	for item in asset_data:
		print(item)
		if item.has("skill"):
			var new_skill = skill.instance()
			new_skill.set_text(item.skill.skill_text)
			new_skill.check(item.skill.check)
			$Body/Itens/Body.add_child(new_skill)
		elif item.has("text"):
			var new_text = text.instance()
			new_text.set_text(item.text)
			$Body/Itens/Body.add_child(new_text)	
		elif item.has("property"):
			var new_prop = property.instance()
			new_prop.set_text(item.property.prop_name)
			$Body/Itens/Body.add_child(new_prop)
		elif item.has("track"):
			var new_assetTrack = assetTrack.instance()
			$Body/Itens/Body.add_child(new_assetTrack)
			new_assetTrack.create_track( 
				int(item.track.size),
				int(item.track.value)
			)
		elif item.has("item"):
			var new_asset_item = asset_item.instance()
			new_asset_item.set_text(item.item)
			$Body/Itens/Body.add_child(new_asset_item)

func clear_itens():
	for n in $Body/Itens/Body.get_children():
		n.queue_free()

extends MarginContainer

onready var opt_type =  $Body/Margin/OptMargin/OptType
var skill = load("res://SheetTemplate/Asset/AssetParts/Skill.tscn")
var text = load("res://SheetTemplate/Asset/AssetParts/Text.tscn")
var property = load("res://SheetTemplate/Asset/AssetParts/Property.tscn")
var asset_track = load("res://SheetTemplate/Asset/AssetParts/AssetTrack.tscn")
var named_asset_track = load("res://SheetTemplate/Asset/AssetParts/NamedAssetTrack.tscn")
var asset_item = load("res://SheetTemplate/Asset/AssetParts/Item.tscn")
var optionButton = load("res://SheetTemplate/Asset/AssetParts/OptionButton.tscn")

var drag = false

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
		$Body/Margin/OptMargin/OptType.add_item(i)
		var new_opt = optionButton.instance()
		$Body/Info/Types.add_child(new_opt)
		new_opt.focus_mode = Control.FOCUS_CLICK
		new_opt.visible = false
		new_opt.name = i
		new_opt.add_item("SELECT")
		new_opt.connect("item_selected",self,"show_data",[new_opt])
		
		var assets_array = Global.assets[i].keys()
		assets_array.sort()
		for a in assets_array:
			new_opt.add_item(a)
	
	$Body/Margin/OptMargin/OptType.add_item("CUSTOM")
	
	check_saved_assets()

func check_saved_assets():
	pass

func _on_OptType_item_selected(index: int) -> void:
	var type_name = opt_type.get_item_text(opt_type.selected)
	clear_itens()
	hide_all_assets_list()
	$Body/Info/Types.show()
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
		if node is OptionButton:
			node.select(0)

func show_data(index,list : OptionButton):
	clear_itens()
	var type_name = opt_type.get_item_text(opt_type.selected)
	var asset_name = list.get_item_text(list.selected)
	if asset_name == "SELECT":
		return
	var asset_data = JSON.parse(Global.assets[type_name][asset_name].data).result
	for item in asset_data:
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
			var new_asset_track = asset_track.instance()
			$Body/Itens/Body.add_child(new_asset_track)
			new_asset_track.create_track( 
				int(item.track.size),
				int(item.track.value)
			)
		elif item.has("item"):
			var new_asset_item = asset_item.instance()
			new_asset_item.set_text(item.item)
			$Body/Itens/Body.add_child(new_asset_item)
		elif item.has("named_track"):
			var new_named_asset_track = named_asset_track.instance()
			new_named_asset_track.create_track(item.named_track)
			$Body/Itens/Body.add_child(new_named_asset_track)

func clear_itens():
	for n in $Body/Itens/Body.get_children():
		n.queue_free()

func _input(event: InputEvent) -> void:
	if $Body/Margin/OptMargin/OptType.has_focus():
		var selection = $Body/Margin/OptMargin/OptType.selected
		if event.is_action_pressed("ui_down"):
			selection += 1
			if selection > $Body/Margin/OptMargin/OptType.get_item_count()-1:
				selection = 0
			$Body/Margin/OptMargin/OptType.select(selection)
		if event.is_action_pressed("ui_up"):
			selection -= 1
			if selection < 0:
				selection = $Body/Margin/OptMargin/OptType.get_item_count()-1
			$Body/Margin/OptMargin/OptType.select(selection)
		$Body/Margin/OptMargin/OptType.emit_signal("item_selected",selection)

func show_control(visible:bool):
	$Control.visible = visible

func _on_Asset_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_mouse_left"):
		get_parent().asset_slot = self
		modulate = Color("#aaddff")
	
	if event.is_action_released("ui_mouse_left"):
		modulate = Color("#ffffff")
	
func _on_Asset_mouse_entered() -> void:
	if get_parent().asset_slot != null:
		modulate = Color("#aaddff")
		yield( get_tree().create_timer(0.1) , "timeout" )
		get_parent().move_child(get_parent().asset_slot,self.get_index() )
		get_parent().asset_slot = null
		modulate = Color("#ffffff")


func _on_ButtonDelete_pressed() -> void:
	$Delete.show()

func _on_ButtonNo_pressed() -> void:
	$Delete.hide()

func _on_ButtonYes_pressed() -> void:
	queue_free()

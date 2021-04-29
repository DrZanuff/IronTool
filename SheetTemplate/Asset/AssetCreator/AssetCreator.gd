extends MarginContainer

onready var body = $Body/Creator/Body/Scroll/Itens
onready var list = $Body/Creator/Body/ItensOpt/HBox/OptItens
onready var text = $ItensRef/Text
onready var skill = $ItensRef/Skill
onready var topic = $ItensRef/Topic
onready var property = $ItensRef/Property
onready var track = $ItensRef/Track
onready var named_track = $ItensRef/NamedTrack


var asset_name = "TEMPLATE"

signal built

func _on_ButtonAddItens_pressed() -> void:
	match list.get_item_text( list.selected):
		"TEXT":
			body.add_child( text.duplicate() )
		
		"SKILL":
			body.add_child( skill.duplicate() )

		"TOPIC":
			body.add_child( topic.duplicate() )

		"PROPERTY":
			body.add_child( property.duplicate() )

		"TRACK":
			body.add_child( track.duplicate() )

		"NAMED TRACK":
			body.add_child( named_track.duplicate() )

func view(menu : Array) -> void:
	menu[0].pressed = true
	menu[1].pressed  = false
	show()

func build(menu : Array) -> void:
	menu[0].pressed = false
	menu[1].pressed  = true
	hide()
	build_view()

func clear_view():
	for node in $Body/Creator/Body/Scroll/Itens.get_children():
		node.queue_free()


func build_view():
	if not Global.assets.has("CUSTOM"):
		Global.assets["CUSTOM"] = {}
		
	Global.assets["CUSTOM"][asset_name] = {
		"type" : "CUSTOM",
		"asset_name" : asset_name,
		"data" : get_data()
	}
	
	emit_signal("built",asset_name)
#	var file = File.new()
#	file.open("res://global.json",File.WRITE)
#	file.store_string( JSON.print(Global.assets) )
#	file.close()

func get_data():
	var data = []
	for node in $Body/Creator/Body/Scroll/Itens.get_children():
		data.push_back( node.get_data() )
	
	return JSON.print(data)

func _on_LineEdit_text_changed(new_text: String) -> void:
	var regex = RegEx.new()
	regex.compile('[^0-9a-zA-Z-]+')
	var result = regex.search_all(new_text)
	if result:
		for r in result:
			if r.get_string() != " ":
				print( r.get_string() )
				print( new_text.findn(r.get_string() ) )
				new_text = new_text.replacen( r.get_string() , "" )

	$Body/Creator/Body/AssetName/LineEdit.text = new_text.to_upper()

	$Body/Creator/Body/AssetName/LineEdit.caret_position = new_text.length()
	
	if Global.assets.has("CUSTOM"):
		if Global.assets["CUSTOM"].has(asset_name):
			Global.assets["CUSTOM"].erase(asset_name)
		
	asset_name = new_text.to_upper()



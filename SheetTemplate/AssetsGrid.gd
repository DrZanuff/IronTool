extends GridContainer

var asset = load("res://SheetTemplate/Asset/Asset.tscn")

signal asset_added
var asset_slot = null

func _ready() -> void:
	pass


func _on_ButtonAddAsset_pressed() -> void:
	var new_asset = asset.instance()
	add_child(new_asset)
	emit_signal("asset_added")


func _on_ButtonModifyAsset_toggled(button_pressed: bool) -> void:
	get_tree().call_group("Asset","show_control",button_pressed)
	get_tree().call_group("HideGroupAsset","hide" if button_pressed else "show")

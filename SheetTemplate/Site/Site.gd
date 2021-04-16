extends MarginContainer

func _on_BtnDetails_toggled(button_pressed: bool) -> void:
	$SiteBody/Details.visible = button_pressed

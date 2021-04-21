extends MarginContainer

var trigger = false
var begin = 0.0
var acell = 30

func _on_Resizer_mouse_entered() -> void:
	trigger = true


func _on_Resizer_mouse_exited() -> void:
	trigger = false

func _process(delta):
	if trigger:
		if Input.is_action_pressed("ui_mouse_left"):
			begin = $Margin/Body/Details/Notes/Resizer.rect_global_position.y
			var interval = begin - get_viewport().get_mouse_position().y
			if abs(interval) >= 1:
				rect_size.y += -interval


func _on_BtnDetails_toggled(button_pressed: bool) -> void:
	$Margin/Body/Details.visible = button_pressed
	if !button_pressed:
		rect_size.y = rect_min_size.y

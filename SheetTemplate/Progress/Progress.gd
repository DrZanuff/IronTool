extends MarginContainer

var drag = false

func _ready() -> void:
	update_index()

func _on_BtnChallenge_toggled(button_pressed: bool) -> void:
	$Body/Countdown.visible = button_pressed

func show_control(visible:bool):
	$Control.visible = visible

func _on_Progress_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.pressed:
				modulate = Color("#aaddff")
				drag = true
			else:
				modulate = Color("#ffffff")
				drag = false
				get_tree().call_group("Progress","update_index")

func _process(delta: float) -> void:
	if drag:
		var pos = round( (get_parent().get_local_mouse_position().y - (rect_size.y/2) ) / get_parent().rect_size.y * get_parent().get_child_count() )
		get_parent().move_child(self,pos)

func _on_ButtonDelete_pressed() -> void:
	$Delete.show()

func _on_ButtonYes_pressed() -> void:
	queue_free()
	get_parent().call_update()

func _on_ButtonNo_pressed() -> void:
	$Delete.hide()

func update_index():
	$Body/ProgressNumber/Number.text = str(get_index()+1)

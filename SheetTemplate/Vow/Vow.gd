extends MarginContainer

var drag = false

func _ready() -> void:
	update_index()
	$Delete.hide()
	$Control.hide()

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.pressed:
				modulate = Color("#aaddff")
				drag = true
			else:
				modulate = Color("#ffffff")
				drag = false
				get_tree().call_group("Vow","update_index")

func _process(delta: float) -> void:
	if drag:
		var pos = round( (get_parent().get_local_mouse_position().y - (rect_size.y/2) ) / get_parent().rect_size.y * get_parent().get_child_count() )
		get_parent().move_child(self,pos)
		pass

func update_index():
	$VowBody/VowNumber/Number.text = str(get_index()+1)
	
func show_control(visible:bool):
	$Control.visible = visible

func _on_ButtonMenace_toggled(button_pressed: bool) -> void:
	$VowBody/Menace.visible = button_pressed

func _on_ButtonDelete_pressed() -> void:
	$Delete.show()

func _on_ButtonNo_pressed() -> void:
	$Delete.hide()

func _on_ButtonYes_pressed() -> void:
	queue_free()
	get_parent().call_update()

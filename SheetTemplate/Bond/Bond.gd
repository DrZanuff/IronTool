extends MarginContainer

var trigger = false
var begin = 0.0
var acell = 30

var drag = false

func _ready() -> void:
	update_index()

func _on_Resizer_mouse_entered() -> void:
	trigger = true

func _on_Resizer_mouse_exited() -> void:
	trigger = false

func show_control(visible:bool):
	$Control.visible = visible

func _process(delta):
	if trigger:
		if Input.is_action_pressed("ui_mouse_left"):
			begin = $Margin/Body/Details/Notes/Resizer.rect_global_position.y
			var interval = begin - get_viewport().get_mouse_position().y
			if abs(interval) >= 1:
				rect_min_size.y += -interval
	if drag:
		var pos = round( (get_parent().get_local_mouse_position().y - (rect_size.y/2) ) / get_parent().rect_size.y * get_parent().get_child_count() )
		get_parent().move_child(self,pos)


func _on_BtnDetails_toggled(button_pressed: bool) -> void:
	$Margin/Body/Details.visible = button_pressed
	if !button_pressed:
		rect_min_size.y = 50

func _on_ButtonDelete_pressed() -> void:
	$Delete.show()

func _on_ButtonNo_pressed() -> void:
	$Delete.hide()

func _on_ButtonYes_pressed() -> void:
	queue_free()
	get_parent().call_update()


func update_index():
	$Margin/Body/BondNumber/Number.text = str(get_index()+1)


func _on_Bond_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.pressed:
				modulate = Color("#aaddff")
				drag = true
			else:
				modulate = Color("#ffffff")
				drag = false
				get_tree().call_group("Bond","update_index")

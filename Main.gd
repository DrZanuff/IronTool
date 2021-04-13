extends MarginContainer

func _ready() -> void:
	$MainScroll/SheetTemplate/MainMargin/Body/Interfaces/Body/Vows/VowContents/VowList.connect(
		"vow_added",self,"scroll_vertical"
	)

func scroll_vertical():
	$Tween.interpolate_property(
		$MainScroll,
		"scroll_vertical",
		$MainScroll.scroll_vertical,
		$MainScroll.get_v_scrollbar().max_value,
		2.0,Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()

extends MarginContainer

func _ready() -> void:
	$MainScroll/SheetTemplate/MainMargin/Body/Interfaces/Summary/Vows/VowContents/VowList.connect(
		"vow_added",self,"scroll_vertical"
	)
	$MainScroll/SheetTemplate/MainMargin/Body/Interfaces/Sites/SiteList.connect(
		"site_added", self , "scroll_vertical"
	)
	$MainScroll/SheetTemplate/MainMargin/Body/Interfaces/Progresses/ProgressList.connect(
		"progress_added", self , "scroll_vertical"
	)
	

func scroll_vertical():
	$Tween.interpolate_property(
		$MainScroll,
		"scroll_vertical",
		$MainScroll.scroll_vertical,
		$MainScroll.get_v_scrollbar().max_value,
		0.2,Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()

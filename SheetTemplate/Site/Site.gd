extends MarginContainer

onready var list_themes = $SiteBody/ThemeDomains/Body/HBody/Theme/VBox/ThemeSelect/Themes
onready var features_theme = $SiteBody/ThemeDomains/Body/HBody/Theme/VBox/Table/Body/FeatureTable/List
onready var dangers_theme = $SiteBody/ThemeDomains/Body/HBody/Theme/VBox/Table/Body/DangersTable/List
onready var table_theme =  $SiteBody/ThemeDomains/Body/HBody/Theme/VBox/Table
onready var description_theme = $SiteBody/ThemeDomains/Body/HBody/Theme/VBox/Table/Body/PlaceDescription/Place

func _on_BtnDetails_toggled(button_pressed: bool) -> void:
	$SiteBody/Details.visible = button_pressed

func _ready() -> void:
	for i in Global.themes:
		list_themes.add_item(i)


func _on_Themes_item_selected(index: int) -> void:
	var item_name = list_themes.get_item_text(index)
	
	if item_name in Global.themes:
		for f in range(  Global.themes[item_name].FEATURES.size()  ):
			features_theme.get_child(f).get_node("Hbox/Description/Label").text =Global.themes[item_name].FEATURES[f]
			
		for d in range(  Global.themes[item_name].DANGERS.size()  ):
			dangers_theme.get_child(d).get_node("Hbox/Description/Label").text = Global.themes[item_name].DANGERS[d]
		
		description_theme.text = Global.themes[item_name].DESCRIPTION
		table_theme.show()
	
	else:
		table_theme.hide()

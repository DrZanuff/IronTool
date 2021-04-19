extends MarginContainer

onready var list_themes = $SiteBody/ThemeDomains/Body/HBody/Theme/VBox/ThemeSelect/HBox/Themes
onready var features_theme = $SiteBody/ThemeDomains/Body/HBody/Theme/VBox/Table/Body/FeatureTable/List
onready var dangers_theme = $SiteBody/ThemeDomains/Body/HBody/Theme/VBox/Table/Body/DangersTable/List
onready var table_theme =  $SiteBody/ThemeDomains/Body/HBody/Theme/VBox/Table
onready var description_theme = $SiteBody/ThemeDomains/Body/HBody/Theme/VBox/Table/Body/PlaceDescription/Place

onready var list_domains = $SiteBody/ThemeDomains/Body/HBody/Domain/VBox/DomainSelect/HBox/Domains
onready var features_domain = $SiteBody/ThemeDomains/Body/HBody/Domain/VBox/Table/Body/FeatureTable/List
onready var dangers_domain = $SiteBody/ThemeDomains/Body/HBody/Domain/VBox/Table/Body/DangersTable/List
onready var table_domain =  $SiteBody/ThemeDomains/Body/HBody/Domain/VBox/Table
onready var description_domain = $SiteBody/ThemeDomains/Body/HBody/Domain/VBox/Table/Body/DomainDescription/Domain

func _on_BtnDetails_toggled(button_pressed: bool) -> void:
	$SiteBody/Details.visible = button_pressed

func _ready() -> void:
	for t in Global.themes:
		list_themes.add_item(t)
	
	for d in Global.domains:
		list_domains.add_item(d)


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
	check_selection()


func _on_Domains_item_selected(index: int) -> void:
	var item_name = list_domains.get_item_text(index)
	
	if item_name in Global.domains:
		for f in range(  Global.domains[item_name].FEATURES.size()  ):
			features_domain.get_child(f).get_node("Hbox/Description/Label").text =Global.domains[item_name].FEATURES[f]
			
		for d in range(  Global.domains[item_name].DANGERS.size()  ):
			dangers_domain.get_child(d).get_node("Hbox/Description/Label").text = Global.domains[item_name].DANGERS[d]
		
		description_domain.text = Global.domains[item_name].DESCRIPTION
		table_domain.show()
	
	else:
		table_domain.hide()
	check_selection()

func check_selection():
#	$SiteBody/ThemeDomains/Body/Rolls/HBoxContainer/BtnFeature.disabled = (list_domains.selected != 0 and list_themes.selected != 0)
#	$SiteBody/ThemeDomains/Body/Rolls/HBoxContainer/BtnDanger.disabled = (list_domains.selected != 0 and list_themes.selected != 0)
	if list_domains.selected == 0 or list_themes.selected == 0:
		$SiteBody/ThemeDomains/Body/Rolls/HBoxContainer/BtnFeature.disabled = true
		$SiteBody/ThemeDomains/Body/Rolls/HBoxContainer/BtnDanger.disabled = true
	else:
		$SiteBody/ThemeDomains/Body/Rolls/HBoxContainer/BtnFeature.disabled = false
		$SiteBody/ThemeDomains/Body/Rolls/HBoxContainer/BtnDanger.disabled = false

func _on_BtnTheme_pressed() -> void:
	randomize()
	var array = []
	for i in range(Global.themes.size()):
		array.push_back(i)
	
	array.push_back(Global.themes.size())
	array.erase(list_themes.selected)
	array.erase(0)

	array.shuffle()

	list_themes.select(array[0])
	_on_Themes_item_selected(array[0])


func _on_BtnDomain_pressed() -> void:
	randomize()
	var array = []
	for i in range(Global.domains.size()):
		array.push_back(i)
	
	array.push_back(Global.domains.size())
	array.erase(list_domains.selected)
	array.erase(0)

	array.shuffle()

	list_domains.select(array[0])
	_on_Domains_item_selected(array[0])

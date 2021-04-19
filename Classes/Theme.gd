extends Resource

class_name Themes

export (String) var theme_name
export (String) var description
export (Array,String) var features
export (Array,String) var dangers

func get_data_as_object():
	var data = {
		"NAME"        : theme_name,
		"DESCRIPTION" : description,
		"FEATURES"    : features,
		"DANGERS"     : dangers,
	}
	return data

func get_theme_name():
	return theme_name

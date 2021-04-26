class_name Assets extends Resource


export (String) var type
export (String) var asset_name
export (String,MULTILINE) var data

func get_data_as_object():
	var asset_data = {
		"type" : type,
		"asset_name" : asset_name,
		"data" : data
	}
	
	return asset_data

"""
property
Eg. (Name: _______)

text
(Just Text)

skill
(Checkbox, SkillName , Description, property)

track

named_track
Eg. (Light Armor, Gear for War)

render topics and bold, italic
"""
